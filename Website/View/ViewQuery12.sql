-- Query 12
Select Info.FirstName, Info.LastName, Info.Date, Info.Facility, numLivesIn.Num As NumSecondary
From
(SELECT Employee.SIN, COUNT(DISTINCT Lives_in.residence) AS Num
FROM Employee
LEFT JOIN Lives_in ON Employee.sin = Lives_in.Person
GROUP BY Employee.sin) As numLivesIn
Left Join
(Select Person.FirstName, Person.LastName, MAX(Infection.Date) as Date, Works_at.Facility, Infection.Person
From Employee,Person,Works_at,Infection
Where Infection.Date > DATE_SUB(CURDATE(), INTERVAL 14 DAY)
AND Infection.Date <= DATE_SUB(CURDATE(), INTERVAL 0 DAY)
AND Infection.Person = Employee.SIN
AND Employee.Role = 'Doctor'
AND Employee.SIN = Person.SIN
AND Employee.SIN = Works_at.Employee
AND Works_at.End_Date is NULL
Group By Infection.Person, Works_at.facility) As Info
On 
Info.Person = numLivesIn.sin
Group By Info.Person, Info.Facility;