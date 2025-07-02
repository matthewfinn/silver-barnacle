DECLARE @unlinkedEventCursor CURSOR;
DECLARE @personID INT;
DECLARE @stateChangeID UNIQUEIDENTIFIER;
DECLARE @stateDescription VARCHAR(40);
DECLARE @startTime DATETIME;
DECLARE @endTime DATETIME;
DECLARE @generationNumber TIMESTAMP;
DECLARE @countOverlaps INT = 0
DECLARE @countInfringmentsBefore INT = 0
DECLARE @countInfringmentsAfter INT = 0
DECLARE @unlinkedStateStillExists BIT = 0

DECLARE @queryFrom DATETIME = DATEADD(month, -3, GETUTCDATE())
DECLARE @queryTo DATETIME = GETUTCDATE()
DECLARE @queryPersonID INT = 186 -- example value

SET NOCOUNT ON
BEGIN
    SET @unlinkedEventCursor = CURSOR
    FOR
    -- Get non zero duration state changes that aren't linked to an event within the timerange applied above for the person specified
    SELECT S.Description, SC.DriverID, SC.StateChangeID, SC.StartTime, SC.EndTime FROM StateChanges SC WITH(NOLOCK)
	  INNER JOIN States S ON S.StateID = SC.StateID
    WHERE StateChangeID NOT IN (SELECT StateChangeID FROM StateChangeEventMap WITH(NOLOCK))
    AND DATEDIFF(minute, StartTime, EndTime) > 0
    AND StartTime BETWEEN @queryFrom AND @queryTo
    AND PersonID = @queryPersonID
  	ORDER BY PersonID, StartTime ASC
    
    -- Get the number of infringements this person has within the time period
    SELECT @countInfringmentsBefore = COUNT(*) FROM Infringements WITH(NOLOCK)
    WHERE PersonID = @queryPersonID
    AND Started BETWEEN @queryFrom AND @queryTo
    PRINT 'Number of Infringements for PersonID '  + CONVERT(NVARCHAR, @queryPersonID) +' is ' + CONVERT(NVARCHAR, @countInfringmentsBefore)

    -- if the person doesn't have any infringements we don't need to fix anything
    IF @countInfringmentsBefore <> 0
    BEGIN
    OPEN @unlinkedEventCursor
    FETCH next FROM @unlinkedEventCursor INTO @stateDescription, @personID, @stateChangeID, @startTime, @endTime
    WHILE @@FETCH_STATUS = 0
      BEGIN
          PRINT 'Found unlinked '
            + CONVERT(NVARCHAR(36), @stateDescription)
		        + ' event with DutyStateChangeID '
            + CONVERT(NVARCHAR(36), @stateChangeID)
            + ' for DriverID '
            + CONVERT(NVARCHAR, @personID)
            + ' where the StartTime was '
            + CONVERT(VARCHAR, @startTime, 120)
            + ' and EndTime was '
            + ISNULL(CONVERT(VARCHAR, @endTime, 120), 'NULL')

			-- check it still exists as it might have been cleaned up after a previous run

            
			-- Get State Changes that are linked to an event and overlaps the strange unlinked one we found
            SELECT @countOverlaps = COUNT(*) FROM StateChanges WITH(NOLOCK) WHERE StateChangeID IN (SELECT StateChangeID FROM StateChangeEventMap WITH(NOLOCK))
            AND DATEDIFF(minute, StartTime, EndTime) > 0
          	AND StateChangeID <> @stateChangeID
            AND StartTime <= @startTime
            AND EndTime = @endTime 
			      AND PersonID = @personID

          PRINT 'Number of overlaps ' + CONVERT(NVARCHAR, @countOverlaps)
          
          IF @countOverlaps <> 0 AND @unlinkedStateStillExists = 1
            BEGIN
                BEGIN TRANSACTION [Tran1]
          
                BEGIN TRY
                     PRINT 'Trying to delete and re-run checkpoints'
                     
                     --Delete the unlinked duty state change as we have a valid one linked to an ELD event that overlaps it
                     DELETE FROM StateChanges
                     WHERE StateChangeID = @stateChangeID
                     AND PersonID = @personID
                     
                     re-run the calculation for checkpoints and infringements
                     EXEC dbo.CalculateCheckpoints @personID, @startTime
                     
                     COMMIT TRANSACTION [Tran1]
                END TRY
          
                BEGIN CATCH
                  -- Roll it back, something fell over
                    ROLLBACK TRANSACTION [Tran1]
                END CATCH
          END
          ELSE IF @countOverlaps > 0 AND @unlinkedStateStillExists = 1
            BEGIN
                PRINT 'Replay option being executed - deleting DutyStateChange records and re-running replay from earliest point that we deem safe'
                
                -- Get a gen number for the first ELD event before the unlinked duty state change, we don't want anything that's been since updated as we might not catch everything then
                SELECT TOP 1 @generationNumber = GenerationNumber FROM Events WITH(NOLOCK)
                AND TimeStamp < @startTime
                AND ISNULL(UpdatedTimeStamp, CreatedOn) < @startTime
                AND PersonID = @personID
                ORDER BY GenerationNumber ASC, TIMESTAMP DESC
                
                PRINT 'Running replay for person from GenerationNumber ' + CONVERT(VARCHAR, @generationNumber)
                
                BEGIN TRANSACTION [Tran1]
                BEGIN TRY
                -- if there's no SC that overlaps we want to try and find an Event from the same time
      		        
                  -- 
                  DELETE FROM StateChanges WHERE PersonID = @personID
                  AND StartTime >= @startTime
                  AND StateChangeID not in (SELECT StateChangeID FROM StateChangeEventMap WITH (NOLOCK)) -- We might we to nuke completely but we'll see
                  -- 
                  EXEC ReplayEventsForPerson @personID, @generationNumber
                  COMMIT TRANSACTION [Tran1]
                END TRY
       
                BEGIN CATCH
                  -- Roll it back, something fell over
                  ROLLBACK TRANSACTION [Tran1]
                END CATCH
            END
			ELSE
				BEGIN
					PRINT 'Unlinked State Change with with StateChangeID '
					+ CONVERT(NVARCHAR(36), @stateChangeID)
				END
		         
            -- check how many infringements the person has after the data fix execution
            SELECT @countInfringmentsAfter = COUNT(*) FROM Infringements WITH(NOLOCK)
		        WHERE PersonID = @queryPersonID
		        AND Started BETWEEN @queryFrom AND @queryTo
		        PRINT 'Number of Infringements After for PersonID '  + CONVERT(NVARCHAR, @queryPersonID) +' is ' + CONVERT(NVARCHAR, @countInfringmentsAfter)
        
        FETCH next FROM @unlinkedEventCursor INTO @stateDescription, @personID, @stateChangeID, @startTime, @endTime
      END;
	  CLOSE @unlinkedEventCursor;
    END -- END if number of overlaps <> 0
    ELSE -- the driver has no infringements in this time period
      BEGIN
        PRINT 'The person has no infringements in this time period so there are no fixes needed'
      END
   DEALLOCATE @unlinkedEventCursor;
END; -- END outer
GO