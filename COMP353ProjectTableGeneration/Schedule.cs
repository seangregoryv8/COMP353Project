using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace COMP353ProjectTableGeneration
{
    public class Schedule
    {
        public DateTime SDate { get; set; }
        public DateTime Start_Time { get; set; }
        public DateTime End_Time { get; set; }
        public Facility Scheduled_At { get; set; }
        public Employee Scheduled_For { get; set; }
        public static Schedule[] MakeSchedules(int amount, Facility[] facilities, Employee[] employees)
        {
            Schedule[] schedules = new Schedule[amount];
            for (int i = 0; i < schedules.Length; i++)
            {
                DateTime date = new DateTime(Functions.RandomYear(2017), Functions.RandomMonth(), Functions.RandomDay());
                DateTime end = new DateTime(Functions.RandomYear(2018), Functions.RandomMonth(), Functions.RandomDay(), Functions.RandomHour(), Functions.RandomMinute(), Functions.RandomSecond());
                DateTime start = new DateTime(Functions.RandomYear(2018), Functions.RandomMonth(), Functions.RandomDay(), Functions.RandomHour(), Functions.RandomMinute(), Functions.RandomSecond());
                do
                {
                    end = new DateTime(Functions.RandomYear(2018), Functions.RandomMonth(), Functions.RandomDay(), Functions.RandomHour(), Functions.RandomMinute(), Functions.RandomSecond());
                } while (end < start);

                Employee employee = employees[Functions.RandomNumber(0, employees.Length - 1)];
                Facility facility = facilities[Functions.RandomNumber(0, facilities.Length - 1)];

                schedules[i] = new Schedule(date, start, end, facility, employee);
            }

            List<Schedule> Schedule1 = schedules.OfType<Schedule>().ToList();

            for (int i = Schedule1.Count() - 1; i >= 0; i--)
            {
                for (int j = 0; j < Schedule1.Count; j++)
                {
                    if (i != j && Schedule1[i].SDate == Schedule1[j].SDate && Schedule1[i].Start_Time == Schedule1[j].Start_Time && Schedule1[i].Scheduled_At == Schedule1[j].Scheduled_At && Schedule1[i].Scheduled_For == Schedule1[j].Scheduled_For)
                        Schedule1.RemoveAt(j);
                }
            }
            return Schedule1.ToArray();
        }
        public Schedule(DateTime sdate, DateTime start, DateTime end, Facility at, Employee emp)
        {
            SDate = sdate;
            Start_Time = start;
            End_Time = end;
            Scheduled_At = at;
            Scheduled_For = emp;
        }
        public string FormatDate(DateTime date) => date.Year + "-" + date.Month + "-" + date.Day;
        public string FormatTimestamp(DateTime time) => time.Year + "-" + time.Month + "-" + time.Day + " " + time.Hour + ":" + time.Minute + ":" + time.Second;
        public override string ToString()
        {
            return "('" + FormatDate(SDate) + "', '" + FormatTimestamp(Start_Time) + "', '" + FormatTimestamp(End_Time) + "', '" + Scheduled_At.Name + "', '" + Scheduled_For.SIN.SIN + "')";
        }
    }
}
