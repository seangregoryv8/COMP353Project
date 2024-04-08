UPDATE schedule
SET colValue = ?
where schedule.start_time = ? AND schedule.scheduled_at = ? AND schedule.scheduled_for = ?;