DROP TABLE IF EXISTS EmailLog;
DROP TABLE IF EXISTS Schedule;
DROP TABLE IF EXISTS Vaccination;
DROP TABLE IF EXISTS Infection;
DROP TABLE IF EXISTS Works_at;
DROP TABLE IF EXISTS Lives_in;
DROP TABLE IF EXISTS Lives_with;
DROP TABLE IF EXISTS Facility;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Person;
DROP TABLE IF EXISTS Residence;


CREATE TABLE Residence
(
    Address VARCHAR(255) PRIMARY KEY,
    City VARCHAR(255),
    Province VARCHAR(255),
    Postal_code VARCHAR(255),
    Phone VARCHAR(255),
    Bedrooms INT,
    Type VARCHAR(255) CHECK ( Type IN ('Apartment', 'Condominium', 'Semi-Detached House', 'House') ) 
);

CREATE TABLE Person
(
    SIN VARCHAR(255) PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    DateOfBirth DATE,
    MedicareCardNumber VARCHAR(255) NOT NULL UNIQUE,
    TelephoneNumber VARCHAR(255),
    Citizenship VARCHAR(255),
    EmailAddress VARCHAR(255),
    Occupation VARCHAR(255)
);

CREATE TABLE Employee
(
    SIN VARCHAR(255) PRIMARY KEY,
    Role VARCHAR(255) CHECK (
        Role IN (
            'Nurse',
            'Doctor',
            'Cashier',
            'Pharmacist',
            'Receptionist',
            'Administrative Personnel',
            'Security Personnel',
            'Regular Employee'
        )
    ),
    FOREIGN KEY (SIN) REFERENCES Person(SIN) ON DELETE CASCADE
);

CREATE TABLE Facility
(
    Name VARCHAR(255) PRIMARY KEY,
    Address VARCHAR(255),
    City VARCHAR(255),
    Province VARCHAR(255),
    Postal_code VARCHAR(255),
    Phone VARCHAR(255),
    Web_address VARCHAR(255),
    Type VARCHAR(255) CHECK ( Type IN ('Hospital', 'CLSC', 'Clinic', 'Pharmacy', 'Special Instalment') ),
    Capacity INT,
    Managed_by VARCHAR(255),
    FOREIGN KEY (Managed_by) REFERENCES Employee(SIN) ON DELETE CASCADE
);

CREATE TABLE Works_at
(
    Employee VARCHAR(255),
    Facility VARCHAR(255),
    Start_date DATE,
    End_date DATE,
    FOREIGN KEY (Employee) REFERENCES Employee(SIN) ON DELETE CASCADE,
    FOREIGN KEY (Facility) REFERENCES Facility(Name) ON DELETE CASCADE,
    PRIMARY KEY (Employee, Facility, Start_date) 
);

CREATE TABLE Lives_in
(
    Residence VARCHAR(255),
    Person VARCHAR(255),
    Address_start_date DATE,
    End_date DATE,
    Status VARCHAR(255) CHECK ( Status IN ('Primary', 'Secondary')),
    FOREIGN KEY (Residence) REFERENCES Residence(Address) ON DELETE CASCADE,
    FOREIGN KEY (Person) REFERENCES Person(SIN) ON DELETE CASCADE,
    PRIMARY KEY (Residence, Person)
);

CREATE TABLE Lives_with
(
    Employee VARCHAR(255),
    Person VARCHAR(255),
    Relationship VARCHAR(255) CHECK ( Relationship IN ('Roommate','Partner','Parent','Non-Parent Dependent','Children') ),
    FOREIGN KEY (Employee) REFERENCES Employee(SIN) ON DELETE CASCADE,
    FOREIGN KEY (Person) REFERENCES Person(SIN) ON DELETE CASCADE,
    PRIMARY KEY (Employee, Person)
);

CREATE TABLE Infection
(
    Date DATE,
    Type VARCHAR(255) CHECK ( Type IN ('COVID-19', 'SARS-Cov-2 Variant', 'Other') ),
    Quarantine_Period INT,
    Person VARCHAR(255) NOT NULL,
    FOREIGN KEY (Person) REFERENCES Person(SIN) ON DELETE CASCADE,
    PRIMARY KEY (Date, Person)
);

CREATE TABLE Vaccination
(
    Dose INT,
    Type VARCHAR(255) CHECK ( Type IN ( 'Pfizer', 'Moderna', 'AstraZeneca', 'Johnson & Johnson') ),
    Date DATE,
    Person VARCHAR(255) NOT NULL,
    Taken_at VARCHAR(255),
    FOREIGN KEY (Person) REFERENCES Person(SIN) ON DELETE CASCADE,
    FOREIGN KEY (Taken_at) REFERENCES Facility(Name) ON DELETE CASCADE,
    PRIMARY KEY (Person, Dose) 
);

CREATE TABLE Schedule
(
    Date DATE,
    Start_time TIMESTAMP,
    End_time TIMESTAMP,
    Scheduled_at VARCHAR(255),
    Scheduled_for VARCHAR(255),
    FOREIGN KEY (Scheduled_at) REFERENCES Facility(Name) ON DELETE CASCADE,
    FOREIGN KEY (Scheduled_for) REFERENCES Employee(SIN) ON DELETE CASCADE,
    PRIMARY KEY (Scheduled_at, Scheduled_for, Date, Start_time), CHECK ( Start_time < End_time ) 
);

CREATE TABLE EmailLog(
    EmailID INT AUTO_INCREMENT PRIMARY KEY,
    Date DATE,
    Subject VARCHAR(255),
    Body VARCHAR(100),
    Sender VARCHAR(255),
    Receiver VARCHAR(255),
    FOREIGN KEY (Sender) REFERENCES Facility(Name),
    FOREIGN KEY (Receiver) REFERENCES Employee(SIN)
);

# ------------------------------------------------------------------------------------
# If Employee is granted Manager Position, Change his role to Administrative Personnel
# ------------------------------------------------------------------------------------
CREATE TRIGGER after_facility_update
AFTER UPDATE ON Facility
FOR EACH ROW
BEGIN
    IF EXISTS (
        SELECT 1 FROM Works_at WHERE Employee = NEW.Managed_by AND Facility = NEW.Name
    ) THEN
        -- Update the employee's role
        UPDATE Employee
        SET Role = 'Administrative Personnel'
        WHERE Employee.SIN = NEW.managed_by;
    ELSEIF NEW.Managed_by IS NOT NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Employee does not exist or does not work at this facility';
    END IF;
END;

# ------------------------------------------------------------------------------------
# If Employee is granted Manager Position, Change his role to Administrative Personnel
# ------------------------------------------------------------------------------------
CREATE TRIGGER after_facility_insert
AFTER INSERT ON Facility
FOR EACH ROW
BEGIN
    -- Check if managed_by has changed and the employee works at the facility
    IF EXISTS (
        SELECT 1 FROM Works_at WHERE Employee = NEW.Managed_by AND Facility = NEW.Name
    ) THEN
        -- Update the employee's role
        UPDATE Employee
        SET Role = 'Administrative Personnel'
        WHERE Employee.SIN = NEW.managed_by;
    ELSEIF NEW.Managed_by IS NOT NULL THEN
		UPDATE Employee
        SET Role = 'Administrative Personnel'
        WHERE Employee.SIN = NEW.managed_by;
        Insert Into Works_at(Employee, Facility, Start_date, End_date) VALUES (NEW.MANAGED_BY, NEW.NAME, CURDATE(), NULL);
    END IF;
END;
# ------------------------------------------------------------------------------------
# Prevent Adding Schedules more than 4 weeks ahead
# ------------------------------------------------------------------------------------
CREATE TRIGGER check_schedule_date_before_insert
BEFORE INSERT ON Schedule
FOR EACH ROW
BEGIN
    IF NEW.Date > CURRENT_DATE + INTERVAL 4 WEEK THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Schedule date cannot be more than 4 weeks ahead';
    END IF;
END;
 
# ------------------------------------------------------------------------------------
# Prevent Adding conflicting schedules
# ------------------------------------------------------------------------------------
 
CREATE TRIGGER check_schedule_conflict_before_insert
BEFORE INSERT ON Schedule
FOR EACH ROW
BEGIN
    IF EXISTS (
        SELECT 1
        FROM Schedule AS s
        WHERE s.Scheduled_for = NEW.Scheduled_for
        AND s.Date = NEW.Date
        AND (
            (NEW.Start_time < s.End_time AND NEW.End_time > s.Start_time)
        )
    ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'New schedule conflicts with an existing schedule';
    END IF;
END;
 
# ------------------------------------------------------------------------------------
# Prevent Adding Schedules in the same day that don't have a 2 hours gap
# ------------------------------------------------------------------------------------
 
CREATE TRIGGER check_schedule_gap_before_insert
BEFORE INSERT ON Schedule
FOR EACH ROW
BEGIN
    -- Ensure no schedule starts within 2 hours after the new schedule ends
    IF EXISTS (
        SELECT 1
        FROM Schedule AS s
        WHERE s.Scheduled_for = NEW.Scheduled_for
        AND s.Date = NEW.Date
        AND s.Start_time < ADDTIME(NEW.End_time, '2:00:00')
        AND s.Start_time > NEW.Start_time
    ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'An existing schedule ends less than 2 hours before the new schedule starts.';
    END IF;

    -- Ensure no schedule ends within 2 hours before the new schedule starts
    IF EXISTS (
        SELECT 1
        FROM Schedule AS s
        WHERE s.Scheduled_for = NEW.Scheduled_for
        AND s.Date = NEW.Date
        AND s.End_time > SUBTIME(NEW.Start_time, '2:00:00')
        AND s.End_time < NEW.End_time
    ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'New schedule starts less than 2 hours after an existing schedule.';
    END IF;
END;
 
# ------------------------------------------------------------------------------------
# Prevent Adding Schedules to infected Doctors and Nurses
# ------------------------------------------------------------------------------------
 
CREATE TRIGGER prevent_covid_exposure_nurse_or_doctor
BEFORE INSERT ON Schedule
FOR EACH ROW
BEGIN
    -- Check if the employee is a nurse or doctor and is within the two-week infection window
    IF EXISTS (
        SELECT 1
        FROM Employee
        JOIN Infection ON Employee.SIN = Infection.Person
        WHERE Employee.SIN = NEW.Scheduled_for
        AND Employee.Role IN ('Nurse', 'Doctor')  -- Ensure 'Role' is the correct column name for the profession
        AND NEW.Date BETWEEN Infection.Date AND DATE_ADD(Infection.Date, INTERVAL 14 DAY)
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'This nurse or doctor was infected less than two weeks ago and cannot be scheduled.';
    END IF;
END;
 
# ------------------------------------------------------------------------------------
# Prevent Adding Schedules for employees without at least one vaccine with vaccination
# date not within last 6 month
# ------------------------------------------------------------------------------------
 
CREATE TRIGGER check_vaccination_before_scheduling
BEFORE INSERT ON Schedule
FOR EACH ROW
BEGIN
    -- Check if the employee has received at least one vaccine dose in the last 6 months before the schedule date and the schedule date is not before the vaccination date
    IF NOT EXISTS (
        SELECT 1
        FROM Vaccination
        WHERE Person = NEW.Scheduled_for
        AND Date <= NEW.Date -- Ensure the vaccination date is before or on the schedule date
        AND Date >= DATE_SUB(NEW.Date, INTERVAL 6 MONTH) -- And the vaccination date is within the last 6 months from the schedule date
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'This employee cannot be scheduled due to lack of recent vaccination or inappropriate scheduling prior to vaccination.';
    END IF;
END;
 
# ------------------------------------------------------------------------------------
# Verify that Employee Works at a Facility before inserting them
# ------------------------------------------------------------------------------------
 
CREATE TRIGGER check_employment_before_scheduling
BEFORE INSERT ON Schedule
FOR EACH ROW
BEGIN
    -- Check if the employee still works at the facility
    IF NOT EXISTS (
        SELECT 1
        FROM Works_at
        WHERE Employee = NEW.Scheduled_for
        AND Facility = NEW.Scheduled_at
        AND (end_date IS NULL OR end_date >= NEW.Date) -- Still employed or employment ends on or after the new schedule date
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'This employee does not work at the scheduled facility or is no longer employed there as of the schedule date.';
    END IF;
END;
 
# ------------------------------------------------------------------------------------
# After an infection is recorded:
# 1. Notify Employee that their shifts are canceled for the next 2 weeks
# 2. Notify the Employees that were in touch with this employee
# 3. Remove the shifts of the Employee for the next 2 weeks
# ------------------------------------------------------------------------------------
 
CREATE TRIGGER After_Infection_Detected
AFTER INSERT ON Infection
FOR EACH ROW
BEGIN
    -- Send an email from each facility where the infected employee has scheduled assignments within the next 14 days
    INSERT INTO EmailLog (Date, Subject, Body, Sender, Receiver)
    SELECT DISTINCT CURDATE(),
           'Notification of Schedule Cancellation',
           'Due to a recent infection, your schedule at our facility have been cancelled for the next two weeks.',
           Scheduled_at, Scheduled_for
    FROM Schedule
    WHERE Scheduled_for = NEW.Person
    AND Date BETWEEN NEW.Date AND DATE_ADD(NEW.Date, INTERVAL 14 DAY);
    -- Send an exposure notification email to all employees who worked with the infected person within the last 14 days
    INSERT INTO EmailLog (Date, Subject, Body, Sender, Receiver)
    SELECT CURDATE(),
           'Warning',
           'One of your colleagues with whom you worked in the past two weeks has been infected with COVID-19',
           s.Scheduled_at,  -- Facility name sending the alert
           s.Scheduled_for  -- Employee receiving the alert
    FROM Schedule s
    JOIN Schedule s2 ON s.Scheduled_at = s2.Scheduled_at AND s.Date = s2.Date
    WHERE s2.Scheduled_for = NEW.Person
    AND s.Date BETWEEN DATE_SUB(NEW.Date, INTERVAL 14 DAY) AND NEW.Date
    AND s.Scheduled_for <> NEW.Person
    AND NOT (s.End_time <= s2.Start_time OR s.Start_time >= s2.End_time);
    -- Delete the Schedule
    DELETE FROM Schedule
    WHERE Scheduled_for = NEW.Person
    AND Date BETWEEN NEW.Date AND DATE_ADD(NEW.Date, INTERVAL 14 DAY);

END;
 
# ------------------------------------------------------------------------------------
# Ensure Person has one primary residence at a time
# ------------------------------------------------------------------------------------
 
CREATE TRIGGER Ensure_Single_Primary BEFORE INSERT ON lives_in
FOR EACH ROW
BEGIN
    -- Check if the new residence entry is set to 'Primary'
    IF NEW.Status = 'Primary' THEN
        IF NEW.End_date IS NOT NULL AND NEW.End_date < CURDATE() THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid date: You must still be residing in your primary residence';
        END IF;

        -- Check for any other primary residences that overlap in date
        IF EXISTS (
            SELECT 1
            FROM lives_in
            WHERE Person = NEW.Person
            AND Status = 'Primary'
            AND Residence <> NEW.Residence
        ) THEN
            -- If there is another primary residence that overlaps, raise an error
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'There can only be one primary residence per person at a time.';
        END IF;
    END IF;
END;
 
 
CREATE TRIGGER Ensure_Single_Primary_Update BEFORE UPDATE ON lives_in
FOR EACH ROW
BEGIN
    -- Check if the updated residence entry is set to 'Primary'
    IF NEW.Status = 'Primary' THEN
        IF NEW.End_date IS NOT NULL AND NEW.End_date < CURDATE() THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid date: You must still be residing in your primary residence';
        END IF;
        IF EXISTS (
            SELECT 1
            FROM lives_in
            WHERE Person = NEW.Person
            AND Status = 'Primary'
            AND Residence <> NEW.Residence
        ) THEN
            -- If there is another primary residence that overlaps, raise an error
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'There can only be one primary residence per person at a time.';
        END IF;
    END IF;
END;
 
