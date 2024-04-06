using System;

namespace COMP353ProjectTableGeneration
{
    public class Residence
    {
        public enum TypesOfResidences
        {
            Apartment,
            Condominium,
            Semidetached,
            House
        }
        public string Address { get; set; }
        public string City { get; set; }
        public string Province { get; set; }
        public string Postal_code { get; set; }
        public string Phone { get; set; }
        public int Bedrooms { get; set; }
        public TypesOfResidences Type { get; set; }

        public static Residence[] MakeResidences(int amount)
        {
            Residence[] residences = new Residence[amount];
            var addresses = Functions.GenerateRandomAddresses(amount);
            var cities = Functions.GenerateRandomCities(amount);
            var postals = Functions.GenerateRandomCanadianPostalCodes(amount);
            var phones = Functions.GenerateRandomCanadianPhoneNumbers(amount);

            for (int i = 0; i < residences.Length; i++)
            {
                var rnd = new Random();
                Array values = Enum.GetValues(typeof(TypesOfResidences));
                TypesOfResidences randomBar = (TypesOfResidences)values.GetValue(rnd.Next(values.Length));

                residences[i] = new Residence(addresses[i], cities[i], Functions.GetProvince(), postals[i], phones[i], Functions.RandomNumber(1, 8), randomBar);
            }
            return residences;
        }
        public Residence(string address, string city, string province, string postal, string phone, int bedrooms, TypesOfResidences type)
        {
            Address = Functions.RandomDigits(4) + " " + address;
            City = city;
            Province = province;
            Postal_code = postal;
            Phone = phone;
            Bedrooms = bedrooms;
            Type = type;
        }
        public override string ToString()
        {
            string type = string.Empty;
            switch(Type)
            {
                case TypesOfResidences.Apartment: type = "Apartment"; break;
                case TypesOfResidences.Condominium: type = "Condominium"; break;
                case TypesOfResidences.Semidetached: type = "Semi-Detached House"; break;
                case TypesOfResidences.House: type = "House"; break;
            }
            return "('" + Address + "', '" + City + "', '" + Province + "', '" + Postal_code + "', '" + Phone + "', " + Bedrooms + ", '" + type + "')";
        }
    }
}
