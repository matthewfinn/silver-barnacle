--Step 1. Send Request Split TRP using the SQL below:

DECLARE @dtTimeStamp DATETIME = GETUTCDATE()
DECLARE @nMessageID INT = NULL
DECLARE @sFormattedDateString NVARCHAR(MAX) = CAST(FORMAT(GETUTCDATE(), 'MM/dd/yyyy hh:mm:ss') AS NVARCHAR(MAX))
DECLARE @sXMLString NVARCHAR(MAX) = '<m s="1"><fm id="1030167" v="3"><t>' + @sFormattedDateString + '</t><f>CK07 - Kilworth</f><f>H0017</f><f>LS15 - Rossmore</f><f>H0029</f></fm></m>'
DECLARE @uID UNIQUEIDENTIFIER = NEWID()
EXEC dbo.M_CreateIncomingFormMessage 7430933, @dtTimeStamp, @uID, 1030123, 4, 1, @sXMLString, @nMessageID

--Step 2. Execute the following response to the above form:

DECLARE @dtTimeStamp DATETIME = GETUTCDATE()
DECLARE @sFormattedDateString NVARCHAR(MAX) = CAST(FORMAT(GETUTCDATE(), 'MM/dd/yyyy hh:mm:ss') AS NVARCHAR(MAX))
DECLARE @nMessageID INT = NULL
DECLARE @sXMLString1 VARCHAR(MAX) = '<m s="1"><fm id="1030175" v="3" d="Additional Information Required"><t>' + @sFormattedDateString + '</t><f>GY10 - H0056</f><f>99 - Default<di type="biglist"><ty>loadarea</ty><t>99</t><d>99 - Default</d></di></f><f><di type="biglist"><ty>mrlist</ty><t>002</t><d>002 - ECC (Sawlog - SS - 4.90)</d></di><di type="biglist"><ty>mrlist</ty><t>004</t><d>004 - OSB (Pulp - SS - 3.00)</d></di><di type="biglist"><ty>mrlist</ty><t>007</t><d>007 - M (Pulp - SS - 3.00)</d></di><di type="biglist"><ty>mrlist</ty><t>009</t><d>009 - WOFS (Stake - SS - 2.50)</d></di><di type="biglist"><ty>mrlist</ty><t>013</t><d>013 - MU (Pallet - SS - 2.50)</d></di><di type="biglist"><ty>mrlist</ty><t>014</t><d>014 - ECC (Pallet - SS - 2.50)</d></di><di type="biglist"><ty>mrlist</ty><t>015</t><d>015 - WOFS (Stake - DF - 2.50)</d></di><di type="biglist"><ty>mrlist</ty><t>017</t><d>017 - WOFS (Stake - SS - 3.40)</d></di><di type="biglist"><ty>mrlist</ty><t>018</t><d>018 - CURG (Sawlog - SS - 4.90)</d></di><di type="biglist"><ty>mrlist</ty><t>020</t><d>020 - CURG (Pallet - LPS - 3.70)</d></di><di type="biglist"><ty>mrlist</ty><t>021</t><d>021 - ECC (Pallet - SS - 3.10)</d></di><di type="biglist"><ty>mrlist</ty><t>022</t><d>022 - MU (Sawlog - SS - 4.90)</d></di></f><f><di type="biglist"><ty>product</ty><t>K</t><d>K - Stake</d><rt>009</rt></di><di type="biglist"><ty>product</ty><t>K</t><d>K - Stake</d><rt>015</rt></di><di type="biglist"><ty>product</ty><t>K</t><d>K - Stake</d><rt>017</rt></di><di type="biglist"><ty>product</ty><t>L</t><d>L - Pallet</d><rt>013</rt></di><di type="biglist"><ty>product</ty><t>L</t><d>L - Pallet</d><rt>014</rt></di><di type="biglist"><ty>product</ty><t>L</t><d>L - Pallet</d><rt>020</rt></di><di type="biglist"><ty>product</ty><t>L</t><d>L - Pallet</d><rt>021</rt></di><di type="biglist"><ty>product</ty><t>P</t><d>P - Pulp</d><rt>004</rt></di><di type="biglist"><ty>product</ty><t>P</t><d>P - Pulp</d><rt>007</rt></di><di type="biglist"><ty>product</ty><t>S</t><d>S - Sawlog</d><rt>002</rt></di>'
DECLARE @sXMLString2 VARCHAR(MAX) = '<di type="biglist"><ty>product</ty><t>S</t><d>S - Sawlog</d><rt>018</rt></di><di type="biglist"><ty>product</ty><t>S</t><d>S - Sawlog</d><rt>022</rt></di></f><f /><f /><f /><f>GY10 - H0056</f><f>99 - Default<di type="biglist"><ty>loadarea</ty><t>99</t><d>99 - Default</d></di></f><f><di type="biglist"><ty>mrlist</ty><t>002</t><d>002 - ECC (Sawlog - SS - 4.90)</d></di><di type="biglist"><ty>mrlist</ty><t>004</t><d>004 - OSB (Pulp - SS - 3.00)</d></di><di type="biglist"><ty>mrlist</ty><t>007</t><d>007 - M (Pulp - SS - 3.00)</d></di><di type="biglist"><ty>mrlist</ty><t>009</t><d>009 - WOFS (Stake - SS - 2.50)</d></di><di type="biglist"><ty>mrlist</ty><t>013</t><d>013 - MU (Pallet - SS - 2.50)</d></di><di type="biglist"><ty>mrlist</ty><t>014</t><d>014 - ECC (Pallet - SS - 2.50)</d></di><di type="biglist"><ty>mrlist</ty><t>015</t><d>015 - WOFS (Stake - DF - 2.50)</d></di><di type="biglist"><ty>mrlist</ty><t>017</t><d>017 - WOFS (Stake - SS - 3.40)</d></di><di type="biglist"><ty>mrlist</ty><t>018</t><d>018 - CURG (Sawlog - SS - 4.90)</d></di><di type="biglist"><ty>mrlist</ty><t>020</t><d>020 - CURG (Pallet - LPS - 3.70)</d></di><di type="biglist"><ty>mrlist</ty><t>021</t><d>021 - ECC (Pallet - SS - 3.10)</d></di><di type="biglist"><ty>mrlist</ty><t>022</t><d>022 - MU (Sawlog - SS - 4.90)</d></di></f><f><di type="biglist"><ty>product</ty><t>K</t><d>K - Stake</d><rt>009</rt></di><di type="biglist"><ty>product</ty><t>K</t><d>K - Stake</d><rt>015</rt></di><di type="biglist"><ty>product</ty><t>K</t><d>K - Stake</d><rt>017</rt></di><di type="biglist"><ty>product</ty><t>L</t><d>L - Pallet</d><rt>013</rt></di><di type="biglist"><ty>product</ty><t>L</t><d>L - Pallet</d><rt>014</rt></di><di type="biglist"><ty>product</ty><t>L</t><d>L - Pallet</d><rt>020</rt></di><di type="biglist"><ty>product</ty><t>L</t><d>L - Pallet</d><rt>021</rt></di><di type="biglist"><ty>product</ty><t>P</t><d>P - Pulp</d><rt>004</rt></di><di type="biglist"><ty>product</ty><t>P</t><d>P - Pulp</d><rt>007</rt></di><di type="biglist"><ty>product</ty><t>S</t><d>S - Sawlog</d><rt>002</rt></di><di type="biglist"><ty>product</ty><t>S</t><d>S - Sawlog</d><rt>018</rt></di><di type="biglist"><ty>product</ty><t>S</t><d>S - Sawlog</d><rt>022</rt></di></f><f /><f /><f /><f><di type="biglist"><ty>trailer</ty><t>TL1436</t><d>TL1436</d></di></f><f>4052749</f><ui>1</ui></fm></m>'
DECLARE @sString2 VARCHAR(MAX) = @sXMLString1 + @sXMLString2
EXEC dbo.EX_SendFormMessage 430, 'Test', @dtTimeStamp, 1030175, 3, 1, @sString2, @nMessageID

--The following is the response

--Send down a form for Confirmation

DECLARE @dtTimeStamp DATETIME = GETUTCDATE()
DECLARE @sFormattedDateString NVARCHAR(MAX) = CAST(FORMAT(GETUTCDATE(), 'MM/dd/yyyy hh:mm:ss') AS NVARCHAR(MAX))
DECLARE @nMessageID INT = NULL
DECLARE @sString2 VARCHAR(MAX) = '<m s="1"><fm id="1030178" v="3" d="Job Confirmation Required"><t>' + @sFormattedDateString + '</t><f>GY10 - H0056</f><f>99 - Default</f><f>CURG - Gabriel Curren</f><f>S - SS - 4.9 to CURG</f><f>GY10 - H0056</f><f>99 - Default</f><f>CURG - Gabriel Curren</f><f>L - LP - 3.7 to CURG</f><f>11-02-2020 3:08PM</f><f>TL1436</f><f /><f>4052788</f><f>Yes<i>Yes</i><i>No</i></f><ui>3</ui></fm></m>'
EXEC dbo.EX_SendFormMessage 430, 'Test', @dtTimeStamp, 1030178, 3, 1, @sString2, @nMessageID





SELECT *
FROM EX_OutgoingFormMessages
ORDER BY CreationTime DESC

SELECT *
FROM IncabFormDefinitions
WHERE FormID = 1030174
