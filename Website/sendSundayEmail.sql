INSERT INTO EmailLog (Date, Subject, Body, Sender, Receiver)
    SELECT CURDATE(),
           'Your Scheduled Time This Week',
           CONCAT(CONCAT(s.Date,':'), s.Start_time),
           s.Scheduled_at,  -- Facility name sending the alert
           s.Scheduled_for  -- Employee receiving the alert
    FROM Schedule s
    Where
    s.Date <= DATE_ADD(CurDate(), INTERVAL 7 DAY)
    AND s.Date >= CurDate();