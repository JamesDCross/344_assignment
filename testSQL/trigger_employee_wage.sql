create or replace trigger modify_wage
after insert or update of WEEKLY_HOURS, HOURLY_RATE, WAGE on employee_wage
for each row
begin
	update employee_wage
	set wage = :new.weekly_hours * :new.HOURLY_RATE;
end;
/
