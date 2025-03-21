DECLARE @driverIDCursor CURSOR;
DECLARE @driverID INT;
DECLARE @count INT = 0
SET NOCOUNT ON
BEGIN
    SET @driverIDCursor = CURSOR
    FOR
    select DriverID from Drivers where Name like '%Mcgrath%'


    OPEN @driverIDCursor
    FETCH next FROM @driverIDCursor INTO @driverID
    WHILE @@FETCH_STATUS = 0
      BEGIN
          exec RS_DeleteDriver @driverID

          FETCH next FROM @driverIDCursor INTO @driverID
      END;
    CLOSE @driverIDCursor;
    DEALLOCATE @driverIDCursor;
END; 
