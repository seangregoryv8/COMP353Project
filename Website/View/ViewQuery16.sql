Select Info.name, Info.Role, Info.NumEmployee, IfNull(InfectionInfo.NumInfections, 0) As NumInfections
From
	(Select Facility.name, Employee.Role, Count(Distinct Works_at.Employee) As NumEmployee
	From Facility, Works_at, Employee
	Where Facility.Name = Works_at.Facility
	AND Works_at.Employee = Employee.SIN
    Group By Facility.Name, Employee.Role) as Info
    Left Join
    (Select Facility.Name, Employee.Role, COUNT(Infection.Person) as NumInfections
    From Infection, Works_at, Facility, Employee
    Where
    Facility.Name = Works_at.Facility
	AND Works_at.Employee = Infection.Person
    AND Works_at.Employee = Employee.SIN
	AND Infection.Date > DATE_SUB(CURDATE(), INTERVAL Infection.Quarantine_Period DAY)
	AND Infection.Date <= CURDATE()
    Group By Facility.Name, Employee.Role) As InfectionInfo
    On InfectionInfo.Name = Info.Name AND Info.Role = InfectionInfo.Role
Group By Info.Name, Info.Role
Order By Info.Role ASC;