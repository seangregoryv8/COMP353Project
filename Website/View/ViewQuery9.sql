-- Query 9
Select
    p.FirstName,
    p.LastName,
    wa.Start_date,
    p.DateOfBirth,
    p.MedicareCardNumber,
    p.TelephoneNumber,
    pr.Address AS PrimaryAddress,
    pr.City,
    pr.Province,
    pr.Postal_code,
    p.Citizenship,
    p.EmailAddress,
    (select COUNT(*) FROM lives_in li2 WHERE li2.Person = e.SIN AND li2.Status = 'Secondary') AS NumSecondaryResidences

FROM Employee e
JOIN Person P on e.SIN = P.SIN
JOIN Works_at wa on e.SIN = wa.Employee AND wa.End_date IS NULL AND wa.Facility = 'PharmaLab 5755' #still working
JOIN lives_in li ON e.SIN = li.Person AND li.Status = 'Primary' #get the primary address
JOIN Residence pr on li.Residence = pr.Address #get the primary address
#should have at least a secondary residence
AND EXISTS (
    SELECT 1
    FROM lives_in li3
    WHERE li3.Person = e.SIN AND li3.Status = 'Secondary'
)
GROUP BY
    p.FirstName, p.LastName, wa.Start_date, p.DateOfBirth, p.MedicareCardNumber, p.TelephoneNumber, pr.Address, pr.City, pr.Province, pr.Postal_code, p.Citizenship, p.EmailAddress

ORDER BY wa.Start_date DESC, p.FirstName ASC, p.LastName ASC;
