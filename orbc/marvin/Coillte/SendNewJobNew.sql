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

DECLARE @nNewTripID VARCHAR(10) = CAST((@nLastTripID + 1) AS VARCHAR(10))

DECLARE @sXMLString NVARCHAR(MAX) = '<m s="1"><fm id="1030116" v="3" d="New Job Received - Please click on flag icon to view job"><t>' + @sFormattedDateString + '</t></fm><trip id="' + @nNewTripID + '" chron="true" forceorder="true" description="TRP/TTD 2877756 CK16/H0025 TBA [P SS 3.0]" lock="True"><td>' + @sFormattedDateString2 + '</td><journeyNumber>568848</journeyNumber><stop index="0" skip="0" id="' + @uGUID + '" db="true" auto="true" arm="true" at="2020-02-17 00:00:01" ao="False" lock="true"><title>Loading Area - CK16/H0025/99 [G]</title><details>TRP/TTD 2877756 CK16/H0025 TBA [P SS 3.0]</details><eta>' + @sFormattedDateString2 + '</eta><trp n="TRP/TTD">2877757</trp><mr n="MR Number">004</mr><certNo n="Cert No">CertReg:SA-FM/COC-000706 FSC 100%  (Coillte To SmartPly Europe DAC)</certNo><lat>51.791777</lat><long>-8.640066</long><nr>0.001</nr><pr>2.5</pr><ar>0.5</ar><cr>0.7</cr><cra d="3600" h="true">1.2</cra><asd>60</asd><crsd>0</crsd><cd>10800</cd><wsxqueueid h="true">3695725</wsxqueueid><trpnum h="true">2877756 - CK16/H0025/99</trpnum><cust h="true">OSB - Smartply Europe Ltd</cust><statusStart h="true">R</statusStart><statusProx h="true">X</statusProx><statusArrive h="true">W</statusArrive><statusComplete h="true">L</statusComplete><origgroupcode h="true"/><origproduct h="true">P - Pulp<di type="biglist"><ty>product</ty><t>P</t><d>P - Pulp</d><rt/></di>
			</origproduct><origdestination h="true">TBA - Ballina Railhead</origdestination><origspecies h="true">SS - Sitka Spruce</origspecies><origlength h="true">3.0</origlength><origstaging h="true">NO (SELECT IF STAGING)<di type="biglist"><ty>staging</ty><t>NO (SELECT IF STAGING)</t><d>NO (SELECT IF STAGING)</d><rt/></di>
				<di type="biglist"><ty>staging</ty><t>STG-DUN-10 - Newmarket</t><d>STG-DUN-10 - Newmarket</d><rt/></di>
				<di type="biglist"><ty>staging</ty><t>STG-DUN-11 - Chipper Van</t><d>STG-DUN-11 - Chipper Van</d><rt/></di>
				<di type="biglist"><ty>staging</ty><t>STG-DUN-12 - Beet Factory</t><d>STG-DUN-12 - Beet Factory</d><rt/></di>
				<di type="biglist"><ty>staging</ty><t>STG-DUN-13 - Kildorrery</t><d>STG-DUN-13 - Kildorrery</d><rt/></di>
				<di type="biglist"><ty>staging</ty><t>STG-DUN-14 - Castlehyde</t><d>STG-DUN-14 - Castlehyde</d><rt/></di>
				<di type="biglist"><ty>staging</ty><t>STG-DUN-15 - Fermoy Amber Station</t><d>STG-DUN-15 - Fermoy Amber Station</d><rt/></di>
				<di type="biglist"><ty>staging</ty><t>STG-DUN-16 - Farnanes</t><d>STG-DUN-16 - Farnanes</d><rt/></di>
				<di type="biglist"><ty>staging</ty><t>STG-L-01 - Kilworth</t><d>STG-L-01 - Kilworth</d><rt/></di>
				<di type="biglist"><ty>staging</ty><t>STG-LB-12 - Piltown Base</t><d>STG-LB-12 - Piltown Base</d><rt/></di>
				<di type="biglist"><ty>staging</ty><t>STG-LMC-13 - Kilworth</t><d>STG-LMC-13 - Kilworth</d><rt/></di>
				<di type="biglist"><ty>staging</ty><t>STG-LMT-01 - Liams Base</t><d>STG-LMT-01 - Liams Base</d><rt/></di>
				<di type="biglist"><ty>staging</ty><t>STG-PB - Peader Barker Base</t><d>STG-PB - Peader Barker Base</d><rt/></di>
				<di type="biglist"><ty>staging</ty><t>STG-PB-03 - Barker Yard Ennis Staging Bay</t><d>STG-PB-03 - Barker Yard Ennis Staging Bay</d><rt/></di>
				<di type="biglist"><ty>staging</ty><t>STG-PT-05 - Old Sawmill Cong</t><d>STG-PT-05 - Old Sawmill Cong</d><rt/></di>
				<di type="biglist"><ty>staging</ty><t>STG-PT-08 - Recess Village Staging Bay</t><d>STG-PT-08 - Recess Village Staging Bay</d><rt/></di>
				<di type="biglist"><ty>staging</ty><t>STG-TOT-01 - Tottenham Timber Tullamore</t><d>STG-TOT-01 - Tottenham Timber Tullamore</d><rt/></di>
			</origstaging><origtrailer h="true">AFL1<di type="biglist"><ty>trailer</ty><t>AFL1</t><d>AFL1</d></di>
			</origtrailer><origovernight h="true">No<di type="biglist"><ty>overnight</ty><t>NO</t><d>No</d><rt/></di>
				<di type="biglist"><ty>overnight</ty><t>YES</t><d>Yes</d><rt/></di>
			</origovernight><a id="0" s="s"><s id="1030118" v="18" ui="1"/></a><a id="1" s="p"><s id="1030119" v="7" ui="1"/></a><a id="2" s="a"><s id="1030120" v="7" ui="1"/></a><a id="4" s="c"><s id="1030121" v="7" ui="1"/></a></stop><stop index="1" skip="0" id="' + @uGUID2 + '" db="true" auto="true" arm="true" ao="False" lock="true"><title>Destination - TBA Ballina Railhead</title><details>TRP/TTD 2877756 CK16/H0025 TBA [P SS 3.0]</details><eta>' + @sFormattedDateString2 + '</eta><trp n="TRP/TTD">2877757</trp><mr n="MR Number">004</mr><certNo n="Cert No">CertReg:SA-FM/COC-000706 FSC 100%  (Coillte To SmartPly Europe DAC)</certNo><lat>54.10638</lat><long>-9.163967</long><nr>0.001</nr><pr>5</pr><ar>0.25</ar><cr>0.3</cr><cra d="7200" h="true">0.35</cra><asd>10</asd><crsd>0</crsd><cd>0</cd><wsxqueueid h="true">3695724</wsxqueueid><origgrouplist><di type="biglist"><ty>grouplist</ty><t>TBA_DEF</t><d>TBA_DEF</d></di><di type="biglist"><ty>grouplist</ty><t>TBA19042</t><d>TBA19042</d></di><di type="biglist"><ty>grouplist</ty><t>TBA19043</t><d>TBA19043</d></di><di type="biglist"><ty>grouplist</ty><t>TBA19045</t><d>TBA19045</d></di><di type="biglist"><ty>grouplist</ty><t>TBA19046</t><d>TBA19046</d></di><di type="biglist"><ty>grouplist</ty><t>TBA19047</t><d>TBA19047</d></di><di type="biglist"><ty>grouplist</ty><t>TBA19048</t><d>TBA19048</d></di><di type="biglist"><ty>grouplist</ty><t>TBA19049</t><d>TBA19049</d></di></origgrouplist><trpnum h="true">2877756</trpnum><origweighbdkt h="true">Not Required</origweighbdkt><cust h="true">OSB - Smartply Europe Ltd</cust><statusStart h="true">L</statusStart><statusProx h="true">Y</statusProx><statusArrive h="true">A</statusArrive><statusComplete h="true">E</statusComplete><a id="0" s="p"><s id="1030119" v="7" ui="1"/></a><a id="1" s="a"><s id="1030120" v="7" ui="1"/></a><a id="2" s="a"><s id="1030135" v="7" ui="4"/></a><a id="3" s="c"><s id="1030121" v="7" ui="1"/></a></stop></trip></m>'

EXEC dbo.EX_SendFormMessage 10, 'Test', @dtTimeStamp, 1030116, 3, 1, @sXMLString, @nMessageID