using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace COMP353ProjectTableGeneration
{
    public class WorksAt
    {
        public Employee Employee { get; set; }
        public Facility Facility { get; set; }
        public string StartDate { get; set; }
        public string EndDate { get; set; }

        public static WorksAt[] MakeWorksAt(int amount, Employee[] employees, Facility[] facilities)
        {
            WorksAt[] works = new WorksAt[amount + facilities.Length];

            for (int i = 0; i < amount; i++)
            {
                Employee employee = employees[Functions.RandomNumber(0, employees.Length - 1)];
                Facility facility = facilities[Functions.RandomNumber(0, facilities.Length - 1)];
                int startYear = Functions.RandomNumber(2015, 2024);
                int startMonth = Functions.RandomNumber(1, 12);
                int startDay = Functions.RandomNumber(1, 28);
                DateTime start = new DateTime(startYear, startMonth, startDay);
                DateTime end;
                if (Functions.RandomNumber(1, 100) > 50)
                    works[i] = new WorksAt(employee, facility, Format(startYear, startMonth, startDay), "NULL");
                else
                {
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
                    works[i] = new WorksAt(employee, facility, Format(startYear, startMonth, startDay), Format(endYear, endMonth, endDay));
                }
            }

            for (int i = 0; i < facilities.Length; i++)
            {
                Employee employee = Array.Find(employees, residence => residence.Equals(facilities[i].Managed_By));
                works[amount + i - 1] = new WorksAt(employee, facilities[i], Format(Functions.RandomYear(2015), Functions.RandomMonth(), Functions.RandomDay()), "NULL");
            }

            List<WorksAt> WorksAt1 = works.OfType<WorksAt>().ToList();

            for (int i = WorksAt1.Count() - 1; i >= 0; i--)
            {
                for (int j = 0; j < WorksAt1.Count; j++)
                {
                    if (i != j && WorksAt1[i].Employee == WorksAt1[j].Employee && WorksAt1[i].Facility == WorksAt1[j].Facility && WorksAt1[i].StartDate == WorksAt1[j].StartDate)
                        WorksAt1.RemoveAt(j);
                }
            }
            return WorksAt1.ToArray();
        }
        private static string Format(int year, int month, int day) => year + "-" + month + "-" + day;
        public WorksAt(Employee employee, Facility facility, string start, string end)
        {
            Employee = employee;
            Facility = facility;
            StartDate = start;
            EndDate = end;
        }

        public override string ToString()
        {
            return "('" + Employee.SIN.SIN + "', '" + Facility.Name + "', '" + StartDate + "', " + (EndDate == "NULL" ? EndDate : ("'" + EndDate + "'")) + ")";
        }
    }
}
