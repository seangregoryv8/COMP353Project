insert into lives_with (Employee ,Person ,Relationship) values (?, ?, ?);
/*
Alter Table housemates
Add Constraint check_HMcn Check(HMcn IN (select employees.HMcn from employees where employees.EMcn = HMcn));

Alter Table housemates
Add Constraint check_HSsn Check(HSsn IN (select employees.ESsn from employees where employees.ESsn = HSsn));

Alter Table housemates
Add Constraint check_HRelationship Check(Upper(HRelationship) IN ('ROOMATE', 'PARTNER', 'PARENT', 'DEPENDENT'));

Alter Table housemates
Add Constraint check_HHouseMate 
    Check(housemates.HAddress IN 
    (select employees.EAddress
    From employees, housemates
    Where housemates.HAddress = employees.EAddress 
    and housemates.HCity = employees.ECity 
    and housemates.HProvince = employees.EProvince 
    and housemates.HPostalCode = employees.EPostalCode));
    */