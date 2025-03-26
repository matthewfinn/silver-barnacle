--Step 1. Request Existing TRP
 
DECLARE @dtTimeStamp DATETIME = GETUTCDATE()
DECLARE @nMessageID INT = NULL
DECLARE @sFormattedDateString NVARCHAR(MAX) = CAST(FORMAT(GETUTCDATE(), 'MM/dd/yyyy hh:mm:ss') AS NVARCHAR(MAX))
DECLARE @sXMLString NVARCHAR(MAX) = '<m s="1"><fm id="1030123" v="4"><t>' + @sFormattedDateString + '</t></fm></m>'
DECLARE @uID UNIQUEIDENTIFIER = NEWID()
EXEC dbo.M_CreateIncomingFormMessage 7430933, @dtTimeStamp, @uID, 1030123, 4, 1, @sXMLString, @nMessageID
 
--Step 2. Execute a Response stating there are no available TRP's
 
DECLARE @dtTimeStamp DATETIME = GETUTCDATE()
DECLARE @sFormattedDateString NVARCHAR(MAX) = CAST(FORMAT(GETUTCDATE(), 'MM/dd/yyyy hh:mm:ss') AS NVARCHAR(MAX))
DECLARE @nMessageID INT = NULL
DECLARE @sXMLString1 VARCHAR(MAX) = '<m s="1"><fm id="1000000" v="1"><t>' + @sFormattedDateString + '</t><f>No available TRP’s.</f><ui>1</ui></fm></m>'
EXEC dbo.EX_SendFormMessage 430, 'Test', @dtTimeStamp, 1000000, 1, 1, @sXMLString1, @nMessageID

select * from IncabFormDefinitions where FormID = 1