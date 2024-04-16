@ -0,0 +1,42 @@
-- Query 9
SET @FACILITY_NAME = 'MediPharmaCare 0115';

SELECT DISTINCT
	p.FirstName,
    p.LastName,
    w.Start_date,
    p.DateOfBirth,
	p.MedicareCardNumber,
    p.TelephoneNumber,
    p.PrimaryResidence,
    r.City,
    r.Province,
    r.Postal_code,
    p.Citizenship,
    p.EmailAddress,
    COUNT(li.Person) AS 'Secondary Residences'
FROM Employee e
INNER JOIN Person p ON p.SIN = e.SIN
INNER JOIN Works_at w ON w.Employee = e.SIN
INNER JOIN lives_in li ON li.Person = p.SIN
INNER JOIN Residence r ON p.PrimaryResidence = r.Address
INNER JOIN Facility f ON w.Facility = f.Name
WHERE f.Name = @FACILITY_NAME
GROUP BY 
	p.FirstName,
    p.LastName,
    w.Start_date,
    p.DateOfBirth,
    p.MedicareCardNumber,
    p.TelephoneNumber,
    p.PrimaryResidence,
    r.City,
    r.Province,
    r.Postal_code,
    p.Citizenship,
    p.EmailAddress
HAVING COUNT(li.Person) > 1
ORDER BY
	w.Start_date DESC,
    p.FirstName DESC,
    p.LastName DESC;