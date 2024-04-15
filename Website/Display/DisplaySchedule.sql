select *
from Schedule
where Schedule.Start_time = ? AND Schedule.Scheduled_at = ? AND Schedule.Scheduled_for = ?;