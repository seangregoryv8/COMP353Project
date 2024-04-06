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
            WorksAt[] works = new WorksAt[amount];

            for (int i = 0; i < works.Length; i++)
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
            return works;
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
