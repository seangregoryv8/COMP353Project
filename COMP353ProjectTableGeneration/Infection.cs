using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace COMP353ProjectTableGeneration
{
    public class Infection
    {
        public enum TypesOfInfection
        {
            COVID19,
            SARS,
            Other
        }
        public DateTime Date { get; set; }
        public TypesOfInfection Type { get; set; }
        public int QuarantinePeriod { get; set; }
        public Person Person { get; set; }
        public static Infection[] MakeInfections(int amount, Person[] people)
        {
            Infection[] infections = new Infection[amount];

            for (int i = 0; i < infections.Length; i++)
            {
                int year = Functions.RandomNumber(2020, 2024);
                int month = Functions.RandomNumber(1, 12);
                int day = Functions.RandomNumber(1, 28);
                DateTime start = new DateTime(year, month, day);

                var rnd = new Random();
                Array values = Enum.GetValues(typeof(TypesOfInfection));
                TypesOfInfection randomBar = (TypesOfInfection)values.GetValue(rnd.Next(values.Length));
                
                Person person = people[Functions.RandomNumber(0, people.Length)];

                infections[i] = new Infection(start, randomBar, Functions.RandomNumber(1, 14), person);
            }

            List<Infection> Infections1 = infections.OfType<Infection>().ToList();

            for (int i = Infections1.Count() - 1; i >= 0; i--)
            {
                for (int j = 0; j < Infections1.Count; j++)
                {
                    if (i != j && Infections1[i].Date == Infections1[j].Date && Infections1[i].Person == Infections1[j].Person)
                        Infections1.RemoveAt(j);
                }
            }

            return Infections1.ToArray();
        }
        public Infection(DateTime date, TypesOfInfection type, int period, Person person)
        {
            Date = date;
            Type = type;
            QuarantinePeriod = period;
            Person = person;
        }
        public override string ToString()
        {
            string type = string.Empty;
            if (Type == TypesOfInfection.COVID19) type = "COVID-19";
            if (Type == TypesOfInfection.SARS) type = "SARS-Cov-2 Variant";
            if (Type == TypesOfInfection.Other) type = "Other";
            return "('" + Date.Year + "-" + Date.Month + "-" + Date.Day + "', '" + type + "', " + QuarantinePeriod + ", '" + Person.SIN + "')";
        }
    }
}