SET NOCOUNT ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

IF EXISTS (SELECT * FROM RS_Tagging WHERE [name] = 'tagging://category/ui/widgets/bfmDriverGrid')
BEGIN
	UPDATE RS_Tagging 
    SET [name] = 'tagging://category/ui/widgets/ewdDriverGrid', Attributes = '{"i18n": "ewdDriverGrid", "featureTag": "tagging://feature/ewd"}' 
    WHERE [name] = 'tagging://category/ui/widgets/bfmDriverGrid'
END
GO

IF EXISTS (SELECT * FROM RS_Tagging WHERE [name] = 'tagging://category/ui/workspaces/bfm')
BEGIN
	UPDATE RS_Tagging 
    SET [name] = 'tagging://category/ui/workspaces/ewd', Attributes = '{"i18n": "ewd", "featureTag": "tagging://feature/ewd"}' 
    WHERE [name] = 'tagging://category/ui/workspaces/bfm'
END
GO

IF EXISTS (SELECT * FROM [Configuration] WHERE ConfigKey = 'FEATURE_BFM')
BEGIN
	UPDATE [Configuration] SET ConfigKey = 'FEATURE_EWD' WHERE ConfigKey = 'FEATURE_BFM'
END
GO

EXEC Core__DropProcedure 'Feature_EnableBFM', 'dbo'
GO

EXEC Core__DropProcedure 'Feature_DisableBFM', 'dbo'
GO

EXEC Core__DropProcedure 'Feature_EnableEWD', 'dbo'
GO
CREATE PROCEDURE [dbo].[Feature_EnableEWD](@currentUser NVARCHAR(200) = NULL)
AS
    DECLARE @utcNow DATETIME
    SET @utcNow = GETUTCDATE()

    DECLARE @featureKey VARCHAR(100)
    SET @featureKey = 'FEATURE_EWD'
    EXEC dbo.Core__SetConfigItemBit @featureKey, 1, @utcNow, @currentUser
    
    UPDATE ReportDefinitions set TopLevel=1, IsVisible=1 where Name='Driver Logs Report'
GO

EXEC Core__DropProcedure 'Feature_DisableEWD', 'dbo'
GO
CREATE PROCEDURE [dbo].[Feature_DisableEWD](@currentUser NVARCHAR(200) = NULL)
AS
    DECLARE @utcNow DATETIME
    SET @utcNow = GETUTCDATE()

    DECLARE @featureKey VARCHAR(100)
    SET @featureKey = 'FEATURE_EWD'
    EXEC dbo.Core__SetConfigItemBit @featureKey, 0, @utcNow, @currentUser
    
    UPDATE ReportDefinitions set TopLevel=0, IsVisible=0 where Name='Driver Logs Report'
GO

EXEC Core__DropView 'RS_GetEWDRequiredVehicleData','dbo'
GO

CREATE VIEW [dbo].[RS_GetEWDRequiredVehicleData]
AS  
    SELECT  
      v.VehicleID,
      v.VehicleName as name,  
      v.VIN,
      ISNULL(FLOOR(rd.FMSOdometer), ISNULL(FLOOR(rd.GPSOdometer), 0)) as odometer, -- EWD Vehicle Required odometer value is int
      rvt.Description as vtype,
      vp.ProfileName as make
    FROM Vehicles v WITH(NOLOCK)
    LEFT OUTER JOIN VehicleProfiles vp
    ON vp.ProfileID = v.VehicleProfileID  
    LEFT OUTER JOIN RCOMDevices rd 
    ON rd.CurrentVehicleID = v.VehicleID  
    LEFT OUTER JOIN RCOMVehicleTypes rvt 
    ON rvt.VehicleTypeID = v.VehicleTypeID
GO

EXEC Core__InsertUpdateReportDefinition 'Driver Logs Report',
'<report name="REPORT_TITLE_DRIVER_LOGS_REPORT" redirecturl="report/documents" content_type="application/pdf" single_entity_scope="drivers">   
  <reportelement>   
  </reportelement> 
</report>', 1, 0, 3, 2, 0, 0, 0;
GO

EXEC Core__SetupMantleServer_Role
