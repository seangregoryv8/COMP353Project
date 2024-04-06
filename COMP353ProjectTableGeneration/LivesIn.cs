using System;

namespace COMP353ProjectTableGeneration
{
    public class LivesIn
    {
        public Person Person { get; set; }
        public Residence Residence { get; set; }
        public string StartDate { get; set; }

        public static LivesIn[] MakeLivesIn(int amount, Person[] people, Residence[] residences)
        {
            LivesIn[] lives = new LivesIn[amount + people.Length];

            for (int i = 0; i < lives.Length; i++)
            {
                Person person = people[Functions.RandomNumber(0, people.Length - 1)];
                Residence residence = residences[Functions.RandomNumber(0, residences.Length - 1)];
                int startYear = Functions.RandomNumber(2015, 2024);
                int startMonth = Functions.RandomNumber(1, 12);
                int startDay = Functions.RandomNumber(1, 28);
                lives[i] = new LivesIn(person, residence, Format(startYear, startMonth, startDay));
            }

            for (int i = 0; i < people.Length; i++)
            {
                Residence residence = Array.Find(residences, residence => residence.Equals(people[i].PrimaryResidence));
                lives[i] = new LivesIn(people[i], residence, Format(Functions.RandomYear(1970), Functions.RandomMonth(), Functions.RandomDay()));
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
