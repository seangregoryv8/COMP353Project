UPDATE Schedule
SET colValue = ?
where Schedule.Start_time = ? AND Schedule.Scheduled_at = ? AND Schedule.Scheduled_for = ?;