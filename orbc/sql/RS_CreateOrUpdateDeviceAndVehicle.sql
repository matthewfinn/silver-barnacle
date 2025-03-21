CREATE PROCEDURE [dbo].[RS_CreateOrUpdateDeviceAndVehicle]
    @vehicleName CHAR (80),
    @VIN CHAR (20),
    @vendor NVARCHAR(200),
    @externalDeviceID NVARCHAR(200),
    @vehicleTypeID INT,
    @lastCommTime DATETIME,
    @rcomDeviceID INT,
    @vehicleID INT OUTPUT,
	@externalDeviceType NVARCHAR(200) = NULL,
	@vehicleTypeName NVARCHAR(200) = NULL,
	@fetchVehicleMappingBasedOnTime BIT = NULL
AS
    IF EXISTS(SELECT * FROM RCOMDevices WHERE RCOMDeviceID = @rcomDeviceID)
    BEGIN
		
        UPDATE RCOMDevices SET RCOMVehicleName = @vehicleName WHERE RCOMDeviceID = @rcomDeviceID AND @vehicleName IS NOT NULL AND RCOMVehicleName != @vehicleName
        UPDATE RCOMDevices SET VehicleTypeID = @vehicleTypeID WHERE RCOMDeviceID = @rcomDeviceID AND @vehicleTypeID IS NOT NULL AND VehicleTypeID != @vehicleTypeID
        UPDATE RCOMDevices SET LastCommTime = @lastCommTime WHERE RCOMDeviceID = @rcomDeviceID AND @lastCommTime IS NOT NULL
        UPDATE RCOMDevices SET Vendor = @vendor WHERE RCOMDeviceID = @rcomDeviceID AND @vendor IS NOT NULL
        UPDATE RCOMDevices SET ExternalDeviceID = @externalDeviceID WHERE RCOMDeviceID = @rcomDeviceID AND @externalDeviceID IS NOT NULL

		IF @fetchVehicleMappingBasedOnTime IS NOT NULL AND @fetchVehicleMappingBasedOnTime = 0
		BEGIN
		    SET @vehicleID = [dbo].RS_GetActiveVehicleMapping(@rcomDeviceID)--Fetch VehicleID independent of time if the request is from OP
		END
		ELSE
		BEGIN
            SET @vehicleID = [dbo].GetBestVehicleMapping(@rcomDeviceID, @lastCommTime)
		END
		
		DECLARE @taggingURL NVARCHAR(200)
		SET @taggingURL = NULL
		
		DECLARE @vehicleIDList NVARCHAR(MAX) = NULL
		
		IF @vehicleName IS NOT NULL AND @vehicleTypeName IS NOT NULL AND LEN(LTRIM(RTRIM(@vehicleTypeName))) > 0
		BEGIN
		SET @taggingURL = 'tagging://category/vehicles/Types/'+@vehicleTypeName
		END
		
		DECLARE @existingVehicleName CHAR (80)
		SET @existingVehicleName = NULL
		
		SELECT @existingVehicleName = VehicleName from Vehicles WHERE VehicleID = @vehicleID
		
		--No change in Vehicle Name implies nothing to update, Check for tagging of the vehicle
		IF @existingVehicleName = @vehicleName --IF we fetch the vehicleID independent of Timestamp(For OP), we should update RCOMMobilesVehicles with startTime
		BEGIN
		    IF NOT EXISTS (Select * from RS_ASSETS_TAGGING Where AssetType = 'VEHICLE' and AssetID = @vehicleID)
			BEGIN
				SET @vehicleIDList = @vehicleID
			END
		END
		
		--If the existingVehicleName = default vehicleName created using deviceID implies that this is the actual VehicleName to be updated with and the association is already existing
		ELSE IF @existingVehicleName = ISNULL(@externalDeviceID, 'New: ' + CAST(@rcomDeviceID as CHAR(20)))
		BEGIN
			UPDATE Vehicles SET VehicleName = @vehicleName WHERE VehicleID = @vehicleID AND @vehicleName IS NOT NULL AND VehicleName != @vehicleName
			UPDATE Vehicles SET VehicleTypeID = @vehicleTypeID WHERE VehicleID = @vehicleID AND @vehicleTypeID IS NOT NULL AND VehicleTypeID != @vehicleTypeID
			
			SET @vehicleIDList = @vehicleID
		END
		--To ignore the scenario where devices don't send the vehicleName
		ELSE IF @vehicleName IS NOT NULL
		BEGIN
			
			IF @vehicleID IS NOT NULL --To be done to avoid de-installation using Null VehicleID
			BEGIN
			EXEC Core__RemoveTracker @rcomDeviceID, @vehicleID, @lastCommTime, 'RS_CreateOrUpdateDeviceAndVehicle'
			END
			
			DECLARE @existingVehicleId INT = NULL
			SELECT @existingVehicleId = VehicleID FROM Vehicles WHERE VehicleName = @vehicleName AND FolderID = 0 AND IsDeleted = 0
			
			IF (@existingVehicleId IS NULL)
			BEGIN
			EXEC AddVehicleRecord 0, @vehicleName, 0, @existingVehicleId OUTPUT
			END
	
			EXEC Core__InstallTracker @rcomDeviceID, @existingVehicleId, @lastCommTime, @vehicleName, 'RS_CreateOrUpdateDeviceAndVehicle'
			
			SET @vehicleIDList = @existingVehicleId	
		END
		
		IF @vehicleIDList IS NOT NULL AND @taggingURL IS NOT NULL
		BEGIN
		EXEC RS_AssignTagToVehiclesV2 @taggingURL, @vehicleIDList, '', 1
		END
		
		RETURN 0
    END
    ELSE
    BEGIN
        EXEC RS_CreateDeviceAndVehicle @vehicleName, @VIN, @vendor, @externalDeviceID, @vehicleTypeID, @lastCommTime, @rcomDeviceID, @vehicleID OUT, @externalDeviceType, @vehicleTypeName
    END
	
	RETURN 0
GO