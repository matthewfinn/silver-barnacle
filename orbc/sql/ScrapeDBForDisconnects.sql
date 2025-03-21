
select @@servername Server, db_name() as DB, dbo.core_formatdid(rcomdeviceid) DID, DriverID, TimeStamp
              from eld.events with (nolock)
       where TimeStamp > dateadd(day, -180, getutcdate())
       and recordstatus = 2
       and Latitude is null
       and comment is null
       and eventtype = 1 and eventcode = 4
       and driverid is not null
       order by rcomdeviceid, CreatedOn asc

select *
from eld.events with (nolock)
where TimeStamp > dateadd(day, -7, getutcdate())
and recordstatus != 2
and Latitude is null
and comment is null
and eventtype = 1 and eventcode = 4
and driverid is not null
and AutoEditedDuringBackfill = 1
order by rcomdeviceid, CreatedOn asc