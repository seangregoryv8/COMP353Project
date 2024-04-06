using System;
using System.Collections.Generic;
using System.Text;

namespace COMP353ProjectTableGeneration
{
    public class LivesWith
    {
        public enum TypesOfRelationships
        {
            Roommate,
            Partner,
            Parent,
            Dependant,
            Children
        }
        public Person Person { get; set; }
        public Employee Employee { get; set; }
        public TypesOfRelationships Relationship { get; set; }

        public static LivesWith[] MakeLivesWith(int amount, Person[] people, Employee[] employees)
        {
            LivesWith[] lives = new LivesWith[amount];

            for (int i = 0; i < lives.Length; i++)
            {
                Person person = people[Functions.RandomNumber(0, people.Length - 1)];
                Employee employee;
                do
                {
                    employee = employees[Functions.RandomNumber(0, employees.Length - 1)];
                } while (employee.SIN.SIN == person.SIN);
                var rnd = new Random();
                Array values = Enum.GetValues(typeof(TypesOfRelationships));
                TypesOfRelationships randomBar = (TypesOfRelationships)values.GetValue(rnd.Next(values.Length));
                lives[i] = new LivesWith(person, employee, randomBar);
            }
            return lives;
        }
        public LivesWith(Person person, Employee employee, TypesOfRelationships relationship)
        {
            Person = person;
            Employee = employee;
            Relationship = relationship;
        }

        public override string ToString()
        {
            string relationship = string.Empty;
            switch (Relationship)
            {
                case TypesOfRelationships.Dependant: relationship = "Non-Parent Dependent"; break;
                default: relationship = Relationship.ToString(); break;
            }
            return "('" + Employee.SIN.SIN + "', '" + Person.SIN + "', '" + relationship + "')";
        }
    }
}
