insert into facilities(Name,Address,City,Province,Postal_code,Phone,Web_address,Capacity,Managed_by) values (?, ?, ?, ?, ?, ?, ?, ?, ?);
/*
Alter table facilities
Add Constraint check_FType Check (UPPER(FType) IN ('HOSPITAL', 'CLSC', 'CLINIC', 'PHARMACY', 'SPECIAL INSTALLMENT'));
*/