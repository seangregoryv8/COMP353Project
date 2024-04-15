Select Info.name, Info.Role, Info.NumEmployee, IfNull(Info.NumEmployee, 0) - IfNull(InfectionInfo.NumInfections,0) As NeverInfected
From
	(Select Facility.name, Employee.Role, Count(DISTINCT Works_At.Employee) As NumEmployee
	From Facility, Works_At, Employee
	Where Facility.Name = Works_At.Facility
	AND Works_At.Employee = Employee.SIN
    Group By Facility.Name, Employee.Role) as Info
    Left Join
    (Select Facility.Name, Employee.Role, Count(Distinct Infection.Person) as NumInfections
    From Infection, Works_At, Facility, Employee
    Where
    Facility.Name = Works_At.Facility
	AND Works_At.Employee = Infection.Person
    AND Works_At.Employee = Employee.SIN
    Group By Facility.Name, Employee.Role) As InfectionInfo
    On InfectionInfo.Name = Info.Name AND Info.Role = InfectionInfo.Role
Group By Info.Name, Info.Role
Order By Info.Role ASC;