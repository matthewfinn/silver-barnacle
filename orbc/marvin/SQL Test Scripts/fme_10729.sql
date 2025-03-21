DECLARE @dtTimeStamp DATETIME = GETUTCDATE()
DECLARE @sFormattedDateString NVARCHAR(MAX) = CAST(FORMAT(GETUTCDATE(), 'MM/dd/yyyy hh:mm:ss') AS NVARCHAR(MAX))
DECLARE @uGUID UNIQUEIDENTIFIER = NEWID()
DECLARE @uGUID2 UNIQUEIDENTIFIER = NEWID()
DECLARE @uGUID3 UNIQUEIDENTIFIER = NEWID()
DECLARE @nMessageID INT = NULL
DECLARE @sXMLString NVARCHAR(MAX) = '<m s="1">
    <fm id="1000000" v="1">
        <t>' + @sFormattedDateString + '</t>
        <urg>50</urg>
        <rr> True </rr>
        <f> New Route </f>
    </fm>
    <trip id="3695726" overwrite="true">
        <stop index="1" id="' + CAST(@uGUID AS NVARCHAR(MAX)) + '" auto="true" arm="true">
            <title>Test-0</title>
            <details></details>
            <address>two mile Ditch</address>
            <lat>53.30708</lat>
            <long>-8.996</long>
            <jobid>1</jobid>
            <ar>0.5</ar>
            <asd>10</asd>
            <cr>0.6</cr>
			<a id="0" s="a">
                <s id="1091002" v="1" ui="0" />
            </a>
            <PlannedDistance n="Planned Distance"> 2 </PlannedDistance>
            <PlannedArrival n="Planned Arrival"> 07/08/2020 06:48 </PlannedArrival>
            <PlannedDepart n="Planned Depart"> 07/08/2020 06:53 </PlannedDepart>
        </stop>
        <stop index="2" id="' + CAST(@uGUID2 AS NVARCHAR(MAX)) + '" auto="true" arm="true">
            <title>Test-1</title>
            <details></details>
            <address>Past Loughgeorge</address>
            <lat>53.363</lat>
            <long>-8.92615</long>
            <jobid>2</jobid>
            <ar>0.5</ar>
            <asd>10</asd>
            <cr>0.6</cr>
            <PlannedDistance n="Planned Distance"> 3 </PlannedDistance>
            <PlannedArrival n="Planned Arrival"> 07/08/2020 07:00 </PlannedArrival>
            <PlannedDepart n="Planned Depart"> 07/08/2020 07:15 </PlannedDepart>
        </stop>
        <stop index="3" id="' + CAST(@uGUID3 AS NVARCHAR(MAX)) + '" auto="true" arm="true">
            <title>Test-2</title>
            <details></details>
            <address>Al Hayes Motors</address>
            <lat>53.504180</lat>
            <long>-8.886020</long>
            <jobid>3</jobid>
            <ar>0.5</ar>
            <asd>10</asd>
            <cr>0.6</cr>
            <PlannedDistance n="Planned Distance"> 1 </PlannedDistance>
            <PlannedArrival n="Planned Arrival"> 07/08/2020 07:19 </PlannedArrival>
            <PlannedDepart n="Planned Depart"> 07/08/2020 07:34 </PlannedDepart>
        </stop>
    </trip>
</m>'
EXEC dbo.EX_SendFormMessage 430, 'Test', @dtTimeStamp, 1000000, 1, 1, @sXMLString, @nMessageID