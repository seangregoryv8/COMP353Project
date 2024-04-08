Select Facility.name, Employee.Role, Count(DISTINCT Works_At.Employee), Count(Distinct Infection.Person)
From Facility, Works_At, Employee, Infection
Where Facility.Name = Works_At.Facility
AND Works_At.Employee = Employee.SIN
AND Employee.SIN = Infection.Person
AND Infection.Date > DATE_SUB(Infection.Date, INTERVAL Infection.Quarantine_Period DAY)
AND Infection.Date <= CURDATE()
Group By Facility.Name, Employee.Role
Order By Employee.Role ASC;