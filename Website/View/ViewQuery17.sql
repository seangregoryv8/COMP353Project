Select Facility.name, Employee.Role, Count(DISTINCT Works_At.Employee), Count(DISTINCT Works_At.Employee)-Count(DISTINCT Infection.Person)
From Facility, Works_At, Employee, Infection
Where Facility.Name = Works_At.Facility
AND Works_At.Employee = Employee.SIN
AND Employee.SIN = Infection.Person
Group By Facility.Name, Employee.Role
Order By Employee.Role ASC;