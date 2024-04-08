Select Info.Province, Info.NumFacilities, EmployeeInfo.NumEmployees, Info.Infections, ScheduledHours.TotalHours
From
(Select Facility.Province, Count(Facility.Province) As NumFacilities
From Facility
Group By Facility.Province) AS Info
JOIN
(Select Facility.Province, Count(Works_At.Employee) As NumEmployees
From Facility, Works_At
Where Facility.Name = Works_At.Facility
Group By Facility.Province) AS EmployeeInfo
On EmployeeInfo.Province = Info.Province
JOIN
(Select Facility.Province, Count(Distinct Infection.Person) As Infections
From Facility, Works_At, Infection
Where Facility.Name = Works_At.Facility
AND Works_At.Employee = Infection.Person
AND Infection.Date > DATE_SUB(Infection.Date, INTERVAL Infection.Quarantine_Period DAY)
AND Infection.Date <= CURDATE()
Group By Facility.Province) AS InfectionInfo
On EmployeeInfo.Province = Info.Province
JOIN
(Select Facility.Province, Sum(TIMESTAMPDIFF(HOUR, start_time, end_time)) AS TotalHours
From Facility, Schedule
Where Facility.Name = Schedule.Scheduled_At
AND Schedule.Start_time > '0000-01-01'
AND Schedule.End_time < '9999-12-31'
Group By Facility.Province) AS ScheduledHours
ON Info.Province = ScheduledHours.Province
Group By Info.Province
Order By Info.Province ASC;