DECLARE @personIDCursor CURSOR;
DECLARE @personID INT;
DECLARE @count INT = 0
SET NOCOUNT ON
BEGIN
    SET @personIDCursor = CURSOR
    FOR
    select personID from People where Name like '%test%'


    OPEN @personIDCursor
    FETCH next FROM @personIDCursor INTO @personID
    WHILE @@FETCH_STATUS = 0
      BEGIN
          exec DeletePerson @personID -- Function to delete a record

          FETCH next FROM @personIDCursor INTO @personID
      END;
    CLOSE @personIDCursor;
    DEALLOCATE @personIDCursor;
END; 
