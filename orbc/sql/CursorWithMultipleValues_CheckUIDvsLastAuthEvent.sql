DECLARE @startTime datetime
DECLARE @vehicleID int
DECLARE @eventID uniqueidentifier

DECLARE UID_CURSOR CURSOR FOR

    SELECT 
    StartTime, VehicleID, EventID
    FROM RS_ELD_GetELDExceptions(DATEADD(month, -1, GETUTCDATE()), GETUTCDATE(), null, null)
    where Acknowledged =0 and IsPending = 0
    and DurationMinutes = 0 

      OPEN UID_CURSOR
      FETCH NEXT FROM UID_CURSOR INTO @startTime, @vehicleID, @eventID
      WHILE @@FETCH_STATUS =0
      BEGIN
			SET NOCOUNT ON
			PRINT 'Authentication Event'
            SELECT top 1  * from DriverAuthenticationEvents where EventTimeStamp < @startTime
            and VehicleID = @vehicleId
            order by EventTimeStamp desc
			PRINT 'ELD Event'
			select EventID, RCOMDeviceID, Timestamp, NonRoundedTimeStamp, EventCodeDescription from ELD.Events with (nolock)
			where EventID = @eventID
			PRINT '____________________________________________________________________________________'

            FETCH NEXT FROM UID_CURSOR INTO @startTime, @vehicleID, @eventID
      END

      CLOSE UID_CURSOR
      DEALLOCATE UID_CURSOR