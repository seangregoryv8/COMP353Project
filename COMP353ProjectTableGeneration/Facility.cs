using System;
using System.Linq;

namespace COMP353ProjectTableGeneration
{
    public class Facility
    {
        public enum TypesOfFacilities
        {
            Hospital,
            CLSC,
            Clinic,
            Pharmacy,
            Special
        }
        public string Name { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string Province { get; set; }
        public string Postal_Code { get; set; }
        public string Phone { get; set; }
        public string Web_Address { get; set; }
        public TypesOfFacilities Type { get; set; }
        public int Capacity { get; set; }
        public Employee Managed_By { get; set; }
        public static Facility[] MakeFacilities(int amount, Employee[] employees)
        {
            Facility[] facilities = new Facility[amount];
            var names = Functions.GenerateRandomFacilities(amount);
            var addresses = Functions.GenerateRandomAddresses(amount);
            var cities = Functions.GenerateRandomCities(amount);
            var postals = Functions.GenerateRandomCanadianPostalCodes(amount);
            var phones = Functions.GenerateRandomCanadianPhoneNumbers(amount);

            var rnd = new Random();
            var randomNumbers = Enumerable.Range(1, employees.Length - 1).OrderBy(x => rnd.Next()).Take(amount).ToList();

            for (int i = 0; i < facilities.Length; i++)
            {
                //int randomNumber = randomNumbers[(employees.Length > i) ? Functions.RandomNumber(0, employees.Length) : i];
                Employee employee = employees[Functions.RandomNumber(0, employees.Length)];

                Array values = Enum.GetValues(typeof(TypesOfFacilities));
                TypesOfFacilities randomBar = (TypesOfFacilities)values.GetValue(rnd.Next(values.Length));

                facilities[i] = new Facility(names[i], addresses[i], cities[i], Functions.GetProvince(), postals[i], phones[i], randomBar, Functions.RandomNumber(10, 1000), employee);
            }
            return facilities;
        }
        public Facility(string n, string a, string c, string p, string pc, string ph, TypesOfFacilities t, int cap, Employee man)
        {
            Name = n;
            Address = Functions.RandomDigits(4) + " " + a;
            City = c;
            Province = p;
            Postal_Code = pc;
            Phone = ph;
            Web_Address = "www." + n.ToLower().Replace(" ", "") + Functions.RandomDigits(3) + ".org";
            Type = t;
            Capacity = cap;
            Managed_By = man;
        }

        public override string ToString()
        {
            string type = Type.ToString();
            if (type == "Special") type += " Instalment";
            return "('" + Name + "', '" + Address + "', '" + City + "', '" + Province + "', '" + Postal_Code + "', '" + Phone + "', '" + Web_Address + "', '" + type + "', " + Capacity + ", '" + Managed_By.SIN.SIN + "')";
        }
    }
}
