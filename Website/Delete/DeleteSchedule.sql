DELETE FROM schedule
WHERE start_time = ? AND scheduled_at = ? AND scheduled_for = ?;