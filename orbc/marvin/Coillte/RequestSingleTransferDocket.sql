--Step 1. Send Request TRP using the SQL below:

DECLARE @dtTimeStamp DATETIME = GETUTCDATE()
DECLARE @nMessageID INT = NULL
DECLARE @sFormattedDateString NVARCHAR(MAX) = CAST(FORMAT(GETUTCDATE(), 'MM/dd/yyyy hh:mm:ss') AS NVARCHAR(MAX))
DECLARE @sXMLString NVARCHAR(MAX) = '<m s="1"><fm id="1030167" v="3"><f>CK16 - Kilmurry</f><f>H0025</f><t>' + @sFormattedDateString + '</t></fm></m>'
DECLARE @uID UNIQUEIDENTIFIER = NEWID()
EXEC dbo.M_CreateIncomingFormMessage 7430933, @dtTimeStamp, @uID, 1030123, 4, 1, @sXMLString, @nMessageID

--Step 2. Send Request TRP using the SQL below:



DECLARE @dtTimeStamp DATETIME = GETUTCDATE()
DECLARE @sFormattedDateString NVARCHAR(MAX) = CAST(FORMAT(GETUTCDATE(), 'MM/dd/yyyy hh:mm:ss') AS NVARCHAR(MAX))
DECLARE @nMessageID INT = NULL
DECLARE @sXMLString1 VARCHAR(MAX) = '<m s="1"><fm id="1030169" v="5" d="Additional Information Required"><t>' + @sFormattedDateString + '</t><f>CK16 - H0025</f><f><di type="biglist"><ty>product</ty><t>defaultp</t><d>B - Brash</d></di><di type="biglist"><ty>product</ty><t>defaultp</t><d>E - Energywood</d></di><di type="biglist"><ty>product</ty><t>defaultp</t><d>F - FullPole</d></di><di type="biglist"><ty>product</ty><t>defaultp</t><d>H - Hurley Ash</d></di><di type="biglist"><ty>product</ty><t>defaultp</t><d>K - Stake</d></di><di type="biglist"><ty>product</ty><t>defaultp</t><d>L - Pallet</d></di><di type="biglist"><ty>product</ty><t>defaultp</t><d>P - Pulp</d></di><di type="biglist"><ty>product</ty><t>defaultp</t><d>S - Sawlog</d></di><di type="biglist"><ty>product</ty><t>defaultp</t><d>W - Firewood</d></di></f><f><di type="biglist"><ty>transbay</ty><t>defaultd</t><d>LRY-LDNG - Lorry Loading</d><rt>defaultp</rt></di><di type="biglist"><ty>transbay</ty><t>defaultd</t><d>MACH-MOVE - Machinery Move</d><rt>defaultp</rt></di></f><f /><f /><f><di type="biglist"><ty>trailer</ty><t>GM</t>
				<d>GM</d>
			</di>
			<di type="biglist">
				<ty>trailer</ty>
				<t>TL1003</t>
				<d>TL1003</d>
			</di>
			<di type="biglist">
				<ty>trailer</ty>
				<t>TL1004</t>
				<d>TL1004</d>
			</di>
			<di type="biglist">
				<ty>trailer</ty>
				<t>TL1005</t>
				<d>TL1005</d>
			</di>
			<di type="biglist">
				<ty>trailer</ty>
				<t>TL1006</t>
				<d>TL1006</d>
			</di>
			<di type="biglist">
				<ty>trailer</ty>
				<t>TL1007</t>
				<d>TL1007</d>
			</di>
			<di type="biglist">
				<ty>trailer</ty>
				<t>TL1008</t>
				<d>TL1008</d>
			</di>
			<di type="biglist">
				<ty>trailer</ty>
				<t>TL1009</t>
				<d>TL1009</d>
			</di>
			<di type="biglist">
				<ty>trailer</ty>
				<t>TL1010</t>
				<d>TL1010</d>
			</di>
			<di type="biglist">
				<ty>trailer</ty>
				<t>TL1012</t>
				<d>TL1012</d>
			</di>
			<di type="biglist">
				<ty>trailer</ty>
				<t>TL1013</t>
				<d>TL1013</d>
			</di>'

DECLARE @sXMLString2 VARCHAR(MAX) = '<di type="biglist">
				<ty>trailer</ty>
				<t>TL1014</t>
				<d>TL1014</d>
			</di>
			<di type="biglist">
				<ty>trailer</ty>
				<t>TL1015</t>
				<d>TL1015</d>
			</di>
			<di type="biglist">
				<ty>trailer</ty>
				<t>TL1016</t>
				<d>TL1016</d>
			</di>
			<di type="biglist">
				<ty>trailer</ty>
				<t>TL1018</t>
				<d>TL1018</d>
			</di>
			<di type="biglist">
				<ty>trailer</ty>
				<t>TL1019</t>
				<d>TL1019</d>
			</di>
			<di type="biglist">
				<ty>trailer</ty>
				<t>TL1020</t>
				<d>TL1020</d>
			</di>
			<di type="biglist">
				<ty>trailer</ty>
				<t>TL1021</t>
				<d>TL1021</d>
			</di>
			<di type="biglist">
				<ty>trailer</ty>
				<t>TL1342</t>
				<d>TL1342</d>
			</di>
			<di type="biglist">
				<ty>trailer</ty>
				<t>TL1346</t>
				<d>TL1346</d>
			</di>
			<di type="biglist">
				<ty>trailer</ty>
				<t>TL1431</t>
				<d>TL1431</d>
			</di>
			<di type="biglist">
				<ty>trailer</ty>
				<t>TL1432</t>
				<d>TL1432</d>
			</di>
			<di type="biglist">
				<ty>trailer</ty>
				<t>TL1433</t>
				<d>TL1433</d>
			</di>
			<di type="biglist">
				<ty>trailer</ty>
				<t>TL1434</t>
				<d>TL1434</d>
			</di>
			<di type="biglist">
				<ty>trailer</ty>
				<t>TL1435</t>
				<d>TL1435</d>
			</di>
			<di type="biglist">
				<ty>trailer</ty>
				<t>TL1444</t>
				<d>TL1444</d>
			</di>
			<di type="biglist">
				<ty>trailer</ty>
				<t>TL1445</t>
				<d>TL1445</d>
			</di>
			<di type="biglist">
				<ty>trailer</ty>
				<t>TL1446</t>
				<d>TL1446</d>
			</di>
			<di type="biglist">
				<ty>trailer</ty>
				<t>TL1464</t>
				<d>TL1464</d>
			</di>
			<di type="biglist">
				<ty>trailer</ty>
				<t>TL1481</t>
				<d>TL1481</d>
			</di>
			<di type="biglist">
				<ty>trailer</ty>
				<t>TL1483</t>
				<d>TL1483</d>
			</di>
			<di type="biglist">
				<ty>trailer</ty>
				<t>TL1496</t>
				<d>TL1496</d>
			</di>
			<di type="biglist">
				<ty>trailer</ty>
				<t>TL1516</t>
				<d>TL1516</d>
			</di>
			<di type="biglist">
				<ty>trailer</ty>
				<t>TL1525</t>
				<d>TL1525</d>
			</di>
			<di type="biglist">
				<ty>trailer</ty>
				<t>TL1533</t>
				<d>TL1533</d>
			</di>
			<di type="biglist">
				<ty>trailer</ty>
				<t>TL1534</t>
				<d>TL1534</d>
			</di>
			<di type="biglist">
				<ty>trailer</ty>
				<t>TL1535</t>
				<d>TL1535</d>
			</di></f><f>CK16</f><f>H0025</f><f>3695937</f><ui>1</ui></fm></m>'
DECLARE @sString2 VARCHAR(MAX) = @sXMLString1 + @sXMLString2
EXEC dbo.EX_SendFormMessage 430, 'Test', @dtTimeStamp, 1030169, 5, 1, @sString2, @nMessageID



