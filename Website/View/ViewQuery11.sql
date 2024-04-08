-- Query 11
SELECT person.PrimaryResidence, residence.Type, person.FirstName, person.LastName, person.Occupation, lives_with.Relationship  
FROM Lives_With, Person, Employee, Residence
Where Employee.SIN = ? 
AND Lives_With.Employee = Employee.SIN 
AND Person.SIN = Lives_With.Person
AND Residence.Address = Person.PrimaryResidence;