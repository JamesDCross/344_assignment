/**
* A list of triggers affecting the employee database, primarily in relation to
* adding and removing employees.
*/

--New employee
/**
* When a new employee is hired they need to be initialised into the system and 
* their derived attributes must be calculated and inserted. The trigger is
* activated by inserting a new tuple into the employee relation.
*/
CREATE OR REPLACE TRIGGER create_employee
AFTER INSERT ON employee
FOR EACH ROW
BEGIN
UPDATE bookstore
SET TOTAL_SALARY = TOTAL_SALARY + :NEW.WEEKLY_HOURS * :NEW.HOURLY_RATE
WHERE storeID = :NEW.bookstoreID;
END;
/

--Modify employee hours
/**
* When an employees hours or pay rate is changed, this trigger updates the
* values of the derived attributes related to those values. This trigger is
* activated when an employee's weekly hours or hourly rate are modified.
*/
CREATE OR UPDATE TRIGGER modify_employee
AFTER UPDATE OF weekly_hours, hourly_rate ON employee
FOR EACH ROW
BEGIN
UPDATE bookstore
SET total_salary = total_salary + :NEW.WEEKLY_HOURS * :NEW.HOURLY_RATE - :OLD.weekly_hours * :OLD.hourly_rate
WHERE storeID = :NEW.bookstoreID;
END;
/

--Modify employee bookstoreID
/**
* When an employee shifts from working in one store to another, the derived
* attributes related to this employee's previous and current workplace (store)
* must be updated. This trigger is activated when the bookstoreID of an
* employee is changed (i.e. they work for a different store).
*/
CREATE OR REPLACE TRIGGER modify_employee2
AFTER UPDATE OF bookstoreID ON employee
FOR EACH ROW
BEGIN
UPDATE bookstore
SET total_salary = total_salary + :NEW.WEEKLY_HOURS * :NEW.HOURLY_RATE
WHERE storeID = :NEW.bookstoreID;
UPDATE bookstore
SET total_salary = total_salary - :OLD.weekly_hours * :OLD.hourly_rate
WHERE storeID = :OLD.bookstoreID;
END;
/

--Delete employee
/**
* This trigger adjusts the derived attributes of a store that has just had one
* of it's employees removed. The trigger is activated by the removal of an
* employee.
*/
CREATE OR REPLACE TRIGGER delete_employee
AFTER DELETE ON employee
FOR EACH ROW
BEGIN
UPDATE bookstore
SET total_salary = total_salary - :OLD.weekly_hours * :OLD.hourly_rate
WHERE storeID = :OLD.bookstoreID;
END;
/

--Delete employee check with exception
/**
* This trigger checks whether a store has more than one employee and is safe to
* delete employees from. If there is only one employee working at a store and
* a deletion is attempted, an exception is raised. The trigger is activated by
* a deletion on employee, and the exception is raised if there are no other
* employees working at the same bookstore.
*/
CREATE OR REPLACE TRIGGER delete_employee_check
BEFORE DELETE ON employee;
FOR EACH ROW
DECLARE
zero_employees EXCEPTION;
BEGIN
IF 1 = (SELECT COUNT(*)
FROM employee, bookstore
WHERE baddress = address); THEN
RAISE zero_employees;
EXCEPTION
WHEN zero_employees THEN
RAISE_APPLICATION_ERROR( -20001,'Cannot have zero employees at a store');
END;
/

--Employee wage update
/**
* This trigger updates the wage of an employee, whether they already in the
* database or they have been added as a new employee. The trigger is activated
* when an employee wage is updated.
*/
CREATE OR REPLACE TRIGGER check_wage_1
BEFORE INSERT OR UPDATE ON employee_wage
FOR EACH ROW
BEGIN
:NEW.wage := :NEW.weekly_hours * :NEW.hourly_rate;
END;
/
