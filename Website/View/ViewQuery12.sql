-- Query 12
Select Info.FirstName, Info.LastName, Info.Date, Info.Facility, numLivesIn.Num As NumSecondary
From
(SELECT employee.SIN, COUNT(DISTINCT Lives_in.residence) AS Num
FROM employee
LEFT JOIN Lives_in ON employee.sin = Lives_in.Person
GROUP BY employee.sin) As numLivesIn
Left Join
(Select Person.FirstName, Person.LastName, MAX(Infection.Date) as Date, Works_At.Facility, Infection.Person
From Employee,Person,Works_at,infection
Where Infection.Date > DATE_SUB(CURDATE(), INTERVAL 14 DAY)
AND Infection.Date <= DATE_SUB(CURDATE(), INTERVAL 0 DAY)
AND Infection.Person = Employee.SIN
AND Employee.Role = 'Doctor'
AND Employee.SIN = Person.SIN
AND Employee.SIN = Works_at.Employee
AND Works_At.End_Date is NULL
Group By Infection.Person, Works_At.facility) As Info
On 
Info.Person = numLivesIn.sin
Group By Info.Person, Info.Facility;