Select Info.FirstName, Info.LastName, Info.FirstDay, Info.DateOfBirth, Info.EmailAddress, Vaccinations.NumVaccinations, TimeTable.TotalHours, numLivesIn.NumSecondary
From
(Select employee.SIN,numSecondary
From Employee
Left Join
(SELECT employee.SIN, COUNT(DISTINCT Lives_in.residence) AS NumSecondary
FROM employee
LEFT JOIN Lives_in ON employee.sin = Lives_in.Person
GROUP BY employee.sin) as NumSecondary On NumSecondary.Sin = Employee.Sin) As numLivesIn
Join
(Select Person.SIN, Person.FirstName, Person.LastName, Min(Works_At.Start_Date) as FirstDay, Person.DateOfBirth, Person.EmailAddress
From Employee,Person,Works_At
Where Employee.Role = 'Nurse'
AND Employee.SIN = Person.SIN
And Works_At.employee = Person.SIN
AND Works_At.end_date Is Null
Group By Person.SIN
Having Count(Distinct Works_At.Facility) > 1
) AS Info
On 
Info.SIN = numLivesIn.SIN
Join
(Select Infection.Person
From Infection
Where Infection.Date > DATE_SUB(CURDATE(), INTERVAL Infection.Quarantine_Period DAY)
AND Infection.Date <= CURDATE()
Group By Infection.Person
) AS Infections
On 
Info.SIN = Infections.Person
Join
(Select Employee.SIN, NumVaccinations
From
Employee
Left Join
(Select Vaccination.Person, Max(Vaccination.Dose) AS NumVaccinations
From Vaccination
Group By Vaccination.Person) As VacInfo On VacInfo.Person = Employee.Sin
) AS Vaccinations
On 
Info.SIN = Vaccinations.SIN
Join
(Select Employee.SIN, Scheduled_Employees.TotalHours
From Employee
	Left Join
	(Select Scheduled_For, Sum(TIMESTAMPDIFF(HOUR, start_time, end_time)) AS TotalHours
	From Schedule
	Group By Schedule.Scheduled_For) AS Scheduled_Employees On Employee.SIN = Scheduled_Employees.Scheduled_For
Group By Employee.SIN
) AS TimeTable
On 
Info.SIN = TimeTable.SIN
Group By Info.SIN
Order By
Info.FirstDay ASC,
Info.FirstName ASC,
Info.LastName ASC;
/*
Select employee.SIN,numSecondary
From
Employee
Left Join
(SELECT employee.SIN, COUNT(DISTINCT Lives_in.residence) AS NumSecondary
FROM employee
LEFT JOIN Lives_in ON employee.sin = Lives_in.Person
GROUP BY employee.sin) as NumSecondary On NumSecondary.Sin = Employee.Sin;

Select Person.SIN, Person.FirstName, Person.LastName, Min(Works_At.Start_Date) as FirstDay, Person.DateOfBirth, Person.EmailAddress, Count(Distinct Works_At.Facility)
From Employee,Person,Works_At
Where Employee.Role = 'Nurse'
AND Employee.SIN = Person.SIN
And Works_At.employee = Person.SIN
AND Works_At.end_date Is Null
Group By Person.SIN
Having Count(Distinct Works_At.Facility) > 1;

Select Employee.SIN, Scheduled_Employees.Hours
From Employee
	Left Join
	(Select Scheduled_For, Sum(TIMESTAMPDIFF(HOUR, start_time, end_time)) AS Hours
	From Schedule
	Group By Schedule.Scheduled_For) AS Scheduled_Employees On Employee.SIN = Scheduled_Employees.Scheduled_For
Group By Employee.SIN;

Select Employee.SIN, NumVaccination
From
Employee
Left Join
(Select Vaccination.Person, Max(Vaccination.Dose) AS NumVaccination
From Vaccination
Group By Vaccination.Person) As VacInfo On VacInfo.Person = Employee.Sin; 

Select Infection.Person, COUNT(Infection.Person) AS NumInfections
From Infection
Where Infection.Date > DATE_SUB(CURDATE(), INTERVAL Infection.Quarantine_Period DAY)
AND Infection.Date <= CURDATE()
Group By Infection.Person;
*/
