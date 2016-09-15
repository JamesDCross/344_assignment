create or replace trigger check_wage_1
before insert or update on employee_wage
for each row
declare
begin
        :NEW.WAGE := :NEW.WEEKLY_HOURS * :NEW.HOURLY_RATE;
end;
/
