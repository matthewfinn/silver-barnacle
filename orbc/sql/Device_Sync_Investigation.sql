
/* 
ingestEvents.ASSET_RENAME:
desiredProc = 'RS_UpdateAssociatedVehicleName';
---------/2--------------
---------3--------------
ingestEvents.DEVICE_DEASSOCIATION:
desiredProc = 'RS_RemoveTracker';
---------/3--------------
---------4--------------
ingestEvents.REPLACE_DEVICE:
desiredProc = 'RS_ReplaceDevice';
---------/4--------------
---------5--------------
ingestEvents.ASSET_TYPE_CHANGE:
desiredProc = 'RS_UpdateVehicleType';
---------/5------------- */



--ingestEvents.DEVICE_VEHICLE_ASSOCIATION, ingestEvents.DEVICE_CREATION, ingestEvents.MOVE_ASSET:
--desiredProc = 'RS_CreateOrUpdateDeviceAndVehicle';
--[RS_CreateOrUpdateDeviceAndVehicle]
  --  @vehicleName CHAR (80),
  --  @VIN CHAR (20),
  --  @vendor NVARCHAR(200),
  --  @externalDeviceID NVARCHAR(200),
  --  @vehicleTypeID INT,
  --  @lastCommTime DATETIME,
  --  @rcomDeviceID INT,
  --  @vehicleID INT OUTPUT,
  --  @externalDeviceType NVARCHAR(200) = NULL,
  --  @vehicleTypeName NVARCHAR(200) = NULL,
  --  @fetchVehicleMappingBasedOnTime BIT = NULL

--DEVICE_VEHICLE_ASSOCIATION, DEVICE_CREATION, MOVE_ASSET
--From Time populated in RCOMMobilesVehicles table in call coming from IngestAPI with ToTime NULL
--In the update path, the VIN, ExternalDeviceType & vehicleTypeName don't get updated

--ASSET_RENAME:
-- Upstream should be handld by vehicles 2 way sync 

--REMOVE_TRACKER
-- sets toTime on RCOMMobilesVehicles to removal time

--REPLACE_DEVICE:
-- From Time populated in RCOMMobilesVehicles

--ASSET_TYPE_CHANGE:
-- Updates vehicles table only so should be fine as part of vehicle 2-way sync


exec RS_CreateOrUpdateDeviceAndVehicle 'Anewtestvehicle', 'VIN', null, '10111756', 1 , '2021-04-01 15:23:00', 777124, null, 'MX2', null, 1

select * from RCOMDevices
select * from Vehicles
select * from RCOMMobilesVehicles
