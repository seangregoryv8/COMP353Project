using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Text.Json.Serialization;
using Newtonsoft.Json;

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
        public static Person[] People(int amount, ref StringBuilder mainBuilder, Residence[] residences)
        {
            StringBuilder builder = new StringBuilder();
            Person[] people = Person.MakePeople(amount, residences);
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
            builder.Append("INSERT INTO Vaccine VALUES\n");
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
            var stopwatch = Stopwatch.StartNew();
            Create.PrintAll(true);
            StringBuilder mainBuilder = new StringBuilder();

            Residence[] residences = Residences(40, ref mainBuilder);
            Person[] people = People(           40, ref mainBuilder, residences);
            Employee[] employees = Employees(   35, ref mainBuilder, people);
            Facility[] facilities = Facilities( 25, ref mainBuilder, employees);
            WorksAt[] works = Works(            40, ref mainBuilder, employees, facilities);
            LivesIn[] livesIn = Lives_In(       40, ref mainBuilder, people, residences.ToArray());
            LivesWith[] livesWith = Lives_With( 40, ref mainBuilder, people, employees);
            Infection[] infections = Infections(50, ref mainBuilder, people);
            Vaccine[] vaccines = Vaccines(      45, ref mainBuilder, people, facilities);
            Schedule[] schedules = Schedules(   30, ref mainBuilder, facilities, employees);

            //List<Residence> res = residences.OfType<Residence>().ToList();
            //string json = System.Text.Json.JsonSerializer.Serialize(res);
            //

            stopwatch.Stop();
            Console.WriteLine($"Elapsed time for creating all: {stopwatch.ElapsedMilliseconds} ms");
            Export(mainBuilder, ref mainBuilder, "All", ".sql");
            Console.Read();
        }
        public static void Export(StringBuilder builder, ref StringBuilder mainBuilder, string name, string extension = ".txt")
        {
            string appPath = Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().Location);
            int tableLocation = appPath.IndexOf("COMP353ProjectTableGeneration");
            appPath = appPath.Remove(tableLocation, appPath.Length - tableLocation);
            appPath += (extension == ".sql") ? "SQL" : "Insert";

            bool exists = Directory.Exists(appPath);

            if (!exists)
                Directory.CreateDirectory(appPath);

            if (extension == ".sql") name = "Inserts";
            using StreamWriter outputFile = new StreamWriter(Path.Combine(appPath, name + extension));
            outputFile.WriteLine(builder);
            mainBuilder.Append(builder.ToString());
        }
    }
}