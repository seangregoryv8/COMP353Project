using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace COMP353ProjectTableGeneration
{
    public class Vaccine
    {
        public enum TypesOfVaccines
        {
            Pfizer,
            Moderna,
            AstraZeneca,
            Johnson
        }
        public int Dose { get; set; }
        public TypesOfVaccines Type { get; set; }
        public DateTime Date { get; set; }
        public Person Person { get; set; }
        public Facility TakenAt { get; set; }

        public static Vaccine[] MakeVaccines(int amount, Person[] people, Facility[] facilities)
        {
            Vaccine[] vaccines = new Vaccine[amount];

            for (int i = 0; i < vaccines.Length; i++)
            {
                int year = Functions.RandomNumber(2020, 2024);
                int month = Functions.RandomNumber(1, 12);
                int day = Functions.RandomNumber(1, 28);
                DateTime start = new DateTime(year, month, day);

                var rnd = new Random();
                Array values = Enum.GetValues(typeof(TypesOfVaccines));
                TypesOfVaccines randomBar = (TypesOfVaccines)values.GetValue(rnd.Next(values.Length));

                Person person = people[Functions.RandomNumber(0, people.Length)];
                Facility facility = facilities[Functions.RandomNumber(0, facilities.Length)];

                
                vaccines[i] = new Vaccine(Functions.RandomNumber(1, 9), randomBar, start, person, facility);
            }

            return vaccines;
        }
        public Vaccine(int dose, TypesOfVaccines vaccine, DateTime date, Person person, Facility facility)
        {
            Dose = dose;
            Type = vaccine;
            Date = date;
            Person = person;
            TakenAt = facility;
        }
        public override string ToString()
        {
            string type = Type.ToString();
            if (Type == TypesOfVaccines.Johnson) type = "Johnson & Johnson";
            return "(" + Dose + ", '" + type + "', '" + Date.Year + "-" + Date.Month + "-" + Date.Day + "', '" + Person.SIN + "', '" + TakenAt.Name + "')";
        }
    }
}
