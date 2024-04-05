using System;
using System.Collections.Generic;
using System.Text;

namespace COMP353ProjectTableGeneration
{
    public class LivesIn
    {
        public Person Person { get; set; }
        public Residence Residence { get; set; }
        public string StartDate { get; set; }

        public static LivesIn[] MakeLivesIn(int amount, Person[] people, Residence[] residences)
        {
            LivesIn[] lives = new LivesIn[amount];

            for (int i = 0; i < lives.Length; i++)
            {
                Person person = people[Functions.RandomNumber(0, people.Length - 1)];
                Residence residence = residences[Functions.RandomNumber(0, residences.Length - 1)];
                int startYear = Functions.RandomNumber(2015, 2024);
                int startMonth = Functions.RandomNumber(1, 12);
                int startDay = Functions.RandomNumber(1, 28);
                lives[i] = new LivesIn(person, residence, Format(startYear, startMonth, startDay));
            }
            return lives;
        }
        private static string Format(int year, int month, int day) => year + "-" + month + "-" + day;
        public LivesIn(Person person, Residence residence, string start)
        {
            Person = person;
            Residence = residence;
            StartDate = start;
        }

        public override string ToString()
        {
            return "('" + Residence.Address + "', '" + Person.SIN + "', '" + StartDate + "')";
        }
    }
}
