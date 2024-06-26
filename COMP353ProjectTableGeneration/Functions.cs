﻿using System;
using System.Collections.Generic;

namespace COMP353ProjectTableGeneration
{
    public static class Functions
    {
        public static string RandomDigits(int length)
        {
            var random = new Random();
            string s = string.Empty;
            for (int i = 0; i < length; i++)
                s = string.Concat(s, random.Next(10).ToString());
            return s;
        }
        public static char GetLetter()
        {
            string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            Random rand = new Random();
            int num = rand.Next(0, chars.Length);
            return chars[num];
        }
        public static int RandomNumber(int min, int max)
        {
            Random number = new Random();
            return number.Next(min, max);
        }

        public static List<string> canadianProvinces = new List<string>()
        {
            "Alberta",
            "British Columbia",
            "Manitoba",
            "New Brunswick",
            "Newfoundland and Labrador",
            "Nova Scotia",
            "Ontario",
            "Prince Edward Island",
            "Quebec",
            "Saskatchewan",
            "Northwest Territories",
            "Nunavut",
            "Yukon"
        };
        public static string GetProvince() => canadianProvinces[RandomNumber(0, canadianProvinces.Count - 1)];
        public static string[] streetTypes = { "Street", "Avenue", "Lane", "Drive", "Court", "Circle", "Road", "Way", "Boulevard", "Terrace" };
        public static string[] streetNames = { "Elm", "Maple", "Oak", "Cedar", "Pine", "Birch", "Willow", "Spruce", "Hickory", "Magnolia" };
        public static List<string> GenerateRandomAddresses(int count)
        {
            List<string> addresses = new List<string>();
            Random random = new Random();

            while (addresses.Count < count)
            {
                string address = $"{streetNames[random.Next(streetNames.Length)]} {streetTypes[random.Next(streetTypes.Length)]}";

                // Adding the address if it's not already in the list
                Check(ref addresses, address);
            }

            return addresses;
        }
        public static string[] canadianCityNames = { "Toronto", "Montreal", "Vancouver", "Calgary", "Edmonton", "Ottawa", "Winnipeg", "Quebec City", "Hamilton", "Kitchener", "London", "Victoria", "Halifax", "Oshawa", "Windsor", "Saskatoon", "Regina", "St. Johns", "Barrie", "Kelowna", "Sherbrooke", "Guelph", "Abbotsford", "Kingston", "Kanata", "Trois-Rivieres", "Moncton", "Chicoutimi", "Saint John", "Peterborough", "Red Deer", "Saint-Jérôme", "Lethbridge", "White Rock", "Prince George", "Medicine Hat", "Norfolk County", "Drummondville", "Newmarket", "Saint-Hyacinthe", "Fredericton", "St. Albert", "Aurora", "North Bay", "Belleville", "Mirabel", "Brandon", "Cornwall", "Victoriaville" };
        // Method to generate random Canadian cities
        public static List<string> GenerateRandomCities(int count)
        {
            List<string> canadianCities = new List<string>();
            Random random = new Random();

            // List of possible Canadian city names

            while (canadianCities.Count < count)
            {
                string city = canadianCityNames[random.Next(canadianCityNames.Length)];

                // Adding the city if it's not already in the list
                Check(ref canadianCities, city);
            }

            return canadianCities;
        }
        public static List<string> GenerateRandomFacilities(int count)
        {
            List<string> facilities = new List<string>();
            Random random = new Random();

            // List of possible prefixes for pharmaceutical facility names
            string[] prefixes = { "Bio", "Pharma", "Medi", "Health", "Care", "Life", "Cure", "Vita", "Gen", "Thera" };

            // List of possible suffixes for pharmaceutical facility names
            string[] suffixes = { "Med", "Pharm", "Lab", "Tech", "Research", "Solutions", "PharmaTech", "BioTech", "PharmaCare", "Healthcare" };

            while (facilities.Count < count)
            {
                string facility = $"{prefixes[random.Next(prefixes.Length)]}{suffixes[random.Next(suffixes.Length)]}";

                // Adding the facility name if it's not already in the list
                Check(ref facilities, facility);
            }

            return facilities;
        }
        public static string[] occupationList = {
            "Software Developer",
            "Nurse",
            "Teacher",
            "Doctor",
            "Engineer",
            "Accountant",
            "Marketing Manager",
            "Sales Representative",
            "Graphic Designer",
            "Lawyer",
            "Electrician",
            "Chef",
            "Plumber",
            "Writer",
            "Dentist",
            "Police Officer",
            "Financial Analyst",
            "HR Manager",
            "Mechanic",
            "Artist",
            "Architect",
            "Pharmacist",
            "Veterinarian",
            "Social Worker",
            "Real Estate Agent",
            "Pilot",
            "Journalist",
            "Construction Worker",
            "Fitness Trainer",
            "Psychologist",
            "Web Designer",
            "Interior Designer",
            "Biologist",
            "Librarian",
            "Flight Attendant",
            "Electrician",
            "Actor",
            "Economist",
            "Photographer",
            "Chemist",
            "Waiter/Waitress",
            "Bartender",
            "Geologist",
            "Translator",
            "Paramedic",
            "Marine Biologist",
            "Fashion Designer",
            "Meteorologist",
            "Carpenter"
        };
        public static List<string> GenerateRandomOccupations(int count)
        {
            List<string> occupations = new List<string>();
            Random random = new Random();

            while (occupations.Count < count)
            {
                string occupation = occupationList[random.Next(occupationList.Length)];

                // Adding the occupation if it's not already in the list
                if (!occupations.Contains(occupation))
                    occupations.Add(occupation);
            }

            return occupations;
        }
        public static List<string> GenerateRandomCanadianPostalCodes(int count)
        {
            List<string> postalCodes = new List<string>();
            Random random = new Random();

            while (postalCodes.Count < count)
            {
                string postalCode = GenerateRandomPostalCode(random);
                Check(ref postalCodes, postalCode);
            }

            return postalCodes;
        }
        private static string GenerateRandomPostalCode(Random random)
        {
            // Randomly generate letters and digits for the postal code
            char[] letters = new char[3];
            letters[0] = (char)random.Next('A', 'Z' + 1);
            letters[1] = (char)random.Next('0', '9' + 1);
            letters[2] = (char)random.Next('A', 'Z' + 1);

            int digit1 = random.Next(0, 10);
            int digit2 = random.Next(0, 10);
            int digit3 = random.Next(0, 10);

            // Construct the postal code string
            return $"{letters[0]}{digit1}{letters[1]} {digit2}{letters[2]}{digit3}";
        }
        public static List<string> GenerateRandomCanadianPhoneNumbers(int count)
        {
            List<string> phoneNumbers = new List<string>();
            Random random = new Random();

            while (phoneNumbers.Count < count)
            {
                string phoneNumber = GenerateRandomPhoneNumber(random);
                phoneNumber = phoneNumber.Replace(")", "").Replace("(", "").Replace(" ", "").Replace("-", "");

                // Adding the phone number if it's not already in the list
                Check(ref phoneNumbers, phoneNumber);
            }

            return phoneNumbers;
        }
        private static string GenerateRandomPhoneNumber(Random random)
        {
            // Generate random area code (AAA)
            int areaCode = random.Next(200, 999);

            // Generate random local number (NNN-NNNN)
            int localNumber1 = random.Next(0, 1000);
            int localNumber2 = random.Next(0, 10000);

            // Format the phone number
            return $"({areaCode:D3}) {localNumber1:D3}-{localNumber2:D4}";
        }
        public static List<string> GenerateRandomNames(int count)
        {
            List<string> names = new List<string>();
            Random random = new Random();

            // List of possible first names
            string[] firstNames = { "Emma", "Liam", "Olivia", "Noah", "Ava", "William", "Sophia", "James", "Isabella", "Oliver", "Charlotte", "Benjamin", "Amelia", "Elijah", "Mia", "Lucas", "Harper", "Mason", "Evelyn", "Logan", "Abigail", "Alexander", "Emily", "Ethan", "Elizabeth", "Jacob", "Mila", "Michael", "Ella", "Daniel", "Avery", "Henry", "Scarlett", "Jackson", "Grace", "Sebastian", "Chloe", "Aiden", "Victoria", "Matthew", "Riley", "Samuel", "Aria", "David", "Lily", "Joseph", "Sofia", "Carter", "Madison" };

            // List of possible last names
            string[] lastNames = { "Smith", "Johnson", "Williams", "Jones", "Brown", "Davis", "Miller", "Wilson", "Moore", "Taylor", "Anderson", "Thomas", "Jackson", "White", "Harris", "Martin", "Thompson", "Garcia", "Martinez", "Robinson", "Clark", "Rodriguez", "Lewis", "Lee", "Walker", "Hall", "Allen", "Young", "Hernandez", "King", "Wright", "Lopez", "Hill", "Scott", "Green", "Adams", "Baker", "Gonzalez", "Nelson", "Carter", "Mitchell", "Perez", "Roberts", "Turner", "Phillips", "Campbell", "Parker", "Evans", "Edwards" };

            while (names.Count < count)
            {
                string firstName = firstNames[random.Next(firstNames.Length)];
                string lastName = lastNames[random.Next(lastNames.Length)];

                string fullName = $"{firstName} {lastName}";

                // Adding the name if it's not already in the list
                Check(ref names, fullName);
            }

            return names;
        }

        private static void Check(ref List<string> audience, string target)
        {
            if (!audience.Contains(target))
                audience.Add(target);
        }
        public static int RandomYear(int start) => RandomNumber(start, 2024);
        public static int RandomMonth() => RandomNumber(1, 12);
        public static int RandomDay() => RandomNumber(1, 28);
        public static int RandomHour() => RandomNumber(1, 24);
        public static int RandomMinute() => RandomNumber(1, 60);
        public static int RandomSecond() => RandomNumber(1, 60);
    }
}