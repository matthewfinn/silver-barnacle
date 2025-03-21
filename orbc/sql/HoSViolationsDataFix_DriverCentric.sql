DECLARE @unlinkedEventCursor CURSOR;
DECLARE @driverID INT;
DECLARE @dutyStateChangeID UNIQUEIDENTIFIER;
DECLARE @dutyStateDescription VARCHAR(40);
DECLARE @startTime DATETIME;
DECLARE @endTime DATETIME;
DECLARE @eldGenerationNumber TIMESTAMP;
DECLARE @countOverlaps INT = 0
DECLARE @countInfringmentsBefore INT = 0
DECLARE @countInfringmentsAfter INT = 0
DECLARE @unlinkedDSCStillExists BIT = 0

DECLARE @queryFrom DATETIME = DATEADD(month, -3, GETUTCDATE())
DECLARE @queryTo DATETIME = GETUTCDATE()
DECLARE @queryDriverID INT = 186

SET NOCOUNT ON
BEGIN
    SET @unlinkedEventCursor = CURSOR
    FOR
    -- Get non zero duty state changes that aren't linked to an ELD event within the timerange applied above for the driver specified
    SELECT HDS.Description, H.DriverID, H.DutyStateChangeID, H.StartTime, H.EndTime FROM HoS_DutyStateChanges H WITH(NOLOCK)
	  INNER JOIN HoS_DutyState HDS ON H.DutyStateID = HDS.DutyStateID
    WHERE DutyStateChangeID NOT IN (SELECT DutyStateChangeID FROM ELD.EventToDutyStateChangeMap WITH(NOLOCK))
    AND DATEDIFF(minute, StartTime, EndTime) > 0
    AND StartTime BETWEEN @queryFrom AND @queryTo
    AND DriverID = @queryDriverID
  	ORDER BY DriverID, StartTime ASC
    
    -- Get the number of infringements this driver has within the time period
    SELECT @countInfringmentsBefore = COUNT(*) FROM HoS_Infringements WITH(NOLOCK)
    WHERE DriverID = @queryDriverID
    AND Started BETWEEN @queryFrom AND @queryTo
    PRINT 'Number of Infringements for DriverID '  + CONVERT(NVARCHAR, @queryDriverID) +' is ' + CONVERT(NVARCHAR, @countInfringmentsBefore)

    -- if the driver doesn't have any infringements we don't need to fix anything
    IF @countInfringmentsBefore <> 0
    BEGIN
    OPEN @unlinkedEventCursor
    FETCH next FROM @unlinkedEventCursor INTO @dutyStateDescription, @driverID, @dutyStateChangeID, @startTime, @endTime
    WHILE @@FETCH_STATUS = 0
      BEGIN
          PRINT 'Found unlinked '
            + CONVERT(NVARCHAR(36), @dutyStateDescription)
		        + ' event with DutyStateChangeID '
            + CONVERT(NVARCHAR(36), @dutyStateChangeID)
            + ' for DriverID '
            + CONVERT(NVARCHAR, @driverID)
            + ' where the StartTime was '
            + CONVERT(VARCHAR, @startTime, 120)
            + ' and EndTime was '
            + ISNULL(CONVERT(VARCHAR, @endTime, 120), 'NULL')

			-- check it still exists as it might have been cleaned up after a previous run

            
			-- Get DSCs that is linked to an ELD event and overlaps the strange unlinked one we found 
            SELECT @countOverlaps = COUNT(*) FROM HoS_DutyStateChanges WITH(NOLOCK) WHERE DutyStateChangeID IN (SELECT DutyStateChangeID FROM ELD.EventToDutyStateChangeMap WITH(NOLOCK))
            AND DATEDIFF(minute, StartTime, EndTime) > 0
          	AND DutyStateChangeID <> @dutyStateChangeID
            AND StartTime <= @startTime
            AND EndTime = @endTime 
			      AND DriverID = @driverID 

          PRINT 'Number of overlaps ' + CONVERT(NVARCHAR, @countOverlaps)
          
          IF @countOverlaps <> 0 AND @unlinkedDSCStillExists = 1
            BEGIN
                BEGIN TRANSACTION [Tran1]
          
                BEGIN TRY
                     PRINT 'Trying to delete and re-run checkpoints'
                     
                     --Delete the unlinked duty state change as we have a valid one linked to an ELD event that overlaps it
                     DELETE FROM HoS_DutyStateChanges
                     WHERE DutyStateChangeID = @dutyStateChangeID
                     AND DriverID = @driverID
                     
                     re-run the calculation for HoS checkpoints and infringements 
                     EXEC dbo.HoS_CalculateCheckpointsAndInfringements @driverID, @startTime
                     
                     COMMIT TRANSACTION [Tran1]
                END TRY
          
                BEGIN CATCH
                  -- Roll it back, something fell over
                    ROLLBACK TRANSACTION [Tran1]
                END CATCH
          END
          ELSE IF @countOverlaps > 0 AND @unlinkedDSCStillExists = 1
            BEGIN
                PRINT 'ELD Replay option being executed - deleting HoS_DutyStateChange records and re-running replay from earliest point that we deem safe'
                
                -- Get a gen number for the first ELD event before the unlinked duty state change, we don't want anything that's been since updated as we might not catch everything then
                SELECT TOP 1 @eldGenerationNumber = GenerationNumber FROM ELD.Events WITH(NOLOCK)
                WHERE (EventType = 1 or (EventType = 3 and EventCode != 0)) 
                AND TimeStamp < @startTime
                AND ISNULL(UpdatedTimeStamp, CreatedOn) < @startTime
                AND DriverID = @driverID 
				        AND RecordStatus != 2
                ORDER BY GenerationNumber ASC, TIMESTAMP DESC
                
                PRINT 'Running ELD replay for driver from GenerationNumber ' + CONVERT(VARCHAR, @eldGenerationNumber)
                
                BEGIN TRANSACTION [Tran1]
                BEGIN TRY
                -- if there's no DSC that overlaps we want to try and find an ELD.Event from the same time
      		        
                  -- 
                  DELETE FROM HoS_DutyStateChanges WHERE DriverID = @DriverID
                  AND StartTime >= @startTime
                  AND DutyStateChangeID not in (SELECT DutyStateChangeID FROM ELD.EventToDutyStateChangeMap WITH (NOLOCK)) -- We might we to nuke completely but we'll see
                  -- 
                  EXEC ELD.ReplayELDEventsForDriver @driverID, @eldGenerationNumber
                  COMMIT TRANSACTION [Tran1]
                END TRY
       
                BEGIN CATCH
                  -- Roll it back, something fell over
                  ROLLBACK TRANSACTION [Tran1]
                END CATCH
            END
			ELSE
				BEGIN
					PRINT 'Unlinked Duty State Change with with DutyStateChangeID '
					+ CONVERT(NVARCHAR(36), @dutyStateChangeID)
					+ ' no longer exists. It must have been tidied on a previous run'

				END
		         
            -- check how many infringements the driver has after the data fix execution
            SELECT @countInfringmentsAfter = COUNT(*) FROM HoS_Infringements WITH(NOLOCK)
		        WHERE DriverID = @queryDriverID
		        AND Started BETWEEN @queryFrom AND @queryTo
		        PRINT 'Number of Infringements After for DriverID '  + CONVERT(NVARCHAR, @queryDriverID) +' is ' + CONVERT(NVARCHAR, @countInfringmentsAfter)
        
        FETCH next FROM @unlinkedEventCursor INTO @dutyStateDescription, @driverID, @dutyStateChangeID, @startTime, @endTime
      END;
	  CLOSE @unlinkedEventCursor;
    END -- END if number of overlaps <> 0
    ELSE -- the driver has no infringements in this time period
      BEGIN
        PRINT 'The driver has no infringements in this time period so there are no fixes needed'
      END
   DEALLOCATE @unlinkedEventCursor;
END; -- END outer
GO