DROP TABLE employee_wage        cascade constraints;
CREATE TABLE employee_wage
(weekly_hours   NUMBER(2),
hourly_rate    NUMBER(5),
wage NUMBER (8) default 1000, 
CONSTRAINT employee_wage_pk PRIMARY KEY(weekly_hours, hourly_rate));

INSERT INTO employee_wage VALUES('38', '1525','57950');
INSERT INTO employee_wage VALUES('32', '1800','57600');
