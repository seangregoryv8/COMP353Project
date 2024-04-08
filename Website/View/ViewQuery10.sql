-- Query 10
SELECT *
FROM Schedule
Where Schedule.start_time > ? AND Schedule.end_time < ?
GROUP BY
	Schedule.Scheduled_at,
	Schedule.Scheduled_for,
	Schedule.Date,
	Schedule.Start_time
ORDER BY
	Schedule.scheduled_at ASC,
    Schedule.date ASC,
    Schedule.start_time ASC;