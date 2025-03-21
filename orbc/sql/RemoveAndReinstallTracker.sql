--find a vehicle where a UID exists and it's mapped to a device for timespan of UID and hasn't been disassociated with the vehicle since
SELECT DISTINCT ex.RCOMDeviceID, ex.VehicleID, ex.VehicleName, count(*)
 FROM RS_ELD_GetELDExceptions(DATEADD(month, -1, GETUTCDATE()), GETUTCDATE(), null, null) ex
inner join Vehicles v on ex.VehicleID = v.vehicleID
inner join RCOMMobilesVehicles m on v.VehicleID= m.VehicleID
where m.ToTime is null and m.RCOMDeviceID = ex.RCOMDeviceID and m.VehicleID = ex.VehicleID
group by ex.RCOMDeviceID, ex.VehicleID, ex.VehicleName
order by Count(*) desc


-- find an RCOMDevice that isn't currently associated with a vehicle
select * from RCOMDevices where CurrentVehicleID is null
and DID like '7%'
order by LastCommTime desc

-- remove rcomdevice from this vehicle from before the UIDs were generated 
run Util_RemoveTracker(rcomDeviceId, vehicleID, removalTime, TrialRun?)
run Util_InstallTracker(rcomDeviceId, vehicleID, installationTime, VehicleName, TrialRun?)


1. find a vehicle where a UID exists and it's mapped to a device for timespan of UID and hasn't been disassociated with the vehicle since, 
   it'd be useful to find one that took a while to sync the UID event to the DB as we can associate it during the intervening period i.e. after the createdOn and before the InsertionTimeStamp on the ELD.events table


2. Remove device association

-- UID 0D905412-F01A-4D76-A270-FFBD202F5878 created at 2022-08-03 10:01:26.223 but only written at 2022-08-03 22:10:31.990
exec Util_RemoveTracker 7640727, 1237, '2022-08-03 12:00:00.00', 0


   SELECT e.TimeStamp, e.CreatedOn, e.InsertionTimeStamp, DATEDIFF(minute, E.TimeStamp, E.InsertionTimeStamp)as diff, *
    FROM RS_ELD_GetELDExceptions(DATEADD(month, -1, GETUTCDATE()), GETUTCDATE(), null, null) ex
    inner join ELD.Events e on ex.EventID = e.EventID
   where ex.RCOMDeviceID = 7640727
