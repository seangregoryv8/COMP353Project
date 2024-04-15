-- Query 11
SELECT prime.Residence, residence.Type, person.FirstName, person.LastName, person.Occupation, Lives_with.Relationship  
FROM Lives_In As prime, Lives_In As second, Lives_With, Person, Employee, Residence
Where Employee.SIN = ? 
AND Lives_With.Employee = Employee.SIN 
AND Person.SIN = Lives_With.Person
AND prime.Person = Person.SIN
AND prime.Status = 'Primary'
AND prime.Residence = Residence.Address
AND second.Person = Person.SIN
AND second.Status = 'Primary'
AND second.Residence = Residence.Address;