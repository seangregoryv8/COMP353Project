Insert into Residence (Address,City,Province,Postal_code,Phone,Bedrooms,Type) values (?, ?, ?, ?, ?, ?, ?);
/*
Alter table residences
Add Constraint check_RType Check (UPPER(residences.RType) IN ('APARTMENT', 'CONDOMINIUM', 'SEMIDETACHED HOUSE', 'HOUSE'));
*/