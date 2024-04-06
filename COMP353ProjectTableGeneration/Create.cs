using System.IO;
using System.Text;
using System.Reflection;

namespace COMP353ProjectTableGeneration
{
    public static class Create
    {
        public static string PrintStart()
        {
            StringBuilder builder = new StringBuilder("DROP DATABASE HFESTS;\nCREATE DATABASE HFESTS \nWITH OWNER = postgres \nENCODING = 'UTF8' \nLC_COLLATE = 'en_US.UTF-8' \nLC_CTYPE = 'en_US.UTF-8' \nTABLESPACE = pg_default \nONNECTION LIMIT = -1 \nTEMPLATE = False;\n\nUSE HFESTS;");
            return Export(ref builder, MethodBase.GetCurrentMethod().Name);
        }
        public static string PrintResidence()
        {
            StringBuilder builder = new StringBuilder("CREATE TABLE Residence( Address VARCHAR(255) PRIMARY KEY, City VARCHAR(255), Province VARCHAR(255), Postal_code VARCHAR(255), Phone VARCHAR(255), Bedrooms INT, Type VARCHAR(255) CHECK ( Type IN ('Apartment', 'Condominium', 'Semi-Detached House', 'House') ) );");
            return Export(ref builder, MethodBase.GetCurrentMethod().Name);
        }
        public static string PrintPerson()
        {
            StringBuilder builder = new StringBuilder("CREATE TABLE Person( SIN VARCHAR(255) PRIMARY KEY, FirstName VARCHAR(255), LastName VARCHAR(255), DateOfBirth DATE, MedicareCardNumber VARCHAR(255) NOT NULL UNIQUE, TelephoneNumber VARCHAR(255), Citizenship VARCHAR(255), EmailAddress VARCHAR(255), PrimaryResidence VARCHAR(255), FOREIGN KEY (PrimaryResidence) REFERENCES Residence(Address) );");
            return Export(ref builder, MethodBase.GetCurrentMethod().Name);
        }
        public static string PrintEmployee()
        {
            StringBuilder builder = new StringBuilder("CREATE TABLE Employee( SIN VARCHAR(255) PRIMARY KEY, Role VARCHAR(255) CHECK ( Role IN ('Nurse', 'Doctor', 'Cashier', 'Pharmacist', 'Receptionist','Administrative Personnel', 'Security Personnel', 'Regular Employee') ), FOREIGN KEY (SIN) REFERENCES Person(SIN) );");
            return Export(ref builder, MethodBase.GetCurrentMethod().Name);
        }
        public static string PrintFacility()
        {
            StringBuilder builder = new StringBuilder("CREATE TABLE Facility( Name VARCHAR(255) PRIMARY KEY , Address VARCHAR(255), City VARCHAR(255), Province VARCHAR(255), Postal_code VARCHAR(255), Phone VARCHAR(255), Web_address VARCHAR(255), Type VARCHAR(255) CHECK ( Type IN ('Hospital', 'CLSC', 'Clinic', 'Pharmacy', 'Special Instalment') ), Capacity INT, Managed_by VARCHAR(255), FOREIGN KEY (Managed_by) REFERENCES Employee(SIN) );");
            return Export(ref builder, MethodBase.GetCurrentMethod().Name);
        }
        public static string PrintWorksAt()
        {
            StringBuilder builder = new StringBuilder("CREATE TABLE Works_at( Employee VARCHAR(255), Facility VARCHAR(255), Start_date DATE, End_date DATE, FOREIGN KEY (Employee) REFERENCES Employee(SIN), FOREIGN KEY (Facility) REFERENCES Facility(Name), primary key (Employee, Facility, Start_date) );");
            return Export(ref builder, MethodBase.GetCurrentMethod().Name);
        }
        public static string PrintLivesIn()
        {
            StringBuilder builder = new StringBuilder("CREATE TABLE lives_in( Residence VARCHAR(255), Person VARCHAR(255), Address_start_date DATE, FOREIGN KEY (Residence) REFERENCES Residence(Address), FOREIGN KEY (Person) REFERENCES Person(SIN), PRIMARY KEY (Residence, Person) );");
            return Export(ref builder, MethodBase.GetCurrentMethod().Name);
        }
        public static string PrintLivesWith()
        {
            StringBuilder builder = new StringBuilder("CREATE TABLE lives_with( Employee VARCHAR(255), Person VARCHAR(255), Relationship VARCHAR(255) CHECK ( Relationship IN ('Roommate', 'Partner', 'Parent', 'Dependent') ), FOREIGN KEY (Employee) REFERENCES Employee(SIN), FOREIGN KEY (Person) REFERENCES Person(SIN), PRIMARY KEY (Employee, Person) );");
            return Export(ref builder, MethodBase.GetCurrentMethod().Name);
        }
        public static string PrintInfection()
        {
            StringBuilder builder = new StringBuilder("CREATE TABLE Infection( Date DATE, Type VARCHAR(255) CHECK ( Type IN ('COVID-19', 'SARS-Cov-2 Variant', 'other') ), Quarantine_Period INT, Person VARCHAR(255) NOT NULL , FOREIGN KEY (Person) REFERENCES Person(SIN), PRIMARY KEY (Date, Person) );");
            return Export(ref builder, MethodBase.GetCurrentMethod().Name);
        }
        public static string PrintVaccine()
        {
            StringBuilder builder = new StringBuilder("CREATE TABLE Vaccination( Dose INT, Type VARCHAR(255) CHECK ( Type IN ( 'Pfizer', 'Moderna', 'AstraZeneca', 'Johnson & Johnson') ), Date DATE, Person VARCHAR(255) NOT NULL, Taken_at VARCHAR(255), FOREIGN KEY (Person) REFERENCES Person(SIN), FOREIGN KEY (Taken_at) REFERENCES Facility(Name), PRIMARY KEY (Person, Dose) );");
            return Export(ref builder, MethodBase.GetCurrentMethod().Name);
        }
        public static string PrintAll(bool start)
        {
            StringBuilder builder = new StringBuilder();
            if (start) builder.Append(PrintStart() + "\n\n");
            builder.Append(PrintResidence() + "\n\n");
            builder.Append(PrintPerson() + "\n\n");
            builder.Append(PrintEmployee() + "\n\n");
            builder.Append(PrintFacility() + "\n\n");
            builder.Append(PrintWorksAt() + "\n\n");
            builder.Append(PrintLivesIn() + "\n\n");
            builder.Append(PrintLivesWith() + "\n\n");
            builder.Append(PrintInfection() + "\n\n");
            builder.Append(PrintVaccine());
            return Export(ref builder, MethodBase.GetCurrentMethod().Name, ".sql");
        }
        public static string Export(ref StringBuilder builder, string name, string extension = ".txt")
        {
            name = name.Replace("Print", "");
            builder.Replace(name + "(", name + "\n(");
            builder.Replace(",", ",\n");
            builder.Replace(");", "\n);");
            //builder.Replace(")\n;", ");");
            string appPath = Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location);
            int tableLocation = appPath.IndexOf("COMP353ProjectTableGeneration");
            appPath = appPath.Remove(tableLocation, appPath.Length - tableLocation);
            appPath += (extension == ".sql") ? "SQL" : "Create";
            bool exists = Directory.Exists(appPath);

            if (!exists)
                Directory.CreateDirectory(appPath);

            if (extension == ".sql") name = "Creates";
            using StreamWriter outputFile = new StreamWriter(Path.Combine(appPath, name + extension));
            outputFile.WriteLine(builder);
            return builder.ToString();
        }
    }
}