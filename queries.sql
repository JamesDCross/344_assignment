
/*note these queries may need improvement*/
q1
SELECT title FROM book
WHERE title LIKE 'S%';

q2
SELECT * FROM bookstore
WHERE date_opened  = TO_DATE('08-01-1998','DD-MM-YYYY'));

q3
SELECT hour_rate, MIN(week_hours)
FROM employee_wage
GROUP BY week_hours
HAVING MIN(week_hours) <= 30;


q4
SELECT *
FROM employee
WHERE hourly_rate <
(SELECT hourly_rate
FROM employee
WHERE fname = 'Debbie' AND lname = 'Dallas');

/*select all in bookstore where city = milton and addresses of employees and bookstore
are the same*/
q5
SELECT *
FROM bookstore b
WHERE city = 'Milton' IN
(SELECT baddress
FROM employee  e
WHERE b.address=e.baddress);

q6
SELECT COUNT(*) FROM post_code;

q7
DELETE FROM customer
WHERE street_number > 22
AND lname LIKE 'B%';

q8
/*needs to be expanded on*/
SELECT lname
FROM customer, employee, book;


