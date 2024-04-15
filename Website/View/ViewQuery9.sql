-- Query 9
Select
    P.FirstName,
    P.LastName,
    MIN(WA.Start_date) As WorkStartDate,
    P.DateOfBirth,
    P.MedicareCardNumber,
    P.TelephoneNumber,
    MIN(PR.Address) AS PrimaryAddress,
    MIN(PR.City) AS City,
    MIN(PR.Province) AS Province,
    MIN(PR.Postal_code) AS PostalCode,
    P.Citizenship,
    P.EmailAddress,
    (select COUNT(*) FROM Lives_in li2 WHERE li2.Person = E.SIN AND li2.Status = 'Secondary') AS NumSecondaryResidences

FROM Employee E
JOIN Person P on E.SIN = P.SIN
JOIN Works_at WA on E.SIN = WA.Employee AND WA.End_date IS NULL AND WA.Facility = ? #still working
JOIN (Select Lives_in.Person, Lives_in.Residence From Lives_in Where Lives_in.Status = 'Primary' Limit 1) as LI ON E.SIN = LI.Person #get the primary address
JOIN Residence PR on LI.Residence = PR.Address #get the primary address
#should have at least a secondary residence
AND EXISTS (
    SELECT 1
    FROM Lives_in li3
    WHERE li3.Person = E.SIN AND li3.Status = 'Secondary'
)
GROUP BY
    P.SIN

ORDER BY MIN(WA.Start_date) DESC, P.FirstName ASC, P.LastName ASC;
