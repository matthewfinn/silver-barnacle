SELECT 
t.SequenceNumber, 
t.TripGUID, 
t.Data, 
MAX(s.CreationTime) AS Created, 
MAX(activity.latestActivity) AS LatestActivity, 
tripActivity.CompletedTime AS CompletedTime, 
tripActivity.CreatedTime AS CreatedTime, 
SUM(CASE WHEN activity.deletedCount>0 THEN 2 ELSE 1 END) AS Version, 
COUNT(CASE WHEN activity.deletedCount=0 THEN 1 ELSE NULL END) AS TotalStopCount, 
COUNT(CASE WHEN activity.completedCount>0 AND activity.deletedCount=0 THEN 1 ELSE NULL END) AS CompletedStopCount, 
CASE WHEN versionLastRead IS NULL THEN 'NEW' WHEN versionLastRead<SUM(CASE WHEN activity.deletedCount>0 THEN 2 ELSE 1 END) THEN 'UPDATED' ELSE 'READ' END AS ReadState 
FROM IncabTrips AS t 
INNER JOIN IncabStops AS s ON t.TripGUID = s.TripGUID LEFT JOIN (SELECT sh.StopID, MAX(sh.TimeStamp) AS latestActivity, 
MAX(CASE WHEN sh.State = 's_started' THEN sh.TimeStamp ELSE NULL END) AS latestStarted, 
MAX(CASE WHEN sh.State = 's_completed' THEN sh.TimeStamp ELSE NULL END) AS latestCompleted, 
SUM(CASE WHEN sh.State = 's_deleted' THEN 1 ELSE 0 END) AS deletedCount, 
SUM(CASE WHEN sh.State = 's_completed' THEN 1 ELSE 0 END) AS completedCount 
FROM IncabStopStateHistory sh GROUP BY sh.StopID ) AS activity 
ON s.StopID = activity.StopID LEFT JOIN (SELECT TripGUID, MAX(CASE WHEN th.State = 's_created' THEN th.TimeStamp ELSE NULL END) AS CreatedTime, 
MAX(CASE WHEN th.State = 's_completed' THEN th.TimeStamp ELSE NULL END) AS CompletedTime, 
MAX(CASE WHEN th.State = 's_deleted' THEN th.TimeStamp ELSE NULL END) AS lastDeleted, 
MAX(CASE WHEN th.State = 's_read' THEN th.Version ELSE NULL END) AS versionLastRead FROM IncabTripStateHistory th GROUP BY th.TripGUID ) AS tripActivity 
ON t.TripGUID = tripActivity.TripGUID WHERE t.VehicleID = ? AND (tripActivity.lastDeleted IS NULL OR (tripActivity.lastDeleted < tripActivity.CreatedTime)) 
AND 1 GROUP BY t.TripGUID, t.TripMessageID HAVING COUNT(*) != COUNT(CASE WHEN activity.deletedCount>0 THEN 1 ELSE NULL END) AND 1 ORDER BY MAX(s.CreationTime) DESC