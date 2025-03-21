select * from ELD.Events where DriverID = 1052 order by CreatedOn desc





select * from Drivers where Name like '%mattfinn%'

exec Core__DropTrigger [Events_InsteadOfDelete], [ELD]

Delete from ELD.Events where DriverID = 1052 and CreatedOn > '2021-09-01 12:00:00.000' 

CREATE TRIGGER [ELD].[Events_InsteadOfDelete] on [ELD].[Events] instead of delete
AS
    DECLARE @purgeTimestamp DATETIME
    SET @purgeTimestamp = DATEADD(day, -dbo.Core__GetConfigItemInt('PurgeHoSDutyLogsPolicy_Days', 0), getutcdate())
    -- need to keep minimum 6 months logs as per ELD spec
    if (@purgeTimestamp > DATEADD(month, -6, GETUTCDATE())) 
        SET @purgeTimestamp =  DATEADD(month, -6, GETUTCDATE())
    -- Only delete records older than 6 months old.
    DELETE FROM Events
        WHERE EventID IN (SELECT EventID FROM deleted WHERE timeStamp < @purgeTimestamp)
GO