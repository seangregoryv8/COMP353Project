insert into person (SIN,FirstName ,LastName ,DateOfBirth,MedicareCardNumber,TelephoneNumber,Citizenship,EmailAddress,Lives_in)
values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
/*
Alter Table employees
Add Constraint check_EResidence 
Check(employees.EAddress IN 
(select residence.RAddress
From residence, employees
where employees.EAddress = residence.RAddress 
and employees.ECity = residence.RCity 
and employees.EProvince = residence.RProvince 
and employees.EPostalCode = residence.RPostalCode));

Alter Table employees
Add Constraint check_EFacility 
Check(employees.EFacility IN (select facilities.FName From facilities));

Alter Table employees
Add Constraint check_ERole 
Check(UPPER(ERole) IN 
('NURSE', 'DOCTOR', 'CASHIER', 'PHARMACIST', 'RECEPTIONIST', 'ADMINISTRIVE PERSONNEL', 'SECURITY PERSONNEL', 'REGULAR EMPLOYEE'));

Alter Table employees
Add Constraint check_FName 
Check(employees.FName IN (Select timesheets.TFName from timesheets Where employees.FName = timesheets.TFName and employees.LName = timesheets.TLName and timesheets.TEndDate = null));
*/