/*
INSERT INTO Residence VALUES
('101 Main St', 'Quebec City', 'Quebec', 'H1A 1A1', '5145551010', 3, 'House'),
('103 Main St', 'Montreal', 'Quebec', 'H1A 1A3', '5145551030', 3, 'Condominium'),
('104 Main St', 'Toronto', 'Ontario', 'H1A 1A4', '5145551040', 4, 'House'),
('105 Main St', 'Montreal', 'Manitoba', 'H1A 1A5', '5145551050', 2, 'Apartment'),
('106 Main St', 'Montreal', 'Manitoba', 'H1A 1A6', '5145551060', 3, 'Condominium'),
('107 Main St', 'Regina', 'Saskatchewan', 'H1A 1A7', '5145551070', 4, 'House'),
('108 Main St', 'Waterloo', 'Ontario', 'H1A 1A8', '5145551080', 2, 'Apartment'),
('109 Main St', 'Montreal', 'Quebec', 'H1A 1A9', '5145551090', 3, 'Condominium'),
('110 Main St', 'Ottawa', 'Ontario', 'H1A 1B1', '5145551100', 4, 'House'),
('203 Main St', 'Montreal', 'Quebec', 'H2C 3D4', '514-555-6666', 2, 'Apartment'),
('202 Main St', 'Montreal', 'Quebec', 'H2C 3D4', '514-555-6667', 2, 'Apartment'),
('200 Main St', 'Montreal', 'Quebec', 'H2C 3D4', '514-200-2000', 2, 'Apartment'),
('201 Main St', 'Montreal', 'Quebec', 'H2C 3D5', '514-200-2001', 2, 'Apartment'),
('101 Wawa St', 'Laval', 'Quebec', 'H1D 3D4', '514-555-1040', 3, 'House'),
('102 Lala St', 'Montreal', 'Quebec', 'H5J K8P', '514-555-1020', 2, 'Condominium'),
('103 Jaja St', 'Laval', 'Quebec', 'H1L L0L', '514-122-1030', 1, 'Apartment');

INSERT INTO Person VALUES
('123456789', 'John', 'Doe', '1980-01-01', 'MCN123456', '5145551010', 'Canadian', 'johndoe@email.com', '101 Main St'),
('223456789', 'Jane', 'Smith', '1985-02-02', 'MCN223456', '5145551020', 'Canadian', 'janesmith@email.com', '101 Main St'),
('323456789', 'Emily', 'Johnson', '1990-03-03', 'MCN323456', '5145551030', 'Canadian', 'emilyjohnson@email.com', '101 Main St'),
('423456789', 'Michael', 'Brown', '1982-04-04', 'MCN423456', '5145551040', 'Canadian', 'michaelbrown@email.com', '104 Main St'),
('523456789', 'Sarah', 'Davis', '1986-05-05', 'MCN523456', '5145551050', 'Canadian', 'sarahdavis@email.com', '109 Main St'),
('623456789', 'James', 'Wilson', '1979-06-06', 'MCN623456', '5145551060', 'Canadian', 'jameswilson@email.com', '106 Main St'),
('723456789', 'Patricia', 'Martinez', '1988-07-07', 'MCN723456', '5145551070', 'Canadian', 'patriciamartinez@email.com', '107 Main St'),
('823456789', 'Robert', 'Anderson', '1984-08-08', 'MCN823456', '5145551080', 'Canadian', 'robertanderson@email.com', '108 Main St'),
('923456789', 'Linda', 'Thomas', '1992-09-09', 'MCN923456', '5145551090', 'Canadian', 'lindathomas@email.com', '105 Main St'),
('1023456789', 'David', 'Garcia', '1978-10-10', 'MCN1023456', '5145551100', 'Canadian', 'davidgarcia@email.com', '109 Main St'),
('323456782', 'Max', 'tew', '1985-01-01', 'MCN123', '5141112222', 'Canadian', 'emp1@example.com', '110 Main St'),
('323356582', 'Jonny', 'Smith', '1990-02-02', 'MCN456', '5143334444', 'Canadian', 'emp2@example.com', '110 Main St'),
('SIN100', 'Emma', 'Clark', '1987-03-12', 'MCN100', '514-100-1000', 'Canadian', 'emma.clark@email.com', '201 Main St'),
('SIN101', 'James', 'Wilson', '1991-07-24', 'MCN101', '514-100-1001', 'Canadian','james.wilson@email.com', '200 Main St'),
('SIN102', 'Olivia', 'Martin', '1993-09-15', 'MCN102', '514-102-3000', 'Canadian','olivia.martin@email.com', '203 Main St'),
('SIN103', 'Ethan', 'Brown', '1989-04-18', 'MCN103', '514-103-3001', 'Canadian','ethan.brown@email.com', '200 Main St'),
('SIN104', 'Ava', 'Davis', '1990-05-22', 'MCN104', '514-104-3002', 'Canadian','ava.davis@email.com', '200 Main St'),
('1234', 'John', 'Doe', '1961-07-25', 'MCN123446', '514-555-1010', 'Canadian', 'luppy@email.com', '101 Wawa St'),
('1235', 'Janet', 'Hupper', '1971-02-12', 'MCN223896', '514-555-1020', 'Canadian', 'yuppy@email.com', '102 Lala St'),
('1236', 'Larry', 'Fields', '1980-11-01', 'MCN323425', '514-122-1030', 'Canadian', 'snoopy@email.com', '103 Jaja St'),
('4321', 'Michael', 'Stopper', '1992-06-03', 'MCN423446', '514-555-1040', 'Canadian', 'toopy@email.com', '101 Wawa St'),
('3214', 'Sarah', 'Micheal', '1990-09-30', 'MCN523485', '514-456-1050', 'Canadian', 'foopy@email.com', '101 Wawa St'),
('1546', 'James', 'Brown', '1968-01-25', 'MCN623499', '514-186-1060', 'Canadian', 'woopy@email.com', '103 Jaja St'),
('4685', 'Johnny', 'Brown', '1968-02-25', 'MCN623599', '514-187-1060', 'Canadian', 'woopy2@email.com', '109 Main St'),
('987654321', 'Jack', 'Smith', '1980-01-01', 'MCN123457', '5145551011', 'Canadian', 'jacksmith@email.com', '203 Main St'),
('654987321', 'Alice', 'Johnson', '1985-02-02', 'MCN223457', '5145551021', 'Canadian', 'alicejohnson@email.com', '103 Main St'),
('555555555', 'Tom', 'White', '1990-03-03', 'MCN323457', '5145551031', 'Canadian', 'tomwhite@email.com', '107 Main St'),
('777777777', 'Lucy', 'Miller', '1982-04-04', 'MCN423457', '5145551041', 'Canadian', 'lucymiller@email.com', '104 Main St'),
('666666666', 'Emily', 'Young', '1986-05-05', 'MCN523457', '5145551051', 'Canadian', 'emilyyoung@email.com', '104 Main St'),
('303030303', 'Isabella', 'Garcia', '1978-10-10', 'MCN1023457', '5145551101', 'Canadian', 'isabellagarcia@email.com', '110 Main St'),
('505050505', 'William', 'Smith', '1985-01-01', 'MCN123458', '5141112223', 'Canadian', 'william@example.com', '200 Main St');

INSERT INTO Employee VALUES
('123456789', 'Doctor'),
('223456789', 'Nurse'),
('323456789', 'Receptionist'),
('423456789', 'Pharmacist'),
('523456789', 'Administrative Personnel'),
('623456789', 'Security Personnel'),
('723456789', 'Regular Employee'),
('823456789', 'Doctor'),
('923456789', 'Nurse'),
('1023456789', 'Cashier'),
('323456782', 'Doctor'),
('323356582', 'Nurse'),
('SIN103', 'Doctor'),
('SIN102', 'Nurse'),
('SIN100', 'Doctor'),
('SIN104', 'Nurse'),
('SIN101', 'Cashier'),
('1234', 'Doctor'),
('1235', 'Nurse'),
('1236', 'Administrative Personnel');
select * from employee;

INSERT INTO Facility VALUES
('Montreal General', '200 Health St', 'Montreal', 'Quebec', 'H2B 2B2', '5145552000', 'www.montrealgeneral.com', 'Hospital', 500, '123456789'),
('Downtown Clinic', '300 Care Ave', 'Montreal', 'Quebec', 'H3C 3C3', '5145553000', 'www.downtownclinic.com', 'Clinic', 100, '223456789'),
('Quebec Pharmacy', '400 Med St', 'Quebec City', 'Quebec', 'G1K 4K4', '4185554000', 'www.quebecpharmacy.com', 'Pharmacy', 50, '423456789'),
('Special Health', '500 Wellness Rd', 'Ottawa', 'Ontario', 'K1P 5P5', '6135555000', 'www.specialhealth.com', 'Special Installment', 200, '523456789'),
('Eastside Hospital', '600 Recovery Ln', 'Toronto', 'Ontario', 'M4B 6B6', '4165556000', 'www.eastsidehospital.com', 'Hospital', 300, '623456789'),
('Central Clinic', '700 Aid Blvd', 'Calgary', 'Alberta', 'T2C 7C7', '4035557000', 'www.centralclinic.com', 'Clinic', 150, '723456789'),
('PharmaPlus', '800 Pill St', 'Vancouver', 'British Columbia', 'V5K 8K8', '6045558000', 'www.pharmaplus.com', 'Pharmacy', 40, '823456789'),
('Healthcare Unit', '900 Treatment Tr', 'Halifax', 'Nova Scotia', 'B3K 9K9', '9025559000', 'www.healthcareunit.com', 'Special Installment', 120, '923456789'),
('Westend Hospital', '1000 Cure Ct', 'Victoria', 'British Columbia', 'V8V 1V1', '2505551000', 'www.westendhospital.com', 'Hospital', 350, '1023456789'),
('Suburban Clinic', '1100 Doctor Dr', 'Edmonton', 'Alberta', 'T5J 2J2', '7805551100', 'www.suburbanclinic.com', 'Clinic', 90, '123456789'),
('Hospital Maisonneuve Rosemont', '123 Health Blvd', 'Montreal', 'Quebec', 'H1A 2B3', '514-123-4567', 'www.hmrosement.ca', 'Hospital', 200, 'SIN101');

INSERT INTO Works_at VALUES
('123456789', 'Montreal General', '2020-01-01', '2021-12-31'),
('223456789', 'Downtown Clinic', '2021-01-01', NULL),
('323456789', 'Montreal General', '2019-05-15', '2020-08-30'),
('423456789', 'Quebec Pharmacy', '2018-11-01', NULL),
('523456789', 'Special Health', '2020-06-01', NULL),
('623456789', 'Eastside Hospital', '2019-03-01', '2021-05-31'),
('723456789', 'Central Clinic', '2021-07-01', NULL),
('823456789', 'PharmaPlus', '2020-02-01', '2022-01-31'),
('923456789', 'Healthcare Unit', '2021-04-01', NULL),
('1023456789', 'Westend Hospital', '2021-09-01', NULL),
('323456782', 'Montreal General', '2020-01-01', NULL),
('323356582', 'Montreal General', '2020-05-01', NULL),
('SIN101', 'Hospital Maisonneuve Rosemont', '2020-01-01', NULL),
('SIN102', 'Hospital Maisonneuve Rosemont', '2019-06-01', NULL),
('SIN103', 'Hospital Maisonneuve Rosemont', '2021-01-01', NULL),
('SIN104', 'Hospital Maisonneuve Rosemont', '2022-01-01', NULL),
('1234', 'Hospital Maisonneuve Rosemont', '2012-12-28', NULL),
('1235', 'Hospital Maisonneuve Rosemont', '2008-03-01', NULL),
('1236', 'Hospital Maisonneuve Rosemont', '2015-02-28', '2017-12-25');

INSERT INTO Lives_with VALUES
('123456789', '223456789', 'Roommate'),
('223456789', '123456789', 'Roommate'),
('123456789', '323456789', 'Roommate'),
('323456789', '123456789', 'Roommate'),
('323456789', '223456789', 'Roommate'),
('223456789', '323456789', 'Roommate'),
('523456789', '1023456789', 'Dependent'),
('1023456789', '523456789', 'Parent'),
('323456782', '323356582', 'Roommate'),
('323356582', '323456782', 'Roommate'),
('SIN101', 'SIN104', 'Roommate'),
('SIN104', 'SIN101', 'Roommate'),
('SIN103', 'SIN101', 'Roommate'),
('SIN101', 'SIN103', 'Roommate'),
('SIN103', 'SIN104', 'Roommate'),
('SIN104', 'SIN103', 'Roommate'),
('1234', '4321', 'Roommate'),
('1234', '3214', 'Dependent'),
('SIN102', '987654321', 'Parent'),
('SIN103', '654987321', 'Parent'),
('723456789', '555555555', 'Roommate'),
('423456789', '777777777', 'Roommate'),
('423456789', '666666666', 'Roommate'),
('323456782', '303030303', 'Dependent'),
('323356582', '303030303', 'Dependent'),
('SIN104', '505050505', 'Dependent');

INSERT INTO Infection VALUES
('2023-06-13', 'COVID-19', '4685'),
('2021-01-02', 'COVID-19', '4685'),
('2021-01-03', 'SARS-Cov-2 Variant', '4685'),
('2021-01-04', 'COVID-19', '4685'),
('2021-01-26', 'COVID-19', '123456789'),
('2022-02-17', 'COVID-19', '123456789'),
('2023-01-14', 'COVID-19', '123456789'),
('2023-06-13', 'COVID-19', '123456789'),
('2021-01-02', 'COVID-19', '223456789'),
('2021-01-03', 'SARS-Cov-2 Variant', '323456789'),
('2021-01-04', 'COVID-19', '423456789'),
('2021-01-05', 'SARS-Cov-2 Variant', '523456789'),
('2021-01-06', 'COVID-19', '623456789'),
('2021-02-06', 'SARS-Cov-2 Variant', '723456789'),
('2021-03-06', 'COVID-19', '723456789'),
('2021-04-06', 'COVID-19', '723456789'),
('2021-01-07', 'COVID-19', '723456789'),
('2021-01-08', 'SARS-Cov-2 Variant', '823456789'),
('2021-01-09', 'COVID-19', '923456789'),
('2021-03-07', 'SARS-Cov-2 Variant', '923456789'),
('2021-04-020', 'COVID-19', '923456789'),
('2021-01-10', 'COVID-19', '1023456789'),
('2022-03-01', 'COVID-19', '323356582'),
('2022-04-01', 'COVID-19', 'SIN101'),
('2021-04-20', 'COVID-19', 'SIN102'),
('2022-05-20', 'COVID-19', 'SIN104'),
('2021-04-20', 'COVID-19', '1234'),
('2022-05-02', 'COVID-19', '1234'),
('2022-05-06', 'SARS-Cov-2 Variant', '4321'),
('2022-05-06', 'COVID-19', '1546');
select * from infection;

INSERT INTO Vaccination VALUES
(1, 'Pfizer', '2021-02-01', '123456789', 'Montreal General'),
(1, 'Moderna', '2021-02-02', '223456789', 'Downtown Clinic'),
(1, 'AstraZeneca', '2021-02-03', '323456789', 'Quebec Pharmacy'),
(1, 'Johnson & Johnson', '2021-02-04', '423456789', 'Special Health'),
(2, 'Pfizer', '2021-03-01', '523456789', 'Eastside Hospital'),
(2, 'Moderna', '2021-03-02', '623456789', 'Central Clinic'),
(2, 'AstraZeneca', '2021-03-03', '723456789', 'PharmaPlus'),
(2, 'Johnson & Johnson', '2021-03-04', '823456789', 'Healthcare Unit'),
(3, 'Pfizer', '2021-04-01', '923456789', 'Westend Hospital'),
(3, 'Moderna', '2021-04-02', '1023456789', 'Suburban Clinic'),
(1, 'Johnson & Johnson', '2021-03-04', '1235', 'Healthcare Unit'),
(2, 'Pfizer', '2022-04-01', '1235', 'Westend Hospital'),
(1, 'Pfizer', '2022-04-01', '4321', 'Westend Hospital'),
(1, 'Moderna', '2022-01-02', '1546', 'Suburban Clinic');
select * from vaccination;
drop table vaccination;
drop table infection;
drop table works_at;
drop table facility;
drop table Lives_with;
drop table employee;
drop table person;
drop table residence;
*/
INSERT INTO Residence VALUES
('101 Main St', 'Montreal', 'Quebec', 'H1A 1A1', '5145551010', 3, 'House'),
('102 Main St', 'Montreal', 'Quebec', 'H1A 1A2', '5145551020', 2, 'Apartment'),
('103 Main St', 'Montreal', 'Quebec', 'H1A 1A3', '5145551030', 3, 'Condominium'),
('104 Main St', 'Montreal', 'Quebec', 'H1A 1A4', '5145551040', 4, 'House'),
('105 Main St', 'Montreal', 'Quebec', 'H1A 1A5', '5145551050', 2, 'Apartment'),
('106 Main St', 'Montreal', 'Quebec', 'H1A 1A6', '5145551060', 3, 'Condominium'),
('107 Main St', 'Montreal', 'Quebec', 'H1A 1A7', '5145551070', 4, 'House'),
('108 Main St', 'Montreal', 'Quebec', 'H1A 1A8', '5145551080', 2, 'Apartment'),
('109 Main St', 'Montreal', 'Quebec', 'H1A 1A9', '5145551090', 3, 'Condominium'),
('110 Main St', 'Montreal', 'Quebec', 'H1A 1B1', '5145551100', 4, 'House'),
('101 Wellness Way', 'Montreal', 'Quebec', 'H2C 3D4', '514-555-6666', 2, 'Apartment'),
('102 Wellness Way', 'Montreal', 'Quebec', 'H2C 3D4', '514-555-6667', 2, 'Apartment'),
('200 Main St', 'Montreal', 'Quebec', 'H2C 3D4', '514-200-2000', 2, 'Apartment'),
('201 Main St', 'Montreal', 'Quebec', 'H2C 3D5', '514-200-2001', 2, 'Apartment');


INSERT INTO Person VALUES
('123456789', 'John', 'Doe', '1980-01-01', 'MCN123456', '5145551010', 'Canadian', 'johndoe@email.com', '101 Main St'),
('223456789', 'Jane', 'Smith', '1985-02-02', 'MCN223456', '5145551020', 'Canadian', 'janesmith@email.com', '102 Main St'),
('323456789', 'Emily', 'Johnson', '1990-03-03', 'MCN323456', '5145551030', 'Canadian', 'emilyjohnson@email.com', '101 Main St'),
('423456789', 'Michael', 'Brown', '1982-04-04', 'MCN423456', '5145551040', 'Canadian', 'michaelbrown@email.com', '104 Main St'),
('523456789', 'Sarah', 'Davis', '1986-05-05', 'MCN523456', '5145551050', 'Canadian', 'sarahdavis@email.com', '105 Main St'),
('623456789', 'James', 'Wilson', '1979-06-06', 'MCN623456', '5145551060', 'Canadian', 'jameswilson@email.com', '106 Main St'),
('723456789', 'Patricia', 'Martinez', '1988-07-07', 'MCN723456', '5145551070', 'Canadian', 'patriciamartinez@email.com', '107 Main St'),
('823456789', 'Robert', 'Anderson', '1984-08-08', 'MCN823456', '5145551080', 'Canadian', 'robertanderson@email.com', '108 Main St'),
('923456789', 'Linda', 'Thomas', '1992-09-09', 'MCN923456', '5145551090', 'Canadian', 'lindathomas@email.com', '109 Main St'),
('1023456789', 'David', 'Garcia', '1978-10-10', 'MCN1023456', '5145551100', 'Canadian', 'davidgarcia@email.com', '110 Main St'),
('323456782', 'Max', 'tew', '1985-01-01', 'MCN123', '5141112222', 'Canadian', 'emp1@example.com', '110 Main St'),
('323356582', 'Jonny', 'Smith', '1990-02-02', 'MCN456', '5143334444', 'Canadian', 'emp2@example.com', '110 Main St'),
('SIN100', 'Emma', 'Clark', '1987-03-12', 'MCN100', '514-100-1000', 'Canadian', 'emma.clark@email.com', '200 Main St'),
('SIN101', 'James', 'Wilson', '1991-07-24', 'MCN101', '514-100-1001', 'Canadian','james.wilson@email.com', '201 Main St'),
('SIN102', 'Olivia', 'Martin', '1993-09-15', 'MCN102', '514-102-3000', 'Canadian','olivia.martin@email.com', '200 Main St'),
('SIN103', 'Ethan', 'Brown', '1989-04-18', 'MCN103', '514-103-3001', 'Canadian','ethan.brown@email.com', '200 Main St'),
('SIN104', 'Ava', 'Davis', '1990-05-22', 'MCN104', '514-104-3002', 'Canadian','ava.davis@email.com', '201 Main St'),
('SIN001', 'Alice', 'Johnson', '1980-01-01', 'MCN001', '514-111-2222', 'Canadian','alice.johnson@email.com', '101 Wellness Way'),
('SIN002', 'Bob', 'Smith', '1985-05-05', 'MCN002', '514-333-4444', 'Canadian' ,'bob.smith@email.com', '101 Wellness Way'),
('SIN003', 'Emily', 'Taylor', '1992-03-15', 'MCN003', '514-555-0101', 'Canadian', 'emily.taylor@email.com', '101 Wellness Way'),
('SIN004', 'Daniel', 'Brown', '1988-07-22', 'MCN004', '514-555-0202', 'Canadian','daniel.brown@email.com', '101 Wellness Way'),
('SIN005', 'Sophia', 'Martinez', '1990-11-30', 'MCN005', '514-555-0303', 'Canadian','sophia.martinez@email.com', '102 Wellness Way'),
('SIN006', 'Luke', 'Wilson', '1986-05-06', 'MCN006', '514-555-0404', 'Canadian','luke.wilson@email.com', '102 Wellness Way');


INSERT INTO Employee VALUES
('123456789', 'Doctor'),
('223456789', 'Nurse'),
('323456789', 'Receptionist'),
('423456789', 'Pharmacist'),
('523456789', 'Administrative Personnel'),
('623456789', 'Security Personnel'),
('723456789', 'Regular Employee'),
('823456789', 'Doctor'),
('923456789', 'Nurse'),
('1023456789', 'Cashier'),
('323456782', 'Doctor'),
('323356582', 'Nurse'),
('SIN001', 'Doctor'),
('SIN002', 'Nurse'),
('SIN100', 'Doctor'),
('SIN101', 'Cashier');


INSERT INTO Facility VALUES
('Montreal General', '200 Health St', 'Montreal', 'Quebec', 'H2B 2B2', '5145552000', 'www.montrealgeneral.com', 'Hospital', 500, '123456789'),
('Downtown Clinic', '300 Care Ave', 'Montreal', 'Quebec', 'H3C 3C3', '5145553000', 'www.downtownclinic.com', 'Clinic', 100, '223456789'),
('Quebec Pharmacy', '400 Med St', 'Quebec City', 'Quebec', 'G1K 4K4', '4185554000', 'www.quebecpharmacy.com', 'Pharmacy', 50, '423456789'),
('Special Health', '500 Wellness Rd', 'Ottawa', 'Ontario', 'K1P 5P5', '6135555000', 'www.specialhealth.com', 'Special Installment', 200, '523456789'),
('Eastside Hospital', '600 Recovery Ln', 'Toronto', 'Ontario', 'M4B 6B6', '4165556000', 'www.eastsidehospital.com', 'Hospital', 300, '623456789'),
('Central Clinic', '700 Aid Blvd', 'Calgary', 'Alberta', 'T2C 7C7', '4035557000', 'www.centralclinic.com', 'Clinic', 150, '723456789'),
('PharmaPlus', '800 Pill St', 'Vancouver', 'British Columbia', 'V5K 8K8', '6045558000', 'www.pharmaplus.com', 'Pharmacy', 40, '823456789'),
('Healthcare Unit', '900 Treatment Tr', 'Halifax', 'Nova Scotia', 'B3K 9K9', '9025559000', 'www.healthcareunit.com', 'Special Installment', 120, '923456789'),
('Westend Hospital', '1000 Cure Ct', 'Victoria', 'British Columbia', 'V8V 1V1', '2505551000', 'www.westendhospital.com', 'Hospital', 350, '1023456789'),
('Suburban Clinic', '1100 Doctor Dr', 'Edmonton', 'Alberta', 'T5J 2J2', '7805551100', 'www.suburbanclinic.com', 'Clinic', 90, '123456789'),
('Hospital Maisonneuve Rosemont', '123 Health Blvd', 'Montreal', 'Quebec', 'H1A 2B3', '514-123-4567', 'www.hmrosement.ca', 'Hospital', 200, 'SIN001');


INSERT INTO Works_at VALUES
('123456789', 'Montreal General', '2020-01-01', NULL),
('223456789', 'Downtown Clinic', '2021-01-01', NULL),
('323456789', 'Montreal General', '2019-05-15', '2020-08-30'),
('423456789', 'Quebec Pharmacy', '2018-11-01', NULL),
('523456789', 'Special Health', '2020-06-01', NULL),
('623456789', 'Eastside Hospital', '2019-03-01', '2021-05-31'),
('723456789', 'Central Clinic', '2021-07-01', NULL),
('823456789', 'PharmaPlus', '2020-02-01', '2022-01-31'),
('923456789', 'Healthcare Unit', '2021-04-01', NULL),
('1023456789', 'Westend Hospital', '2021-09-01', NULL),
('323456782', 'Montreal General', '2020-01-01', NULL),
('323356582', 'Montreal General', '2020-05-01', NULL),
('SIN001', 'Hospital Maisonneuve Rosemont', '2020-01-01', NULL),
('SIN002', 'Hospital Maisonneuve Rosemont', '2019-06-01', NULL),
('SIN100', 'Hospital Maisonneuve Rosemont', '2021-01-01', NULL),
('SIN101', 'Hospital Maisonneuve Rosemont', '2022-01-01', NULL);

INSERT INTO Lives_with VALUES
('123456789', '223456789', 'Roommate'),
('123456789', '323456789', 'Roommate'),
('223456789', '423456789', 'Partner'),
('223456789', '523456789', 'Partner'),
('323456789', '623456789', 'Parent'),
('323456789', '723456789', 'Parent'),
('423456789', '823456789', 'Dependent'),
('423456789', '923456789', 'Dependent'),
('523456789', '1023456789', 'Dependent'),
('523456789', '123456789', 'Dependent'),
('323456782', '323356582', 'Roommate'),
('SIN001', 'SIN003', 'Roommate'),
('SIN001', 'SIN004', 'Roommate'),
('SIN002', 'SIN005', 'Roommate'),
('SIN002', 'SIN006', 'Roommate'),
('SIN101', 'SIN103', 'Parent'),
('SIN101', 'SIN104', 'Parent');

INSERT INTO Infection (Date, Type, Quarantine_Period, Person) VALUES ('2024-02-10', 'COVID-19', 14, '123456789');
INSERT INTO Infection (Date, Type, Quarantine_Period, Person) VALUES ('2024-02-12', 'COVID-19', 14, '223456789');
INSERT INTO Infection (Date, Type, Quarantine_Period, Person) VALUES ('2024-02-13', 'SARS-Cov-2 Variant', 7, '323456789');
INSERT INTO Infection (Date, Type, Quarantine_Period, Person) VALUES ('2024-02-14', 'COVID-19', 7, '423456789');
INSERT INTO Infection (Date, Type, Quarantine_Period, Person) VALUES ('2024-02-15', 'SARS-Cov-2 Variant', 7, '523456789');
INSERT INTO Infection (Date, Type, Quarantine_Period, Person) VALUES ('2024-02-16', 'COVID-19', 14, '623456789');
INSERT INTO Infection (Date, Type, Quarantine_Period, Person) VALUES ('2024-02-17', 'COVID-19', 10, '723456789');
INSERT INTO Infection (Date, Type, Quarantine_Period, Person) VALUES ('2024-02-18', 'SARS-Cov-2 Variant', 7, '823456789');
INSERT INTO Infection (Date, Type, Quarantine_Period, Person) VALUES ('2024-02-19', 'COVID-19', 14, '923456789');
INSERT INTO Infection (Date, Type, Quarantine_Period, Person) VALUES ('2024-02-10', 'COVID-19', 14, '1023456789');
INSERT INTO Infection (Date, Type, Quarantine_Period, Person) VALUES ('2024-02-10', 'COVID-19', 14, '323356582');
INSERT INTO Infection (Date, Type, Quarantine_Period, Person) VALUES ('2024-02-11', 'COVID-19', 7, 'SIN101');
INSERT INTO Infection (Date, Type, Quarantine_Period, Person) VALUES ('2024-02-14', 'COVID-19', 10, 'SIN102');
INSERT INTO Infection (Date, Type, Quarantine_Period, Person) VALUES ('2024-02-15', 'COVID-19', 10, 'SIN102');
INSERT INTO Infection (Date, Type, Quarantine_Period, Person) VALUES ('2024-02-16', 'COVID-19', 10, 'SIN102');
INSERT INTO Infection (Date, Type, Quarantine_Period, Person) VALUES ('2024-02-17', 'COVID-19', 7, 'SIN101');
INSERT INTO Infection (Date, Type, Quarantine_Period, Person) VALUES ('2024-02-13', 'COVID-19', 7, 'SIN101');
INSERT INTO Infection (Date, Type, Quarantine_Period, Person) VALUES ('2024-02-12', 'COVID-19', 7, 'SIN101');


INSERT INTO Vaccination VALUES
(1, 'Pfizer', '2021-02-01', '123456789', 'Montreal General'),
(1, 'Moderna', '2021-02-02', '223456789', 'Downtown Clinic'),
(1, 'AstraZeneca', '2021-02-03', '323456789', 'Quebec Pharmacy'),
(1, 'Johnson & Johnson', '2021-02-04', '423456789', 'Special Health'),
(2, 'Pfizer', '2021-03-01', '523456789', 'Eastside Hospital'),
(2, 'Moderna', '2021-03-02', '623456789', 'Central Clinic'),
(2, 'AstraZeneca', '2021-03-03', '723456789', 'PharmaPlus'),
(2, 'Johnson & Johnson', '2021-03-04', '823456789', 'Healthcare Unit'),
(3, 'Pfizer', '2021-04-01', '923456789', 'Westend Hospital'),
(3, 'Moderna', '2021-04-02', '1023456789', 'Suburban Clinic');

