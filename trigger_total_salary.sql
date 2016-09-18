/**
  * Triggers upon changes that would effect a store's total salary
  */

--New employee
CREATE OR REPLACE TRIGGER create_employee
        AFTER INSERT ON employee
        FOR EACH ROW
BEGIN
        UPDATE bookstore
        SET total_salary = total_salary + :NEW.weekly_hours * :NEW.hourly_rate
        WHERE address = :NEW.baddress;
END;
/

--Employee changes store with new hourly_rate and/or weekly_hours
CREATE OR REPLACE TRIGGER modify_employee
        AFTER UPDATE ON weekly_hours,hourly_rate,baddress on employee
        FOR EACH ROW
BEGIN
        UPDATE bookstore
        SET total_salary = total_salary + :NEW.weekly_hours * :NEW.hourly_rate
        WHERE address = :new.baddress;
        UPDATE bookstore
        SET total_salary = total_salary - :OLD.weekly_hours * :OLD.hourly_rate
        WHERE address = :old.baddress;
END;
/
--Employee postion termination
CREATE OR REPLACE TRIGGER delete_employee
        AFTER DELETE ON employee
        FOR EACH ROW
BEGIN
                UPDATE bookstore
                SET total_salary = total_salary - :OLD.weekly_hours * :OLD.hourly_rate
                WHERE address = :old.baddress;
END;
/

--Check exception trigger
CREATE OR REPLACE TRIGGER delete_employee_check
        BEFORE DELETE ON employee
        FOR EACH ROW
DECLARE
        zero_employees EXCEPTION;
BEGIN
        IF 0 = (SELECT COUNT(*) 
        FROM employee, bookstore
        WHERE baddress = b.address); THEN
                RAISE zero_employees;
EXCEPTION
        WHEN zero_employees THEN
        RAISE_APPLICATION_ERROR( -20001,'Cannot have zero employees at a store');
END;
/
