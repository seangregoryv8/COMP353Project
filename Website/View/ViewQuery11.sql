-- Query 11
SELECT Residence.Address, Residence.Type, Person.FirstName, Person.LastName, Person.Occupation, Lives_with.Relationship  
FROM Lives_in, Lives_with, Person, Employee, Residence
Where Employee.SIN = '4826635732'
AND Lives_in.Person = Employee.SIN
AND Lives_with.Employee = Employee.SIN 
AND Person.SIN = Lives_with.Person
AND Lives_in.Residence = Residence.Address;