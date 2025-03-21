--VehicleAuthKey
select VehicleAuthKey from Vehicles where Name = 'MY_VEHICLE_NAME'

--VehicleID
select VehicleID from Vehicles where Name = 'MY_VEHICLE_NAME'

--RCOMDeviceID
select RCOMDeviceID from RCOMDevices where RCOMVehicleName = 'MY_VEHICLE_NAME'

select DeviceID from RCOMDevices where RCOMVehicleName = 'MY_VEHICLE_NAME'

-- Sync Requests related to your vehicle
select * from SynchRequests
where RCOMDeviceID = RCOM_DEVICE_ID


-- Trigger sync Requests
--messaging
EXEC RD_CreateSynchRequest RCOMDeviceID, 'messaging sync', 'messaging'

--hos
EXEC RD_CreateSynchRequest RCOMDeviceID, 'hos sync', 'hos'

--messaging
EXEC RD_CreateSynchRequest RCOMDeviceID, 'infra sync', 'infrastructure'

-- clear messages and jobs
Clear down jobs AND messages
DECLARE @VehicleName nvarchar(max)
DECLARE @DriverName nvarchar(max)
SET @VehicleName = 'GavinBT500' ------ Change the Vehicle Name here and run
SET @DriverName = 'Dawn' ------ Change the Driver Name here and run
DELETE FROM dbo.IncabStopStateHistory WHERE StopID IN (SELECT StopID FROM IncabStops s INNER JOIN Vehicles v ON s.VehicleID = v.VehicleID WHERE RTRIM(VehicleName)=@VehicleName)
DELETE FROM dbo.IncabTripStateHistory WHERE TripGUID IN (SELECT TripGUID FROM IncabTrips s INNER JOIN Vehicles v ON s.VehicleID = v.VehicleID WHERE RTRIM(VehicleName)=@VehicleName)
DELETE FROM IncabStops WHERE VehicleID IN (SELECT VehicleID FROM Vehicles WHERE RTRIM(VehicleName)=@VehicleName)
DELETE FROM IncabTrips WHERE VehicleID IN (SELECT VehicleID FROM Vehicles WHERE RTRIM(VehicleName)=@VehicleName)
DELETE FROM IncabVehicleMessageStatus WHERE MessageID IN (SELECT MessageID FROM IncabVehicleMessageStateHistory s INNER JOIN Vehicles v ON s.VehicleID = v.VehicleID WHERE RTRIM(v.VehicleName)=@VehicleName)
DELETE FROM dbo.IncabMessages WHERE MessageID IN (SELECT MessageID FROM IncabVehicleMessageStateHistory s INNER JOIN Vehicles v ON s.VehicleID = v.VehicleID WHERE RTRIM(v.VehicleName)=@VehicleName)
DELETE FROM dbo.IncabMessages WHERE MessageID IN (SELECT MessageID FROM IncabDriverMessageStateHistory s INNER JOIN Drivers d ON s.DriverID = d.DriverID WHERE d.[Name] = @DriverName)
DELETE FROM dbo.IncabDriverMessageStateHistory WHERE DriverID IN (SELECT DriverID FROM Drivers WHERE Drivers.[Name] = @DriverName)
DELETE FROM dbo.IncabVehicleMessageStateHistory WHERE VehicleID IN (SELECT VehicleID FROM Vehicles WHERE VehicleName = @VehicleName)

-- Set BT500 CAN Config for FMS generator
ConfigGSM.exe /canconfig=1 /rcnet 716315