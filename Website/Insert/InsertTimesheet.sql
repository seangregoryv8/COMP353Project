insert into works_at(Employee, Facility, Start_date, End_date) values(?,?,?,?);
/*
Update timesheets
Set TEndDate = '$StartDate'
Where (timesheets.TFName = '$FName' or timesheets.TLName = '$LName' or timesheets.Facility <> '$Facility') and timesheets.TEndDate is Null;
*/