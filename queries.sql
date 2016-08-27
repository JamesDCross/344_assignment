/**
q01
*/
SELECT title FROM book
WHERE title LIKE 'S%';
/**
q02
*/
select * from bookstore 
where date_opened = TO_DATE('22-05-1999', 'dd-mm-yyyy');
/**
q03
*/
select max(hourly_rate), weekly_hours 
from employee_wage 
group by weekly_hours 
having max(hourly_rate) < 1800;
/**
q04
show employee and their hourly_rate which is smaller than average hourly_rate
*/
select fname, lname, hourly_rate 
from employee 
where hourly_rate < (
	select avg(hourly_rate) 
	from employee_wage);
/**
q05
show first name, last name of customer who purchase item at '22-05-2013'
*/
select fname, lname from customer c 
where to_date('22-05-2013', 'dd-mm-yyyy') 
IN (select t.tdate 
	from transactions t 
	where c.CUSTOMER_ID = t.CCUSTOMER_ID);
/**
q06
show sale number  of books according to book_tran info
*/
select count(BISBN), BISBN from book_tran group by BISBN;

/**
q07
*/
DELETE FROM customer
WHERE STREET_NUMBER = 22
AND lname LIKE 'C%';
/**
q08
select fname, lname of employee who handled transactions involve customer lives in "9012 South Dunedin"
*/
select e.fname, e.lname
from employee e, transactions t, customer c 
where c.postcode=9012 and c.CUSTOMER_ID = t.CCUSTOMER_ID and t.EIRD_NUMBER = e.IRD_NUMBER;
