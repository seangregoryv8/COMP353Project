-- Query 8
SELECT
	f.Name AS Name,
    f.Address AS Address,
    f.City AS City,
    f.Province AS Province,
    f.Postal_Code AS 'Postal-Code',
    f.Phone AS 'Phone Number',
    f.Web_address AS 'Web Address',
    f.Type AS Type,
    f.Capacity AS Capacity,
    e.Role AS 'General Manager',
    COUNT(w.Employee) AS Num_Employees,
    SUM(CASE WHEN e.Role = 'Doctor' THEN 1 ELSE 0 END) AS Num_Doctors,
    SUM(CASE WHEN e.Role = 'Nurse' THEN 1 ELSE 0 END) AS Num_Nurses
FROM Facility f
LEFT JOIN Employee e ON f.Managed_by = e.SIN
LEFT JOIN Works_at w ON f.Name = w.Facility
GROUP BY
	f.Name
ORDER BY
	f.Province ASC,
    f.City ASC,
    f.Type ASC;