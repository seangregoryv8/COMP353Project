SELECT
    Info.Province,
    Info.NumFacilities,
    EmployeeInfo.NumEmployees,
    InfectionInfo.NumInfections,
    ScheduledHours.TotalHours
FROM
    (SELECT Facility.Province, COUNT(Facility.Province) AS NumFacilities
     FROM Facility
     GROUP BY Facility.Province) AS Info
JOIN
    (SELECT Facility.Province, COUNT(Works_at.Employee) AS NumEmployees
     FROM Facility Left Join Works_at On Works_at.Facility = Facility.name
     GROUP BY Facility.Province) AS EmployeeInfo ON EmployeeInfo.Province = Info.Province
JOIN
    (SELECT Facility.Province, COUNT(DISTINCT Infections.Person) AS NumInfections
     FROM Facility
     Left Join Works_at On Works_at.Facility = Facility.Name
     Left Join (
     Select Infection.Person 
     From Infection
     Where Infection.Date > DATE_SUB(CURDATE(), INTERVAL Infection.Quarantine_Period DAY) AND Infection.Date <= CURDATE()) As Infections
     On Infections.Person = Works_at.Employee
     GROUP BY Facility.Province) AS InfectionInfo ON InfectionInfo.Province = Info.Province
JOIN
    (SELECT Facility.Province, SUM(TIMESTAMPDIFF(HOUR, start_time, end_time)) AS TotalHours
     FROM Facility 
     Left Join 
     (Select Schedule.Scheduled_at, Schedule.Start_Time, Schedule.End_Time
     From Schedule
     Where Schedule.Start_time > ?
       AND Schedule.End_time < ?) As ScheduledHours
     On ScheduledHours.Scheduled_At = Facility.Name
     GROUP BY Facility.Province) AS ScheduledHours ON ScheduledHours.Province = Info.Province
GROUP BY Info.Province
ORDER BY Info.Province ASC;
/*
SELECT Facility.Province, COUNT(Works_at.Employee) AS NumEmployees
     FROM Facility Left Join Works_at On Works_at.Facility = Facility.name
     GROUP BY Facility.Province;

SELECT Facility.Province, COUNT(DISTINCT Infections.Person) AS NumInfections
     FROM Facility
     Left Join Works_at On Works_at.Facility = Facility.Name
     Left Join (
     Select Infection.Person 
     From Infection
     Where Infection.Date > DATE_SUB(CURDATE(), INTERVAL Infection.Quarantine_Period DAY) AND Infection.Date <= CURDATE()) As Infections
     On Infections.Person = Works_at.Employee
     GROUP BY Facility.Province;
     
SELECT Facility.Province, SUM(TIMESTAMPDIFF(HOUR, start_time, end_time)) AS TotalHours
     FROM Facility 
     Left Join 
     (Select Schedule.Scheduled_at, Schedule.Start_Time, Schedule.End_Time
     From Schedule
     Where Schedule.Start_time > '0000-01-01 00:00:00'
       AND Schedule.End_time < '2023-02-01 00:00:00') As ScheduledHours
     On ScheduledHours.Scheduled_At = Facility.Name
     GROUP BY Facility.Province;
     */