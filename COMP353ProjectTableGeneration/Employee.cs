using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace COMP353ProjectTableGeneration
{
    public class Employee
    {
        public enum TypesOfEmployee
        {
            Nurse,
            Doctor,
            Cashier,
            Pharmacist,
            Receptionist,
            Administrative,
            Security,
            Regular
        }
        public Person SIN { get; set; }
        public TypesOfEmployee Role { get; set; }
        public static Employee[] MakeEmployees(int amount, Person[] people)
        {
            Employee[] employees = new Employee[amount];
            var rnd = new Random();
            var randomNumbers = Enumerable.Range(1, people.Length).OrderBy(x => rnd.Next()).Take(amount).ToList();

            for (int i = 0; i < employees.Length; i++)
            {
                Array values = Enum.GetValues(typeof(TypesOfEmployee));
                Random random = new Random();
                TypesOfEmployee randomBar = (TypesOfEmployee)values.GetValue(random.Next(values.Length));

                int randomNumber = randomNumbers[(people.Length - 1 < i) ? Functions.RandomNumber(0, randomNumbers.Count) : i];
                Person person = people[randomNumber - 1];

                employees[i] = new Employee(person, randomBar);
            }
            return employees;
        }
        public Employee(Person sin, TypesOfEmployee role)
        {
            SIN = sin;
            Role = role;
        }

        public override string ToString()
        {
            string type = Role.ToString();
            if (type == "Administrative" || type == "Security") type += " Personnel";
            if (type == "Regular") type += " Employee";
            return "('" + SIN.SIN + "', '" + type + "')";
        }
    }
}
