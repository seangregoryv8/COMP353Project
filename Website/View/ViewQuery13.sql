SELECT
    EmailID,
    Date,
    Subject,
    Body,
    Sender
FROM
    EmailLog
WHERE
    (Subject LIKE '%cancel%' OR Body LIKE '%cancel%')
    AND Date BETWEEN ? AND ?
    AND Sender = ?
ORDER BY
    Date DESC;
