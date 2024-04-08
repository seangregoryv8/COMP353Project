Select Info.FirstName, Info.LastName, Info.FirstDay, Info.DateOfBirth, Info.EmailAddress, Vaccinations.NumVaccinations, Infections.NumInfections, TimeTable.TotalHours, numLivesIn.NumSecondary
From
((SELECT employee.SIN, COUNT(DISTINCT lives_in.residence) AS NumSecondary
FROM employee
LEFT JOIN lives_in ON employee.sin = lives_in.Person
GROUP BY employee.sin) As numLivesIn
Join
(Select Person.SIN, Person.FirstName, Person.LastName, Min(Works_At.Start_Date) as FirstDay, Person.DateOfBirth, Person.EmailAddress
From Employee,Person,Schedule,Works_At
Where Employee.Role = 'Nurse'
AND Employee.SIN = Schedule.scheduled_for
AND Schedule.Date > DATE_SUB(CURDATE(), INTERVAL 14 DAY)
AND Schedule.Date <= DATE_SUB(CURDATE(), INTERVAL 0 DAY)
AND Employee.SIN = Person.SIN
And Works_At.employee = Person.SIN
Group By Person.SIN
) AS Info
On 
Info.SIN = numLivesIn.SIN)
Join
(Select Infection.Person, COUNT(Infection.Person) AS NumInfections
From Infection
Group By Infection.Person
) AS Infections
On 
Info.SIN = Infections.Person
Join
(Select Vaccination.Person, Max(Vaccination.Dose) AS NumVaccinations
From Vaccination
Group By Vaccination.Person
) AS Vaccinations
On 
Info.SIN = Vaccinations.Person
Join
(Select Schedule.Scheduled_For, Sum(TIMESTAMPDIFF(HOUR, start_time, end_time)) AS TotalHours
From Schedule
Group By Schedule.Scheduled_For
) AS TimeTable
On 
Info.SIN = TimeTable.Scheduled_For
Group By Info.SIN
Order By
Info.FirstDay ASC,
Info.FirstName ASC,
Info.LastName ASC;


/*
Select Person.SIN, Person.FirstName, Person.LastName, Min(Works_At.Start_Date) as FirstDay, Person.DateOfBirth, Person.EmailAddress
From Employee,Person,Schedule,Works_At
Where Employee.Role = 'Nurse'
AND Employee.SIN = Schedule.scheduled_for
AND Schedule.Date > DATE_SUB(CURDATE(), INTERVAL 14 DAY)
AND Schedule.Date <= DATE_SUB(CURDATE(), INTERVAL 0 DAY)
AND Employee.SIN = Person.SIN
And Works_At.employee = Person.SIN
Group By Person.SIN;

SELECT employee.SIN, COUNT(DISTINCT lives_in.residence) AS Num
FROM employee
LEFT JOIN lives_in ON employee.sin = lives_in.Person
GROUP BY employee.sin;

Select Schedule.Scheduled_For, Sum(TIMESTAMPDIFF(HOUR, start_time, end_time)) AS Hours
From Schedule
Group By Schedule.Scheduled_For;

Select Infection.Person, COUNT(Infection.Person) AS Num
From Infection
Group By Infection.Person;

Select Vaccination.Person, Max(Vaccination.Dose) AS Num
From Vaccination
Group By Vaccination.Person; 

Select Schedule.Scheduled_For, Sum(TIMESTAMPDIFF(HOUR, start_time, end_time)) AS Hours
From Schedule
Group By Schedule.Scheduled_For;
*/