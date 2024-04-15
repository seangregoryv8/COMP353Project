using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Numerics;
using System.Text;
using System.Text.Json;
using System.Text.Json.Serialization;
using Newtonsoft.Json;
using static COMP353ProjectTableGeneration.Employee;
using static COMP353ProjectTableGeneration.Facility;

namespace COMP353ProjectTableGeneration
{
    class Program
    {
        // Program made by: Sean Gregory
        private static void Polish(ref StringBuilder builder)
        {
            builder.Remove(builder.Length - 2, 2);
            builder.Append(";\n\n");
        }
        public static Residence[] Residences(int amount, ref StringBuilder mainBuilder)
        {
            StringBuilder builder = new StringBuilder();
            Residence[] residences = Residence.MakeResidences(amount);
            residences = residences.Distinct().ToArray();
            builder.Append("INSERT INTO Residence VALUES\n");
            foreach (Residence residence in residences)
                builder.Append(residence.ToString() + ",\n");
            Polish(ref builder);
            Export(builder, ref mainBuilder, "Residence");
            return residences;
        }
        public static Person[] People(int amount, ref StringBuilder mainBuilder)
        {
            StringBuilder builder = new StringBuilder();
            Person[] people = Person.MakePeople(amount);
            people = people.Distinct().ToArray();
            builder.Append("INSERT INTO Person VALUES\n");
            foreach (Person person in people)
                builder.Append(person.ToString() + ",\n");
            Polish(ref builder);
            Export(builder, ref mainBuilder, "Person");
            return people;
        }
        public static Employee[] Employees(int amount, ref StringBuilder mainBuilder, Person[] people)
        {
            StringBuilder builder = new StringBuilder();
            Employee[] employees = Employee.MakeEmployees(amount, people);
            employees = employees.Distinct().ToArray();
            builder.Append("INSERT INTO Employee VALUES\n");
            foreach (Employee employee in employees)
                builder.Append(employee.ToString() + ",\n");
            Polish(ref builder);
            Export(builder, ref mainBuilder, "Employee");
            return employees;
        }
        public static Facility[] Facilities(int amount, ref StringBuilder mainBuilder, Employee[] employees)
        {
            StringBuilder builder = new StringBuilder();
            Facility[] facilities = Facility.MakeFacilities(amount, employees);
            facilities = facilities.Distinct().ToArray();
            builder.Append("INSERT INTO Facility VALUES\n");
            foreach (Facility facility in facilities)
                builder.Append(facility.ToString() + ",\n");
            Polish(ref builder);
            Export(builder, ref mainBuilder, "Facility");
            return facilities;
        }
        public static WorksAt[] Works(int amount, ref StringBuilder mainBuilder, Employee[] employees, Facility[] facilities)
        {
            StringBuilder builder = new StringBuilder();
            WorksAt[] works = WorksAt.MakeWorksAt(amount, employees, facilities);
            works = works.Distinct().ToArray();
            builder.Append("INSERT INTO Works_at VALUES\n");
            foreach (WorksAt work in works)
                builder.Append(work.ToString() + ",\n");
            Polish(ref builder);
            Export(builder, ref mainBuilder, "Works_at");
            return works;
        }
        public static LivesIn[] Lives_In(int amount, ref StringBuilder mainBuilder, Person[] people, Residence[] residences)
        {
            StringBuilder builder = new StringBuilder();
            LivesIn[] livesIn = LivesIn.MakeLivesIn(amount, people, residences);
            livesIn = livesIn.Distinct().ToArray();
            builder.Append("INSERT INTO lives_in VALUES\n");
            foreach (LivesIn live in livesIn)
                builder.Append(live.ToString() + ",\n");
            Polish(ref builder);
            Export(builder, ref mainBuilder, "Lives_in");
            return livesIn;
        }
        public static LivesWith[] Lives_With(int amount, ref StringBuilder mainBuilder, Person[] people, Employee[] employees)
        {
            StringBuilder builder = new StringBuilder();
            LivesWith[] livesWith = LivesWith.MakeLivesWith(amount, people, employees);
            livesWith = livesWith.Distinct().ToArray();
            builder.Append("INSERT INTO lives_with VALUES\n");
            foreach (LivesWith live in livesWith)
                builder.Append(live.ToString() + ",\n");
            Polish(ref builder);
            Export(builder, ref mainBuilder, "Lives_with");
            return livesWith;
        }
        public static Infection[] Infections(int amount, ref StringBuilder mainBuilder, Person[] people)
        {
            StringBuilder builder = new StringBuilder();
            Infection[] infections = Infection.MakeInfections(amount, people);
            infections = infections.Distinct().ToArray();
            builder.Append("INSERT INTO Infection VALUES\n");
            foreach (Infection infection in infections)
                builder.Append(infection.ToString() + ",\n");
            Polish(ref builder);
            Export(builder, ref mainBuilder, "Infection");
            return infections;
        }
        public static Vaccine[] Vaccines(int amount, ref StringBuilder mainBuilder, Person[] people, Facility[] facilities)
        {
            StringBuilder builder = new StringBuilder();
            Vaccine[] vaccines = Vaccine.MakeVaccines(amount, people, facilities);
            vaccines = vaccines.Distinct().ToArray();
            builder.Append("INSERT INTO Vaccination VALUES\n");
            foreach (Vaccine vaccine in vaccines)
                builder.Append(vaccine.ToString() + ",\n");
            Polish(ref builder);
            Export(builder, ref mainBuilder, "Vaccine");
            return vaccines;
        }
        public static Schedule[] Schedules(int amount, ref StringBuilder mainBuilder, Facility[] facilities, Employee[] employees)
        {
            StringBuilder builder = new StringBuilder();
            Schedule[] schedules = Schedule.MakeSchedules(amount, facilities, employees);
            schedules = schedules.Distinct().ToArray();
            builder.Append("INSERT INTO Schedule VALUES\n");
            foreach (Schedule schedule in schedules)
                builder.Append(schedule.ToString() + ",\n");
            Polish(ref builder);
            Export(builder, ref mainBuilder, "Schedule");
            return schedules;
        }
        static void Main()
        {
            Create.PrintAll(true);
            StringBuilder mainBuilder = new StringBuilder();


            Residence[] residences = Residences(30, ref mainBuilder);
            Person[] people = People(           40, ref mainBuilder);
            Employee[] employees = Employees(   35, ref mainBuilder, people);
            Facility[] facilities = Facilities( 25, ref mainBuilder, employees);
            WorksAt[] works = Works(            40, ref mainBuilder, employees, facilities);
            LivesIn[] livesIn = Lives_In(       40, ref mainBuilder, people, residences);
            LivesWith[] livesWith = Lives_With( 40, ref mainBuilder, people, employees);
            Infection[] infections = Infections(50, ref mainBuilder, people);
            Vaccine[] vaccines = Vaccines(      45, ref mainBuilder, people, facilities);
            Schedule[] schedules = Schedules(   30, ref mainBuilder, facilities, employees);

            string appPath = Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().Location);
            int tableLocation = appPath.IndexOf("COMP353ProjectTableGeneration");
            appPath = appPath.Remove(tableLocation, appPath.Length - tableLocation);

            if (!Directory.Exists(appPath)) Directory.CreateDirectory(appPath);

            //EmergencyWorks(appPath, mainBuilder);
            mainBuilder.Append(File.ReadAllText(appPath + "\\Insert\\Residence.txt"));
            mainBuilder.Append(File.ReadAllText(appPath + "\\Insert\\Person.txt"));
            mainBuilder.Append(File.ReadAllText(appPath + "\\Insert\\Employee.txt"));
            mainBuilder.Append(File.ReadAllText(appPath + "\\Insert\\Facility.txt"));
            mainBuilder.Append(File.ReadAllText(appPath + "\\Insert\\Works_at.txt"));
            mainBuilder.Append(File.ReadAllText(appPath + "\\Insert\\Lives_in.txt"));
            mainBuilder.Append(File.ReadAllText(appPath + "\\Insert\\Lives_with.txt"));
            mainBuilder.Append(File.ReadAllText(appPath + "\\Insert\\Infection.txt"));
            mainBuilder.Append(File.ReadAllText(appPath + "\\Insert\\Vaccine.txt"));
            mainBuilder.Append(File.ReadAllText(appPath + "\\Insert\\Schedule.txt"));

            Export(mainBuilder, ref mainBuilder, "All", ".sql");
        }
        public static void EmergencyWorks(string appPath, StringBuilder mainBuilder)
        {
            List<List<string>> person = GetList(File.ReadAllText(appPath + "\\Insert\\Person.txt"));
            List<List<string>> employee = GetList(File.ReadAllText(appPath + "\\Insert\\Employee.txt"));
            List<List<string>> facility = GetList(File.ReadAllText(appPath + "\\Insert\\Facility.txt"));
            List<List<string>> works = GetList(File.ReadAllText(appPath + "\\Insert\\Works_at.txt"));

            List<Person> people = new List<Person>();
            List<Employee> employees = new List<Employee>();
            List<Facility> facilities = new List<Facility>();

            foreach (List<string> i in person)
                people.Add(new Person(i[0]));
            foreach (List<string> i in employee)
            {
                switch (i[1])
                {
                    case "Administrative Personnel":
                        i[1] = "Administrative";
                        break;
                    case "Security Personnel":
                        i[1] = "Security";
                        break;
                    case "Regular Employee":
                        i[1] = "Regular";
                        break;
                }
                TypesOfEmployee type = (TypesOfEmployee)Enum.Parse(typeof(TypesOfEmployee), i[1], true);
                employees.Add(new Employee(Person.Find(i[0], people.ToArray()), type));
            }
            foreach (List<string> i in facility)
            {
                // i.Count() - 1 = Employee
                // i.Count() - 3 = Type
                if (i[i.Count() - 3] == "Special Instalment") i[i.Count() - 3] = "Special";
                TypesOfFacilities type = (TypesOfFacilities)Enum.Parse(typeof(TypesOfFacilities), i[i.Count() - 3], true);
                facilities.Add(new Facility(i[0], type, Employee.Find(i[i.Count() - 1], employees.ToArray())));
            }

            int am = Convert.ToInt32(employees.Count() * .75);

            WorksAt[] worksEm = Works(am, ref mainBuilder, employees.ToArray(), facilities.ToArray());
        }
        public static List<List<string>> GetList(string text)
        {
            text = text.Substring(text.IndexOf('('), text.Length - text.IndexOf('('));
            string[] people = text.Split("),");
            List<List<string>> attributes = new List<List<string>>();
            foreach (string p in people)
            {
                string newstr = p.Replace("\r", "").Replace("\n", "").Replace("(", "").Replace(")", "").Replace(";", "");
                List<string> att = newstr.Replace("'", "").Split(",").ToList();
                for (int i = 0; i < att.Count(); i++)
                    att[i] = att[i].Trim();
                attributes.Add(att);
            }
            return attributes;
        }
        public static void Export(StringBuilder builder, ref StringBuilder mainBuilder, string name, string extension = ".txt")
        {
            string appPath = Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().Location);
            int tableLocation = appPath.IndexOf("COMP353ProjectTableGeneration");
            appPath = appPath.Remove(tableLocation, appPath.Length - tableLocation);
            appPath += (extension == ".sql") ? "SQL" : "Insert";

            if (!Directory.Exists(appPath)) Directory.CreateDirectory(appPath);

            //File.AppendAllText(Path.Combine(appPath, name + extension), builder.ToString());
            using StreamWriter outputFile = new StreamWriter(Path.Combine(appPath, name + extension));
            outputFile.WriteLine(builder);
            mainBuilder.Append(builder.ToString());
        }
    }
}