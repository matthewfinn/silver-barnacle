DECLARE @startTime datetime
DECLARE @personID int
DECLARE @eventID uniqueidentifier

DECLARE EVENT_CURSOR CURSOR FOR

    SELECT 
    StartTime, PersonID, EventID
    FROM TABLE_NAME(DATEADD(month, -1, GETUTCDATE()), GETUTCDATE(), null, null)
    where COLUMN_1 =0 and COLUMN_2 = 0
    and COLUMN_3 = 0

      OPEN EVENT_CURSOR
      FETCH NEXT FROM EVENT_CURSOR INTO @startTime, @vehicleID, @eventID
      WHILE @@FETCH_STATUS =0
      BEGIN
			SET NOCOUNT ON
			PRINT 'Authentication Event'
            SELECT top 1  * from AuthenticationEvents where EventTimeStamp < @startTime
            and PersonID = @personID
            order by EventTimeStamp desc
			PRINT 'Event'
			select EventID, DeviceID, Timestamp from Events with (nolock)
			where EventID = @eventID
			PRINT '____________________________________________________________________________________'

            FETCH NEXT FROM EVENT_CURSOR INTO @startTime, @personID, @eventID
      END

      CLOSE EVENT_CURSOR
      DEALLOCATE EVENT_CURSOR