-- trend of unlinked events by day
select CONVERT(date, DATEADD(day, DATEDIFF(day, 0, StartTime), 0)) as Date, count(*) as CountOf from HoS_DutyStateChanges
where DutyStateChangeID not in (select DutyStateChangeID from ELD.EventToDutyStateChangeMap)
GROUP BY DATEADD(day, DATEDIFF(day, 0, StartTime), 0)
ORDER BY  DATEADD(day, DATEDIFF(day, 0, StartTime), 0) desc

-- number of unlinked events per driver
select DriverID, count(*) as CountOf from HoS_DutyStateChanges
where DutyStateChangeID not in (select DutyStateChangeID from ELD.EventToDutyStateChangeMap)
AND (DATEDIFF(minute, StartTime, EndTime) > 0 or DATEDIFF(minute, StartTime, EndTime) <0)
AND StartTime > DATEADD(month, -3, GETUTCDATE())
GROUP BY DriverID
ORDER BY CountOf desc

--unlinked events and number of infringements
select H.DriverID, count(H.DriverID) as NumberOfUnlinkedHoSDutyStateChanges, (select count(*) from HoS_Infringements where DriverID = H.DriverID and Started > DATEADD(month, -3, GETUTCDATE())) as NumberOfInfringements--, count(I.DriverID) as Inf
from HoS_DutyStateChanges H
where H.DutyStateChangeID not in (select DutyStateChangeID from ELD.EventToDutyStateChangeMap)
AND (DATEDIFF(minute, StartTime, EndTime) > 0 or DATEDIFF(minute, StartTime, EndTime) <0)
AND StartTime > DATEADD(month, -3, GETUTCDATE())
GROUP BY H.DriverID
ORDER BY NumberOfInfringements desc


-- events not linked to an ELD event that has another event with the 
-- same starttime that isn't 0 duration and is linked to an ELD.Event that isn't inactive
select DATEDIFF(minute, StartTime, EndTime) as Dur, * from HoS_DutyStateChanges h with (nolock)
where DutyStateChangeID not in (select DutyStateChangeID from ELD.EventToDutyStateChangeMap with (nolock))
and DATEDIFF(minute, StartTime, EndTime) > 0
and StartTime > DATEADD(month, -6, GETUTCDATE())
and EXISTS(select * from HoS_DutyStateChanges hsdc
	inner join ELD.EventToDutyStateChangeMap map on hsdc.DutyStateChangeID = map.DutyStateChangeID
	inner join ELD.Events e on map.EventID = e.EventID
	where h.StartTime = hsdc.StartTime 
	and DATEDIFF(minute, StartTime, EndTime) > 0
	and h.DutyStateChangeID <> hsdc.DutyStateChangeID and 
	hsdc.DutyStateChangeID in (select DutyStateChangeID from ELD.EventToDutyStateChangeMap with (nolock)) 
	and e.RecordStatus <> 2)
order by Dur desc


-- same as above grouped by DriverID 
select DATEDIFF(minute, StartTime, EndTime) as Dur, * from HoS_DutyStateChanges h with (nolock)
where DutyStateChangeID not in (select DutyStateChangeID from ELD.EventToDutyStateChangeMap with (nolock))
and DATEDIFF(minute, StartTime, EndTime) > 0
and StartTime > DATEADD(month, -6, GETUTCDATE())
and EXISTS(select * from HoS_DutyStateChanges hsdc
	inner join ELD.EventToDutyStateChangeMap map on hsdc.DutyStateChangeID = map.DutyStateChangeID
	inner join ELD.Events e on map.EventID = e.EventID
	where (h.StartTime = hsdc.StartTime or (h.StartTime > hsdc.StartTime and h.StartTime < hsdc.EndTime))
	and DATEDIFF(minute, StartTime, EndTime) > 0
	and h.DutyStateChangeID <> hsdc.DutyStateChangeID and 
	hsdc.DutyStateChangeID in (select DutyStateChangeID from ELD.EventToDutyStateChangeMap with (nolock)) 
	and e.RecordStatus <> 2)
order by Dur desc


