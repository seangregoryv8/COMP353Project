using System;
using System.Collections.Generic;
using System.Linq;

namespace COMP353ProjectTableGeneration
{
    public class LivesIn
    {
        public enum TypesOfLodging
        {
            Primary,
            Secondary
        }
        public Person Person { get; set; }
        public Residence Residence { get; set; }
        public string StartDate { get; set; }
        public string EndDate { get; set; }
        public TypesOfLodging Status { get; set; }

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
                DateTime start = new DateTime(startYear, startMonth, startDay);
                DateTime end;

                int endYear;
                int endMonth;
                int endDay;
                do
                {
                    endYear = Functions.RandomNumber(startYear, 2024);
                    endMonth = Functions.RandomNumber(1, 12);
                    endDay = Functions.RandomNumber(1, 28);
                    end = new DateTime(endYear, endMonth, endDay);
                } while (end < start);

                lives[i] = new LivesIn(person, residence, Format(startYear, startMonth, startDay), Format(endYear, endMonth, endDay), TypesOfLodging.Secondary);
            }

            for (int i = 0; i < residences.Length; i++)
            {
                DateTime end = DateTime.Now;
                lives[i] = new LivesIn(people[Functions.RandomNumber(0, residences.Length - 1)], residences[i],
                    Format(Functions.RandomYear(1970), Functions.RandomMonth(), Functions.RandomDay()), Format(end.Year, end.Month, end.Day), TypesOfLodging.Primary);
            }

            List<LivesIn> LivesIn1 = lives.OfType<LivesIn>().ToList();

            for (int i = LivesIn1.Count() - 1; i >= 0; i--)
            {
                for (int j = 0; j < LivesIn1.Count; j++)
                {
                    if (i != j && LivesIn1[i].Person == LivesIn1[j].Person && LivesIn1[i].Residence == LivesIn1[j].Residence && LivesIn1[i].Status == TypesOfLodging.Primary && LivesIn1[j].Status == TypesOfLodging.Primary)
                        LivesIn1.RemoveAt(j);
                }
            }
            return LivesIn1.ToArray();
        }
        private static string Format(int year, int month, int day) => year + "-" + month + "-" + day;
        public LivesIn(Person person, Residence residence, string start, string end, TypesOfLodging typesOfLodging)
        {
            Person = person;
            Residence = residence;
            StartDate = start;
            EndDate = end;
            Status = typesOfLodging;
        }

        public override string ToString()
        {
            return "('" + Residence.Address + "', '" + Person.SIN + "', '" + StartDate + "', '" + EndDate + "', '" + Status + "')";
        }
    }
}
