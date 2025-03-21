
INSERT INTO [Configuration] (ConfigKey, TimeStamp, ValueBit, ChangedBy) VALUES ('FEATURE_ELD', GETUTCDATE(), 1, 'Administrator')
GO
EXEC dbo.Feature_EnableEWD
GO
INSERT INTO [Configuration] (ConfigKey, TimeStamp, ValueString, ChangedBy)
VALUES ('ODYSSEY_API_TOKEN', GETUTCDATE(), 'Basic RmxlZXRNYW5hZ2VyOkhhcHB5MjAyMCE=', 'Administrator')

Update z_vVehicleConfig set ValueString = 'http://apk.bluetree.ie.s3-website-eu-west-1.amazonaws.com/EWDFieldTrial/fdroid/repo http://apk-external.bluetree.ie.s3-website-eu-west-1.amazonaws.com/Finemore/fdroid/repo'
where VehicleID = 1685 and ConfigKey = 'BTRepoUrl'
INSERT INTO [z_vVehicleConfig] (VehicleID, ConfigKey, ValueString, ChangedBy)
VALUES (628, 'BTRepoUrl', 'http://apk.bluetree.ie.s3-website-eu-west-1.amazonaws.com/EWDFieldTrial/fdroid/repo http://apk-external.bluetree.ie.s3-website-eu-west-1.amazonaws.com/Finemore/fdroid/repo',  'Administrator')
GO
INSERT INTO [z_vVehicleConfig] (VehicleID, ConfigKey, ValueString, ChangedBy)
VALUES (840, 'BTRepoUrl', 'http://apk.bluetree.ie.s3-website-eu-west-1.amazonaws.com/EWDFieldTrial/fdroid/repo http://apk-external.bluetree.ie.s3-website-eu-west-1.amazonaws.com/Finemore/fdroid/repo',  'Administrator')
GO
INSERT INTO [z_vVehicleConfig] (VehicleID, ConfigKey, ValueString, ChangedBy)
VALUES (983, 'BTRepoUrl', 'http://apk.bluetree.ie.s3-website-eu-west-1.amazonaws.com/EWDFieldTrial/fdroid/repo http://apk-external.bluetree.ie.s3-website-eu-west-1.amazonaws.com/Finemore/fdroid/repo',  'Administrator')
GO
INSERT INTO [z_vVehicleConfig] (VehicleID, ConfigKey, ValueString, ChangedBy)
VALUES (1763, 'BTRepoUrl', 'http://apk.bluetree.ie.s3-website-eu-west-1.amazonaws.com/EWDFieldTrial/fdroid/repo http://apk-external.bluetree.ie.s3-website-eu-west-1.amazonaws.com/Finemore/fdroid/repo',  'Administrator')
GO
INSERT INTO [z_vVehicleConfig] (VehicleID, ConfigKey, ValueString, ChangedBy)
VALUES (1736, 'BTRepoUrl', 'http://apk.bluetree.ie.s3-website-eu-west-1.amazonaws.com/EWDFieldTrial/fdroid/repo http://apk-external.bluetree.ie.s3-website-eu-west-1.amazonaws.com/Finemore/fdroid/repo',  'Administrator')
GO
Update z_vVehicleConfig set ValueString = 'http://apk.bluetree.ie.s3-website-eu-west-1.amazonaws.com/EWDFieldTrial/fdroid/repo http://apk-external.bluetree.ie.s3-website-eu-west-1.amazonaws.com/Finemore/fdroid/repo'
where VehicleID = 1614 and ConfigKey = 'BTRepoUrl'
Update z_vVehicleConfig set ValueString = 'http://apk.bluetree.ie.s3-website-eu-west-1.amazonaws.com/EWDFieldTrial/fdroid/repo http://apk-external.bluetree.ie.s3-website-eu-west-1.amazonaws.com/Finemore/fdroid/repo'
where VehicleID = 1739 and ConfigKey = 'BTRepoUrl'
Update z_vVehicleConfig set ValueString = 'http://apk.bluetree.ie.s3-website-eu-west-1.amazonaws.com/EWDFieldTrial/fdroid/repo http://apk-external.bluetree.ie.s3-website-eu-west-1.amazonaws.com/Finemore/fdroid/repo'
where VehicleID = 1740 and ConfigKey = 'BTRepoUrl'


Update z_vVehicleConfig set ValueString = 'com.mozziebyte.imagecapture,com.inthinc.connectapplication'
where VehicleID = 628 and ConfigKey = 'THIRD_PARTY_APK_WHITELIST'
INSERT INTO [z_vVehicleConfig] (VehicleID, ConfigKey, ValueString, ChangedBy)
VALUES (840, 'THIRD_PARTY_APK_WHITELIST', 'com.inthinc.connectapplication',  'Administrator')
GO
INSERT INTO [z_vVehicleConfig] (VehicleID, ConfigKey, ValueString, ChangedBy)
VALUES (983, 'THIRD_PARTY_APK_WHITELIST', 'com.inthinc.connectapplication',  'Administrator')
GO
Update z_vVehicleConfig set ValueString = 'com.tmw.assetinspection,com.mozziebyte.imagecapture,com.inthinc.connectapplication'
where VehicleID = 1685 and ConfigKey = 'THIRD_PARTY_APK_WHITELIST'
INSERT INTO [z_vVehicleConfig] (VehicleID, ConfigKey, ValueString, ChangedBy)
VALUES (1763, 'THIRD_PARTY_APK_WHITELIST', 'com.inthinc.connectapplication',  'Administrator')
GO
INSERT INTO [z_vVehicleConfig] (VehicleID, ConfigKey, ValueString, ChangedBy)
VALUES (1736, 'THIRD_PARTY_APK_WHITELIST', 'com.inthinc.connectapplication',  'Administrator')
GO
Update z_vVehicleConfig set ValueString = 'com.tmw.assetinspection,com.mozziebyte.imagecapture,com.inthinc.connectapplication'
where VehicleID = 1614 and ConfigKey = 'THIRD_PARTY_APK_WHITELIST'
Update z_vVehicleConfig set ValueString = 'com.tmw.assetinspection,com.mozziebyte.imagecapture,com.inthinc.connectapplication'
where VehicleID = 1739 and ConfigKey = 'THIRD_PARTY_APK_WHITELIST'
Update z_vVehicleConfig set ValueString = 'com.tmw.assetinspection,com.mozziebyte.imagecapture,com.inthinc.connectapplication'
where VehicleID = 1740 and ConfigKey = 'THIRD_PARTY_APK_WHITELIST'


select * from Vehicles where VehicleName like '%164%' --628
select * from Vehicles where VehicleName like '%1850%' --840
select * from Vehicles where VehicleName like '%1880%' --983
select * from Vehicles where VehicleName like '%1923%' --1685
select * from Vehicles where VehicleName like '%2012%' --1763
select * from Vehicles where VehicleName like '%2028%' --1736
select * from Vehicles where VehicleName like '%2029%' --1614
select * from Vehicles where VehicleName like '%2033%' --1739
select * from Vehicles where VehicleName like '%2034%' --1740