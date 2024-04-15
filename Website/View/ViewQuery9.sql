-- Query 9
Select
    p.FirstName,
    p.LastName,
    MIN(wa.Start_date) As WorkStartDate,
    p.DateOfBirth,
    p.MedicareCardNumber,
    p.TelephoneNumber,
    MIN(pr.Address) AS PrimaryAddress,
    MIN(pr.City) AS City,
    MIN(pr.Province) AS Province,
    MIN(pr.Postal_code) AS PostalCode,
    p.Citizenship,
    p.EmailAddress,
    (select COUNT(*) FROM lives_in li2 WHERE li2.Person = e.SIN AND li2.Status = 'Secondary') AS NumSecondaryResidences

FROM Employee e
JOIN Person P on e.SIN = P.SIN
JOIN Works_at wa on e.SIN = wa.Employee AND wa.End_date IS NULL AND wa.Facility = ? #still working
JOIN (Select lives_in.Person, lives_in.Residence From lives_in Where lives_in.Status = 'Primary' Limit 1) as li ON e.SIN = li.Person #get the primary address
JOIN Residence pr on li.Residence = pr.Address #get the primary address
#should have at least a secondary residence
AND EXISTS (
    SELECT 1
    FROM lives_in li3
    WHERE li3.Person = e.SIN AND li3.Status = 'Secondary'
)
GROUP BY
    p.SIN

ORDER BY MIN(wa.Start_date) DESC, p.FirstName ASC, p.LastName ASC;
