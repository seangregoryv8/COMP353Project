Select Info.FirstName, Info.LastName, Info.Role, numLivesIn.Num
From
(SELECT Employee.SIN, COUNT(DISTINCT Lives_in.residence) AS Num
FROM Employee
LEFT JOIN Lives_in ON Employee.sin = Lives_in.Person
GROUP BY Employee.sin
Having COUNT(DISTINCT Lives_in.residence) > 2) As numLivesIn
Join
(Select Person.SIN, Person.FirstName, Person.LastName, Employee.Role
From Employee,Person,Schedule
Where Employee.SIN = Schedule.Scheduled_for
AND Schedule.Date > DATE_SUB(CURDATE(), INTERVAL 28 DAY)
AND Schedule.Date <= DATE_SUB(CURDATE(), INTERVAL 0 DAY)
AND Schedule.Scheduled_at = ?
AND Employee.SIN = Person.SIN
) AS Info
On 
Info.SIN = numLivesIn.SIN
Group By Info.SIN;

