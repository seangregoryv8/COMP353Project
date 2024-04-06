DROP DATABASE HFESTS;
CREATE DATABASE HFESTS;
USE HFESTS;

CREATE TABLE Residence
( Address VARCHAR(255) PRIMARY KEY,

 City VARCHAR(255),

 Province VARCHAR(255),

 Postal_code VARCHAR(255),

 Phone VARCHAR(255),

 Bedrooms INT,

 Type VARCHAR(255) CHECK ( Type IN ('Apartment',

 'Condominium',

 'Semi-Detached House',

 'House') ) 

);

CREATE TABLE Person
( SIN VARCHAR(255) PRIMARY KEY,

 FirstName VARCHAR(255),

 LastName VARCHAR(255),

 DateOfBirth DATE,

 MedicareCardNumber VARCHAR(255) NOT NULL UNIQUE,

 TelephoneNumber VARCHAR(255),

 Citizenship VARCHAR(255),

 EmailAddress VARCHAR(255),

 PrimaryResidence VARCHAR(255),

 FOREIGN KEY (PrimaryResidence) REFERENCES Residence(Address) 

);

CREATE TABLE Employee
( SIN VARCHAR(255) PRIMARY KEY,

 Role VARCHAR(255) CHECK ( Role IN ('Nurse',

 'Doctor',

 'Cashier',

 'Pharmacist',

 'Receptionist',

'Administrative Personnel',

 'Security Personnel',

 'Regular Employee') ),

 FOREIGN KEY (SIN) REFERENCES Person(SIN) 

);

CREATE TABLE Facility
( Name VARCHAR(255) PRIMARY KEY ,

 Address VARCHAR(255),

 City VARCHAR(255),

 Province VARCHAR(255),

 Postal_code VARCHAR(255),

 Phone VARCHAR(255),

 Web_address VARCHAR(255),

 Type VARCHAR(255) CHECK ( Type IN ('Hospital',

 'CLSC',

 'Clinic',

 'Pharmacy',

 'Special Instalment') ),

 Capacity INT,

 Managed_by VARCHAR(255),

 FOREIGN KEY (Managed_by) REFERENCES Employee(SIN) 

);

CREATE TABLE Works_at( Employee VARCHAR(255),

 Facility VARCHAR(255),

 Start_date DATE,

 End_date DATE,

 FOREIGN KEY (Employee) REFERENCES Employee(SIN),

 FOREIGN KEY (Facility) REFERENCES Facility(Name),

 primary key (Employee,

 Facility,

 Start_date) 

);

CREATE TABLE lives_in( Residence VARCHAR(255),

 Person VARCHAR(255),

 Address_start_date DATE,

 FOREIGN KEY (Residence) REFERENCES Residence(Address),

 FOREIGN KEY (Person) REFERENCES Person(SIN),

 PRIMARY KEY (Residence,

 Person) 

);

CREATE TABLE lives_with( Employee VARCHAR(255),

 Person VARCHAR(255),

 Relationship VARCHAR(255) CHECK ( Relationship IN ('Roommate',

 'Partner',

 'Parent',

 'Dependent') ),

 FOREIGN KEY (Employee) REFERENCES Employee(SIN),

 FOREIGN KEY (Person) REFERENCES Person(SIN),

 PRIMARY KEY (Employee,

 Person) 

);

CREATE TABLE Infection
( Date DATE,

 Type VARCHAR(255) CHECK ( Type IN ('COVID-19',

 'SARS-Cov-2 Variant',

 'other') ),

 Quarantine_Period INT,

 Person VARCHAR(255) NOT NULL ,

 FOREIGN KEY (Person) REFERENCES Person(SIN),

 PRIMARY KEY (Date,

 Person) 

);

CREATE TABLE Vaccination( Dose INT,

 Type VARCHAR(255) CHECK ( Type IN ( 'Pfizer',

 'Moderna',

 'AstraZeneca',

 'Johnson & Johnson') ),

 Date DATE,

 Person VARCHAR(255) NOT NULL,

 Taken_at VARCHAR(255),

 FOREIGN KEY (Person) REFERENCES Person(SIN),

 FOREIGN KEY (Taken_at) REFERENCES Facility(Name),

 PRIMARY KEY (Person,

 Dose) 

);
