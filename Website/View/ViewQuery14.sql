Select Info.FirstName, Info.LastName, Info.Role, numLivesIn.Num
From
(SELECT employee.SIN, COUNT(DISTINCT lives_in.residence) AS Num
FROM employee
LEFT JOIN lives_in ON employee.sin = lives_in.Person
GROUP BY employee.sin
Having COUNT(DISTINCT lives_in.residence) > 2) As numLivesIn
Join
(Select Person.SIN, Person.FirstName, Person.LastName, Employee.Role
From Employee,Person,Schedule
Where Employee.SIN = Schedule.scheduled_for
AND Schedule.Date > DATE_SUB(CURDATE(), INTERVAL 14 DAY)
AND Schedule.Date <= DATE_SUB(CURDATE(), INTERVAL 0 DAY)
AND Employee.SIN = Person.SIN
) AS Info
On 
Info.SIN = numLivesIn.SIN
Group By Info.SIN;

