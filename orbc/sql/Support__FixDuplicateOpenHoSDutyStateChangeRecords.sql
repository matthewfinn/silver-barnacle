CREATE PROCEDURE [dbo].[Support__FixDuplicateOpenHoSDutyStateChangeRecords](
  @nDriverID INT = NULL
)
AS
DECLARE @dutyStateChangeIDCursor CURSOR;
DECLARE @driverID INT;
DECLARE @dutyStateChangeID UNIQUEIDENTIFIER;
DECLARE @startTime DATETIME;
DECLARE @originalStartTime DATETIME;
DECLARE @updatedTime DATETIME;
DECLARE @count INT = 0

SET NOCOUNT ON
BEGIN
    SET @dutyStateChangeIDCursor = CURSOR
    FOR
    /*  
        We want all records from the HoS_DutyStateChanges table where the EndTime is null (meaning it's likely to be treated a the current duty in Fleetmanager)
        but the corresponding ELD event has been marked as Inactive 
        i.e. RecordStatus value is 2 - Inactive – Changed, this record status mapping can be seen in the ELD.EventRecordStatuses table
        Added some safety by cross referencing the ELD.EventBatchEditDetails as any event deactivited in the scenario we expect should have an associated event in this table
    */
    SELECT H.DutyStateChangeID
    FROM   HoS_DutyStateChanges H WITH(nolock)
           INNER JOIN Drivers D WITH(nolock)
                   ON D.DriverID = H.DriverID
           INNER JOIN ELD.EventToDutyStateChangeMap MAP WITH(nolock)
                   ON MAP.DutyStateChangeID = H.DutyStateChangeID
           INNER JOIN ELD.Events E WITH(nolock)
                   ON E.EventID = MAP.EventID
          INNER JOIN ELD.EventBatchEditDetails EBE ON EBE.DeactivatedEventID = E.EventID
    WHERE  H.EndTime IS NULL
           AND E.RecordStatus = 2
           AND H.DriverID = ISNULL(@nDriverID, H.DriverID)
           ORDER BY H.DriverID DESC

    OPEN @dutyStateChangeIDCursor
    FETCH next FROM @dutyStateChangeIDCursor INTO @dutyStateChangeID
    WHILE @@FETCH_STATUS = 0
      BEGIN
          SELECT @dutyStateChangeID = DutyStateChangeID,
                 @startTime = StartTime,
                 @originalStartTime = OriginalStartTime,
                 @driverID = DriverID
          FROM   HoS_DutyStateChanges WITH (nolock)
          WHERE  DutyStateChangeID = @dutyStateChangeID

          SET @updatedTime = ISNULL(@originalStartTime, @startTime)

          IF @dutyStateChangeID IS NOT NULL
             AND @updatedTime IS NOT NULL
            BEGIN
                BEGIN TRANSACTION [Tran1]

                BEGIN TRY
                    /*
                      Update the HoS_DutyStateChange record to have it's StartTime and EndTime to be the OriginalStartTime,
                      This should have happened in the first place.
                      If we don't have an OriginalStartTime value we still want to 'zero' out the DutyStateChange record, so we use the StartTime value,
                      as having a record with a null EndTime and Inactive corresponding ELD.Event doesn't make any sense
                    */
                    UPDATE HoS_DutyStateChanges
                    SET    StartTime = ISNULL(@originalStartTime, @startTime),
                           EndTime = ISNULL(@originalStartTime, @startTime),
                           AutoEditedDuringBackfill = 1
                    WHERE  DutyStateChangeID = @dutyStateChangeID

                    COMMIT TRANSACTION [Tran1]
                -- Commit the transaction if nothing falls over
                END TRY

                BEGIN CATCH
                    ROLLBACK TRANSACTION [Tran1]
                -- Roll it back, something fell over
                END CATCH

                PRINT 'Updated DutyStateChangeID '
                      + CONVERT(NVARCHAR(36), @dutyStateChangeID)
                      + ' for DriverID '
                      + CONVERT(NVARCHAR, @driverID)
                      + ' to have a StartTime and EndTime of '
                      + CONVERT(VARCHAR, @updatedTime, 120)
                      + ' where the StartTime was '
                      + CONVERT(VARCHAR, @startTime, 120)
                      + ' and OriginalStartTime was '
                      + ISNULL(CONVERT(VARCHAR, @originalStartTime, 120), 'Empty')
                SET @count = @count + 1
            END
          ELSE
            BEGIN
                PRINT 'Did nothing to DutyStateChangeID '
                      + CONVERT(NVARCHAR(36), @dutyStateChangeID)
                      + ' for DriverID '
                      + CONVERT(NVARCHAR, @driverID)
            END

          FETCH next FROM @dutyStateChangeIDCursor INTO @dutyStateChangeID
      END;

    CLOSE @dutyStateChangeIDCursor;
    DEALLOCATE @dutyStateChangeIDCursor;
    
    PRINT 'Total Number of records updated ' + CONVERT(NVARCHAR, @count)
END; 
GO