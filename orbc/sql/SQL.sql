View procedure
------------------------------------------------
sp_helptext 'proc_name'

View db processes
------------------------------------------------
sp_who2

re-index db table
------------------------------------------------
dbcc dbreindex(HoS_DutyCheckpoints)

Query to print all DAKO customers on a DB Server
------------------------------------------------
exec sysmon.dbo.foreachrcomdb 'use [{DB}];  
IF(EXISTS (SELECT TOP 1 I.ConfigKey FROM (SELECT TOP 1 * FROM Configuration WHERE ConfigKey = ''FEATURE_DAKO'' ORDER BY TimeStamp DESC) I WHERE ValueBit = 1))
BEGIN
       PRINT DB_NAME()
END'

Check device type of a fleet
------------------------------------------------
select Model, MostRecentActivity from AndroidDevices
order by MostRecentActivity desc

Loop and execute
------------------------------------------------
DECLARE @MyCursor CURSOR;
DECLARE @MyField INT;
BEGIN
    SET @MyCursor = CURSOR FOR
    select top 3 TripInternalID from InCabTrips
        where VehicleID = 3717 and Data like '%description="Dublin Port"%'

    OPEN @MyCursor 
    FETCH NEXT FROM @MyCursor 
    INTO @MyField

    WHILE @@FETCH_STATUS = 0
    BEGIN
    
    exec dbo.EX_DeleteJob_v2 @MyField
      /*
         YOUR ALGORITHM GOES HERE   
      */
      FETCH NEXT FROM @MyCursor 
      INTO @MyField 
    END; 

    CLOSE @MyCursor ;
    DEALLOCATE @MyCursor;
END;

