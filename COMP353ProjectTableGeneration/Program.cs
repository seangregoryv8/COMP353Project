using System;
using System.IO;
using System.Linq;
using System.Text;

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
        static void Main()
        {
            StringBuilder builder = new StringBuilder();
            Residence[] residences = Residence.MakeResidences(30);
            residences = residences.Distinct().ToArray();
            builder.Append("INSERT INTO Residence VALUES\n");
            foreach (Residence residence in residences)
                builder.Append(residence.ToString() + ",\n");
            Polish(ref builder);
            Export(ref builder, "Residence");

            Person[] people = Person.MakePeople(100, residences);
            people = people.Distinct().ToArray();
            builder.Append("INSERT INTO Person VALUES\n");
            foreach (Person person in people)
                builder.Append(person.ToString() + ",\n");
            Polish(ref builder);
            Export(ref builder, "Person");

            Employee[] employees = Employee.MakeEmployees(30, people);
            employees = employees.Distinct().ToArray();
            builder.Append("INSERT INTO Employee VALUES\n");
            foreach (Employee employee in employees)
                builder.Append(employee.ToString() + ",\n");
            Polish(ref builder);
            Export(ref builder, "Employee");

            Facility[] facilities = Facility.MakeFacilities(25, employees);
            facilities = facilities.Distinct().ToArray();
            builder.Append("INSERT INTO Facility VALUES\n");
            foreach (Facility facility in facilities)
                builder.Append(facility.ToString() + ",\n");
            Polish(ref builder);
            Export(ref builder, "Facility");

            WorksAt[] works = WorksAt.MakeWorksAt(45, employees, facilities);
            works = works.Distinct().ToArray();
            builder.Append("INSERT INTO Works_at VALUES\n");
            foreach (WorksAt work in works)
                builder.Append(work.ToString() + ",\n");
            Polish(ref builder);
            Export(ref builder, "Works_at");

            LivesIn[] livesIn = LivesIn.MakeLivesIn(50, people, residences);
            livesIn = livesIn.Distinct().ToArray();
            builder.Append("INSERT INTO lives_in VALUES\n");
            foreach (LivesIn live in livesIn)
                builder.Append(live.ToString() + ",\n");
            Polish(ref builder);
            Export(ref builder, "Lives_in");

            LivesWith[] livesWith = LivesWith.MakeLivesWith(50, people, employees);
            livesWith = livesWith.Distinct().ToArray();
            builder.Append("INSERT INTO lives_with VALUES\n");
            foreach (LivesWith live in livesWith)
                builder.Append(live.ToString() + ",\n");
            Polish(ref builder);
            Export(ref builder, "Lives_with");

            Infection[] infections = Infection.MakeInfections(40, people);
            infections = infections.Distinct().ToArray();
            builder.Append("INSERT INTO Infection VALUES\n");
            foreach (Infection infection in infections)
                builder.Append(infection.ToString() + ",\n");
            Polish(ref builder);
            Export(ref builder, "Infection");

            Vaccine[] vaccines = Vaccine.MakeVaccines(80, people, facilities);
            vaccines = vaccines.Distinct().ToArray();
            builder.Append("INSERT INTO Vaccine VALUES\n");
            foreach (Vaccine vaccine in vaccines)
                builder.Append(vaccine.ToString() + ",\n");
            Polish(ref builder);
            Export(ref builder, "Vaccine");
        }
        public static void Export(ref StringBuilder builder, string name)
        {
            string appPath = Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().Location);
            int tableLocation = appPath.IndexOf("COMP353ProjectTableGeneration");
            appPath = appPath.Remove(tableLocation, appPath.Length - tableLocation);
            appPath += "Inserts";

            // Write the string array to a new file named "WriteLines.txt".
            using StreamWriter outputFile = new StreamWriter(Path.Combine(appPath, name + ".txt"));
            outputFile.WriteLine(builder);
            builder.Clear();
        }
    }
}