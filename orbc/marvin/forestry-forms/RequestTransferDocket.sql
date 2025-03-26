--Step 1. Send Request Transfer Docket using the SQL below:
 
DECLARE @dtTimeStamp DATETIME = GETUTCDATE()
DECLARE @nMessageID INT = NULL
DECLARE @sFormattedDateString NVARCHAR(MAX) = CAST(FORMAT(GETUTCDATE(), 'MM/dd/yyyy hh:mm:ss') AS NVARCHAR(MAX))
DECLARE @sXMLString NVARCHAR(MAX) = '<m s="1"><fm id="1030167" v="3"><f>CK16 - Kilmurry</f><f>H0025</f><t>' + @sFormattedDateString + '</t></fm></m>'
DECLARE @uID UNIQUEIDENTIFIER = NEWID()
EXEC dbo.M_CreateIncomingFormMessage 7430933, @dtTimeStamp, @uID, 1030167, 3, 1, @sXMLString, @nMessageID
 
--Step 2. Execute the following response to the above form:
 
DECLARE @dtTimeStamp DATETIME = GETUTCDATE()
DECLARE @sFormattedDateString NVARCHAR(MAX) = CAST(FORMAT(GETUTCDATE(), 'MM/dd/yyyy hh:mm:ss') AS NVARCHAR(MAX))
DECLARE @nMessageID INT = NULL
DECLARE @sXMLString1 VARCHAR(MAX) = '<m s="1"><fm id="1030169" v="5" d="Additional Information Required"><t>' + @sFormattedDateString + '</t><f>CK16 - H0025</f><f><di type="biglist"><ty>product</ty><t>defaultp</t><d>B - Brash</d></di><di type="biglist"><ty>product</ty><t>defaultp</t><d>E - Energywood</d></di><di type="biglist"><ty>product</ty><t>defaultp</t><d>F - FullPole</d></di><di type="biglist"><ty>product</ty><t>defaultp</t><d>H - Hurley Ash</d></di>'
DECLARE @sXMLString2 VARCHAR(MAX) = '<di type="biglist"><ty>product</ty><t>defaultp</t><d>K - Stake</d></di><di type="biglist"><ty>product</ty><t>defaultp</t><d>L - Pallet</d></di><di type="biglist"><ty>product</ty><t>defaultp</t><d>P - Pulp</d></di><di type="biglist"><ty>product</ty><t>defaultp</t><d>S - Sawlog</d></di><di type="biglist"><ty>product</ty><t>defaultp</t><d>W - Firewood</d></di></f><f><di type="biglist"><ty>transbay</ty><t>defaultd</t><d>LRY-LDNG - Lorry Loading</d><rt>defaultp</rt></di><di type="biglist"><ty>transbay</ty><t>defaultd</t><d>MACH-MOVE - Machinery Move</d><rt>defaultp</rt></di></f><f /><f /><f>AFL1<di type="biglist"><ty>trailer</ty><t>AFL1</t><d>AFL1</d></di></f><f>CK16</f><f>H0025</f><f>3695928</f><ui>1</ui></fm></m>'
DECLARE @sString2 VARCHAR(MAX) = @sXMLString1 + @sXMLString2
EXEC dbo.EX_SendFormMessage 430, 'Test', @dtTimeStamp, 1030169, 5, 1, @sString2, @nMessageID
 
--Step 3. Respond from the form with the following Information (Job Information)
--Forest-HU: CK16 - H0025
--Product: Pulp
--Destination: MACH-MOVE - Machinery Move
--Species: SS
--Length: 3.1
--Collection Date: Some time in the future
 
DECLARE @dtTimeStamp DATETIME = GETUTCDATE()
DECLARE @nMessageID INT = NULL
DECLARE @sFormattedDateString NVARCHAR(MAX) = CAST(FORMAT(GETUTCDATE(), 'MM/dd/yyyy hh:mm:ss') AS NVARCHAR(MAX))
DECLARE @sXMLString NVARCHAR(MAX) = '<m s="1"><fm id="1030170" v="3"><f>CK16 - H0025</f><f>P - Pulp</f><f>MACH-MOVE - Machinery Move</f><f>SS - Sitka Spruce</f><f>3.1</f><f>0219</f><f>1006</f><f>AFL1</f><f>CK16</f><f>H0025</f><f>3695928</f><t>' + @sFormattedDateString + '</t></fm></m>'
EXEC dbo.M_CreateIncomingMessage 7430933, @dtTimeStamp, NULL, NULL, @sXMLString, @nMessageID
 
--Step 4. Execute the following response to the above form:
 
DECLARE @dtTimeStamp DATETIME = GETUTCDATE()
DECLARE @sFormattedDateString NVARCHAR(MAX) = CAST(FORMAT(GETUTCDATE(), 'MM/dd/yyyy hh:mm:ss') AS NVARCHAR(MAX))
DECLARE @nMessageID INT = NULL
DECLARE @sXMLString NVARCHAR(MAX) = '<m s="1"><fm id="1030177" v="3" d="Job Confirmation Required"><t>' + @sFormattedDateString + '</t><f>CK16 - H0025</f><f>99 - Default</f><f /><f>MM - UNKN - 1.0 to MACH-MOVE</f><f>AFL1</f><f /><f>19-02-2020 10:06AM</f><f /><f>3695930</f><f>Yes<i>Yes</i><i>No</i></f><ui>3</ui></fm></m>'
EXEC dbo.EX_SendFormMessage 430, 'Test', @dtTimeStamp, 1030177, 3, 1, @sXMLString, @nMessageID
 
--Step 5. Respond to the above form by running the following SQL:
 
DECLARE @nLastTripID INT
SELECT TOP 1 @nLastTripID = CAST(Message AS XML).value('m[1]/trip[1]/@id', 'nvarchar(max)')
FROM EX_OutgoingFormMessages
WHERE Message LIKE '%New Job Received - Please click on flag icon to view job%'
ORDER BY CreationTime DESC
 
DECLARE @dtTimeStamp DATETIME = GETUTCDATE()
DECLARE @sFormattedDateString NVARCHAR(MAX) = CAST(FORMAT(GETUTCDATE(), 'MM/dd/yyyy hh:mm:ss') AS NVARCHAR(MAX))
DECLARE @nMessageID INT = NULL
DECLARE @sXMLString NVARCHAR(MAX) = '<m s="1"><fm id="1030115" v="9"><f>Yes</f><f>' + CAST((@nLastTripID + 1) AS VARCHAR(10)) + '</f><t>' + @sFormattedDateString + '</t></fm></m>'
EXEC dbo.M_CreateIncomingMessage 7430933, @dtTimeStamp, NULL, NULL, @sXMLString, @nMessageID
 
--Step 6. Execute the following SQL to recieve a Job:
 
DECLARE @dtTimeStamp DATETIME = GETUTCDATE()
DECLARE @sFormattedDateString NVARCHAR(MAX) = CAST(FORMAT(GETUTCDATE(), 'MM/dd/yyyy hh:mm:ss') AS NVARCHAR(MAX))
DECLARE @sFormattedDateString2 NVARCHAR(MAX) = CAST(FORMAT(GETUTCDATE(), 'yyyy-MM-dd hh:mm:ss') AS NVARCHAR(MAX))
DECLARE @uGUID VARCHAR(36) = CAST(NEWID() AS VARCHAR(36))
DECLARE @uGUID2 VARCHAR(36) = CAST(NEWID() AS VARCHAR(36))
DECLARE @nMessageID INT = NULL
 
DECLARE @nLastTripID INT
SELECT TOP 1 @nLastTripID = CAST(Message AS XML).value('m[1]/trip[1]/@id', 'nvarchar(max)')
FROM EX_OutgoingFormMessages
WHERE Message LIKE '%New Job Received - Please click on flag icon to view job%'
ORDER BY CreationTime DESC
 
DECLARE @sXMLString NVARCHAR(MAX) = '<m s="1"><fm id="1030116" v="3" d="New Job Received – Please click on flag icon to view job. Note: Destination does not have an established geofence, manual update of job status required for this stop"><t>' + @sFormattedDateString2 + '</t></fm>
<trip id="' + CAST((@nLastTripID + 1) AS VARCHAR(10)) + '" chron="true" forceorder="true" description="TRP/TTD 141465 CK16/H0025 MACH-MOVE [MM UNKN 1.0]" lock="True"><td>' + @sFormattedDateString2 + '</td><journeyNumber>568886</journeyNumber>
<stop index="0" skip="0" id="' + @uGUID + '" db="true" auto="true" arm="true" at="2020-02-19 00:00:01" ao="False" lock="true"><title>Loading Area - CK16/H0025/99 [G]</title>
<details>TRP/TTD 141465 CK16/H0025 MACH-MOVE [MM UNKN 1.0]</details><eta>2020-02-19 10:06:00</eta><trp n="TRP/TTD">141465</trp><mr n="MR Number" /><certNo n="Cert No">Null</certNo><lat>51.791777</lat><long>-8.640066</long>
<nr>0.001</nr><pr>2.5</pr><ar>0.5</ar><cr>0.7</cr><cra d="3600" h="true">1.2</cra><asd>60</asd><crsd>0</crsd><cd>10800</cd><wsxqueueid h="true">3695932</wsxqueueid><trpnum h="true">141465 - CK16/H0025/99</trpnum>
<cust h="true">TRANSFER</cust><statusStart h="true">R</statusStart><statusProx h="true">X</statusProx><statusArrive h="true">W</statusArrive><statusComplete h="true">L</statusComplete><origgroupcode h="true" />
<origproduct h="true">MM - Machinery Move<di type="biglist"><ty>product</ty><t>defaultp</t><d>S - Sawlog</d><rt /></di><di type="biglist"><ty>product</ty><t>defaultp</t><d>P - Pulp</d><rt /></di>
<di type="biglist"><ty>product</ty><t>defaultp</t><d>L - Pallet</d><rt /></di><di type="biglist"><ty>product</ty><t>defaultp</t><d>K - Stake</d><rt /></di><di type="biglist"><ty>product</ty><t>defaultp</t>
<d>E - Energywood</d><rt /></di><di type="biglist"><ty>product</ty><t>defaultp</t><d>W - Firewood</d><rt /></di><di type="biglist"><ty>product</ty><t>defaultp</t><d>F - FullPole</d><rt /></di>
<di type="biglist"><ty>product</ty><t>defaultp</t><d>B - Brash</d><rt /></di><di type="biglist"><ty>product</ty><t>defaultp</t><d>UNKN - Unknown</d><rt /></di><di type="biglist"><ty>product</ty><t>defaultp</t>
<d>H - Hurley Ash</d><rt /></di></origproduct><origdestination h="true">MACH-MOVE - Machinery Move<di type="biglist"><ty>destination</ty><t>defaultd</t><d>LRY-LDNG - Lorry Loading</d><rt>defaultp</rt></di>
<di type="biglist"><ty>destination</ty><t>defaultd</t><d>MACH-MOVE - Machinery Move</d><rt>defaultp</rt></di></origdestination><origspecies h="true">UNKN - Unknown</origspecies><origlength h="true">1.0</origlength>
<origstaging h="true">NO (SELECT IF STAGING)<di type="biglist"><ty>staging</ty><t>NO (SELECT IF STAGING)</t><d>NO (SELECT IF STAGING)</d><rt /></di>
</origstaging><origtrailer h="true">AFL1<di type="biglist"><ty>trailer</ty><t>AFL1</t><d>AFL1</d></di></origtrailer><origovernight h="true">No<di type="biglist"><ty>overnight</ty><t>NO</t><d>No</d><rt /></di>
<di type="biglist"><ty>overnight</ty><t>YES</t><d>Yes</d><rt /></di></origovernight><a id="0" s="s"><s id="1030118" v="18" ui="1" /></a><a id="1" s="p">
<s id="1030119" v="7" ui="1" /></a><a id="2" s="a"><s id="1030120" v="7" ui="1" /></a><a id="4" s="c"><s id="1030121" v="7" ui="1" /></a></stop>
<stop index="1" skip="0" id="' + @uGUID2 + '" db="true" auto="true" arm="true" ao="False" lock="true"><title>Destination - MACH-MOVE Machinery Move</title>
<details>TRP/TTD 141465 CK16/H0025 MACH-MOVE [MM UNKN 1.0]</details><eta>2020-02-19 12:06:00</eta><trp n="TRP/TTD">141465</trp><mr n="MR Number" /><certNo n="Cert No">Null</certNo><lat>2</lat><long>2</long>
<nr>0.001</nr><pr>4.75</pr><ar>0.25</ar><cr>0.3</cr><asd>0</asd><crsd>0</crsd><cd>7200</cd><wsxqueueid h="true">3695932</wsxqueueid><origgrouplist>Not Required<i>Not Required</i></origgrouplist>
<trpnum h="true">141465</trpnum><origweighbdkt h="true">Not Required</origweighbdkt><cust h="true">TRANSFER</cust><statusStart h="true">L</statusStart><statusProx h="true">Y</statusProx><statusArrive h="true">A</statusArrive>
<statusComplete h="true">E</statusComplete><a id="0" s="p"><s id="1030119" v="7" ui="1" /></a><a id="1" s="a"><s id="1030120" v="7" ui="1" /></a><a id="2" s="c"><s id="1030121" v="7" ui="1" /></a></stop></trip></m>'
 
EXEC dbo.EX_SendFormMessage 430, 'Test', @dtTimeStamp, 1030116, 3, 1, @sXMLString, @nMessageID