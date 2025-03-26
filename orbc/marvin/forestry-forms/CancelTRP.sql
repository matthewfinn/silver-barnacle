DECLARE @nLastTripID INT
SELECT TOP 1 @nLastTripID = CAST(Message AS XML).value('m[1]/trip[1]/@id', 'nvarchar(max)')
FROM EX_OutgoingFormMessages
WHERE Message LIKE '%New Job Received - Please click on flag icon to view job%'
ORDER BY CreationTime DESC 

DECLARE @dtTimeStamp DATETIME = GETUTCDATE()
DECLARE @nMessageID INT = NULL
DECLARE @sFormattedDateString NVARCHAR(MAX) = CONVERT(VARCHAR(10), GETUTCDATE(), 101) + ' ' + CONVERT(VARCHAR(8), GETUTCDATE(), 108)
PRINT @sFormattedDateString
DECLARE @sXMLString NVARCHAR(MAX) = '<m s="1"><fm id="1030129" v="7"><f>' + CAST((@nLastTripID) AS VARCHAR(10)) + '</f><t>' + @sFormattedDateString + '</t></fm></m>'
DECLARE @uID UNIQUEIDENTIFIER = NEWID()

EXEC dbo.M_CreateIncomingFormMessage 7430933, @dtTimeStamp, @uID, 1030129, 7, 1, @sXMLString, @nMessageID



SELECT CONVERT(VARCHAR(10), GETUTCDATE(), 101) + ' ' + CONVERT(VARCHAR(8), GETUTCDATE(), 108)



DECLARE @dtTimeStamp DATETIME = GETUTCDATE()
DECLARE @nMessageID INT = NULL
DECLARE @sFormattedDateString NVARCHAR(MAX) = CAST(FORMAT(GETUTCDATE(), 'MM/dd/yyyy hh:mm:ss') AS NVARCHAR(MAX))
DECLARE @sXMLString NVARCHAR(MAX) = '<m s="1"><fm id="1030165" v="20"><f>CK16 - Kilmurry</f><f>H0025</f><t>' + @sFormattedDateString + '</t></fm></m>'
DECLARE @uID UNIQUEIDENTIFIER = NEWID()
EXEC dbo.M_CreateIncomingFormMessage 7430933, @dtTimeStamp, @uID, 1030106, 15, 1, @sXMLString, @nMessageID

--Send a Job down to your device with a TRP ID. Use the below SQL to get the Last TRP ID for the Job

DECLARE @nLastTripID INT
SELECT TOP 1 @nLastTripID = CAST(Message AS XML).value('m[1]/trip[1]/@id', 'nvarchar(max)')
FROM EX_OutgoingFormMessages
WHERE Message LIKE '%New Job Received - Please click on flag icon to view job%'
ORDER BY CreationTime DESC 

--Step 1. Send Cancel TRP using the SQL below:

DECLARE @dtTimeStamp DATETIME = GETUTCDATE()
DECLARE @nMessageID INT = NULL
DECLARE @sFormattedDateString NVARCHAR(MAX) = CAST(FORMAT(GETUTCDATE(), 'MM/dd/yyyy hh:mm:ss') AS NVARCHAR(MAX))
DECLARE @sXMLString NVARCHAR(MAX) = '<m s="1"><fm id="1030129" v="7"><f>' + CAST((@nLastTripID) AS VARCHAR(10)) + '</f><t>' + @sFormattedDateString + '</t></fm></m>'
DECLARE @uID UNIQUEIDENTIFIER = NEWID()
EXEC dbo.M_CreateIncomingFormMessage 7430933, @dtTimeStamp, @uID, 1030129, 7, 1, @sXMLString, @nMessageID

--Step 2. Send the Following response to the Cancel TRP to confirm the Cancellation

DECLARE @nLastTripID INT
SELECT TOP 1 @nLastTripID = CAST(Message AS XML).value('m[1]/trip[1]/@id', 'nvarchar(max)')
FROM EX_OutgoingFormMessages
WHERE Message LIKE '%New Job Received - Please click on flag icon to view job%'
ORDER BY CreationTime DESC 

DECLARE @dtTimeStamp DATETIME = GETUTCDATE()
DECLARE @sFormattedDateString NVARCHAR(MAX) = CAST(FORMAT(GETUTCDATE(), 'MM/dd/yyyy hh:mm:ss') AS NVARCHAR(MAX))
DECLARE @nMessageID INT = NULL
DECLARE @sXMLString NVARCHAR(MAX) = '<m s="1"><fm id="1000000" v="1"><t>' + @sFormattedDateString + '</t><f>Your TRP(s) ' + CAST((@nLastTripID) AS VARCHAR(10)) + 'have been cancelled and are no longer valid.</f><ui>1</ui></fm></m>'
EXEC dbo.EX_SendFormMessage 430, 'Test', @dtTimeStamp, 1000000, 1, 1, @sXMLString, @nMessageID