select *
from schedule
where schedule.start_time = ? AND schedule.scheduled_at = ? AND schedule.scheduled_for = ?;