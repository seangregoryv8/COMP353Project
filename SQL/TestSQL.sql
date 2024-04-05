DROP DATABASE HFESTS;
CREATE DATABASE HFESTS;
USE HFESTS;
    
CREATE TABLE Residence(
    Address VARCHAR(255) PRIMARY KEY,
    City VARCHAR(255),
    Province VARCHAR(255),
    Postal_code VARCHAR(255),
    phone VARCHAR(255),
    Bedrooms INT,
    Type VARCHAR(255) CHECK ( Type IN ('Apartment', 'Condominium', 'Semidetached House', 'House') )
);
CREATE TABLE Person(
    SIN VARCHAR(255) PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    DateOfBirth DATE,
    MedicareCardNumber VARCHAR(255) NOT NULL UNIQUE,
    TelephoneNumber VARCHAR(255),
    Citizenship VARCHAR(255),
    EmailAddress VARCHAR(255),
    Lives_in VARCHAR(255) NOT NULL,
    FOREIGN KEY (Lives_in) REFERENCES Residence(Address)
);
CREATE TABLE Employee(
    SIN VARCHAR(255) PRIMARY KEY,
    Role VARCHAR(255) CHECK ( Role IN ('Nurse', 'Doctor', 'Cashier', 'Pharmacist', 'Receptionist','Administrative Personnel', 'Security Personnel', 'Regular Employee') ),
    FOREIGN KEY (SIN) REFERENCES Person(SIN)
);
CREATE TABLE Facility(
    Name VARCHAR(255) PRIMARY KEY ,
    Address VARCHAR(255),
    City VARCHAR(255),
    Province VARCHAR(255),
    Postal_code VARCHAR(255),
    Phone VARCHAR(255),
    Web_address VARCHAR(255),
    Type VARCHAR(255) CHECK ( Type IN ('Hospital', 'CLSC', 'Clinic', 'Pharmacy', 'Special Installment') ),
    Capacity INT,
    Managed_by VARCHAR(255),
    FOREIGN KEY (Managed_by) REFERENCES Employee(SIN)
);
CREATE TABLE Works_at(
    Employee VARCHAR(255),
    Facility VARCHAR(255),
    Start_date DATE,
    End_date DATE,
    FOREIGN KEY (Employee) REFERENCES Employee(SIN),
    FOREIGN KEY (Facility) REFERENCES Facility(Name),
    primary key (Employee, Facility, Start_date)
);
CREATE TABLE lives_with(
    Employee VARCHAR(255),
    Person VARCHAR(255),
    Relationship VARCHAR(255) CHECK ( Relationship IN ('Roommate', 'Partner', 'Parent', 'Dependent') ),
    FOREIGN KEY (Employee) REFERENCES Employee(SIN),
    FOREIGN KEY (Person) REFERENCES Person(SIN),
    PRIMARY KEY (Employee, Person)
);
CREATE TABLE Infection(
    Date DATE,
    Type VARCHAR(255) CHECK ( Type IN ('COVID-19', 'SARS-Cov-2 Variant', 'other') ),
    Quarantine_Period INT,
    Person VARCHAR(255) NOT NULL ,
    FOREIGN KEY (Person) REFERENCES Person(SIN),
    PRIMARY KEY (Date, Person)
);
CREATE TABLE Vaccination(
    Dose INT,
    Type VARCHAR(255) CHECK ( Type IN ( 'Pfizer', 'Moderna', 'AstraZeneca', 'Johnson & Johnson') ),
    Date DATE,
    Person VARCHAR(255) NOT NULL,
    Taken_at VARCHAR(255),
    FOREIGN KEY (Person) REFERENCES Person(SIN),
    FOREIGN KEY (Taken_at) REFERENCES Facility(Name),
    PRIMARY KEY (Person, Dose)
);

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
('SIN100', 'SIN102', 'Partner'),
('SIN101', 'SIN103', 'Parent'),
('SIN101', 'SIN104', 'Parent');

INSERT INTO Infection VALUES
('2024-02-10', 'COVID-19', 14, '123456789'),
('2024-02-12', 'COVID-19', 14, '223456789'),
('2024-02-13', 'SARS-Cov-2 Variant', 7, '323456789'),
('2024-02-14', 'COVID-19', 7, '423456789'),
('2024-02-15', 'SARS-Cov-2 Variant', 7, '523456789'),
('2024-02-16', 'COVID-19', 14, '623456789'),
('2024-02-17', 'COVID-19', 10, '723456789'),
('2024-02-18', 'SARS-Cov-2 Variant', 7, '823456789'),
('2024-02-19', 'COVID-19', 14, '923456789'),
('2024-02-10', 'COVID-19', 14, '1023456789'),
('2024-02-10', 'COVID-19', 14, '323356582'),
('2024-02-11', 'COVID-19', 7, 'SIN001'),
('2024-02-14', 'COVID-19', 10, 'SIN002'),
('2024-02-15','COVID-19',10,'SIN002'),
('2024-02-16', 'COVID-19',10, 'SIN002'),
('2024-02-17', 'COVID-19',7, 'SIN001'),
('2024-02-13', 'COVID-19',7, 'SIN001'),
('2024-02-12', 'COVID-19',7, 'SIN001');

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

SELECT person.FirstName, person.LastName, Count(lives_with.Person), residence.Address, residence.City, residence.Province
FROM employee, lives_with, residence, person, works_at works_at1, works_at works_at2
WHERE person.SIN= employee.SIN
and employee.SIN = lives_with.Employee 
and lives_with.Person In (SELECT employee.SIN FROM employee)
and employee.SIN = works_at1.Employee 
and lives_with.Person = works_at2.Employee
and works_at1.Facility = works_at2.Facility
and person.Lives_In = residence.Address 
-- and works_at.Facility = 'Facility Name'
GROUP BY employee.SIN
ORDER BY residence.province ASC, residence.City ASC, residence.Address ASC;