using System;

namespace COMP353ProjectTableGeneration
{
    public class Person
    {
        public string SIN { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public DateTime DateOfBirth { get; set; }
        public string MedicareCardNumber { get; set; }
        public string TelephoneNumber { get; set; }
        public string Citizenship { get; set; }
        public string EmailAddress { get; set; }
        public string Occupation { get; set; }
        // SIN = 0
        // Medicare = 4
        // PrimaryResidence = Last
        public static Person[] MakePeople(int amount)
        {
            Person[] people = new Person[amount];
            var names = Functions.GenerateRandomNames(amount);
            var phones = Functions.GenerateRandomCanadianPhoneNumbers(amount);
            var occupations = Functions.GenerateRandomOccupations(amount);
            for (int i = 0; i < people.Length; i++)
            {
                string sin = Functions.RandomDigits(10).ToString();
                string first = names[i].Split(" ")[0];
                string last = names[i].Split(" ")[1];

                int year = Functions.RandomNumber(1940, 2024);
                int month = Functions.RandomNumber(1, 12);
                int day = Functions.RandomNumber(1, 28);
                DateTime start = new DateTime(year, month, day);

                string med = char.ToString(Functions.GetLetter()) + Functions.RandomDigits(9);

                people[i] = new Person(sin, first, last, start, med, phones[i], "Canadian", occupations[i]);
            }

            return people;
        }
        public Person(string sin, string f, string l, DateTime date, string medicare, string telephone, string citi, string occupation)
        {
            SIN = sin;
            FirstName = f;
            LastName = l;
            DateOfBirth = date;
            MedicareCardNumber = medicare;
            TelephoneNumber = telephone;
            Citizenship = citi;
            EmailAddress = (f + l).ToLower() + Functions.RandomDigits(2) + "@gmail.com";
            Occupation = occupation;
        }
        public static Person Find(string SIN, Person[] people)
        {
            foreach (Person p in people)
            {
                if (p.SIN == SIN) return p;
            }
            return people[0];
        }
        public Person(string sin)
        {
            SIN = sin;
        }
        public string FormatDate(DateTime date) => date.Year + "-" + date.Month + "-" + date.Day;
        public override string ToString()
        {
            return "('" + SIN + "', '" + FirstName + "', '" + LastName + "', '" +
                FormatDate(DateOfBirth) + "', '" + MedicareCardNumber + "', '" + TelephoneNumber + "', '" + Citizenship + "', '" +
                EmailAddress + "', '" + Occupation + "')";
        }
    }
}