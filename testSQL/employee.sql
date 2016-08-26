DROP TABLE employee             cascade constraints;
CREATE TABLE employee
(fname    VARCHAR2(15) NOT NULL,
middle_init    CHAR,
lname    VARCHAR2(15) NOT NULL,
ird_number      CHAR(11)      PRIMARY KEY,
contact_number  CHAR(10),
weekly_hours   NUMBER(2),
hourly_rate    NUMBER(5) NOT NULL, /*Currency*/
baddress VARCHAR2(30) CONSTRAINT baddress_constraint REFERENCES bookstore(address),
CONSTRAINT wage_constraint FOREIGN KEY(weekly_hours, hourly_rate) REFERENCES employee_wage(weekly_hours, hourly_rate));

INSERT INTO employee VALUES
('John','B','Good', '024-613-323',       '0212344505', 38, 1525, (select address from (select * from bookstore order by DBMS_RANDOM.RANDOM) WHERE rownum < 2));
INSERT INTO employee VALUES
('Debbie','D','Dallas', '023-543-765',   '0215739542', 32, 1800, (select address from (select * from bookstore order by DBMS_RANDOM.RANDOM) WHERE rownum < 2));

/**
INSERT INTO employee VALUES
('Tom','N','Mates', '013-643-923',       '0273938492', '32', 1800, (select address from (select * from bookstore order by DBMS_RANDOM.RANDOM) WHERE rownum < 2));
INSERT INTO employee VALUES
('Rebbecca','B','Smith', '075-142-345',  '0214847395', '38', '1525', (select address from (select * from bookstore order by DBMS_RANDOM.RANDOM) WHERE rownum < 2));
INSERT INTO employee VALUES
('Greg','T','Somerville', '087-681-765', '0270394722', '38', '2150', (select address from (select * from bookstore order by DBMS_RANDOM.RANDOM) WHERE rownum < 2));
INSERT INTO employee VALUES
('Todd','A','BlackAdder', '091-813-913', '0215738375', '15', '1925', (select address from (select * from bookstore order by DBMS_RANDOM.RANDOM) WHERE rownum < 2));
INSERT INTO employee VALUES
('Wayne','','Kerr', '023-842-366',       '0273231043', '38', '1900', (select address from (select * from bookstore order by DBMS_RANDOM.RANDOM) WHERE rownum < 2));
INSERT INTO employee VALUES
('Leroy','J','Brown', '073-834-552',     '0215551234', '20', '2000', (select address from (select * from bookstore order by DBMS_RANDOM.RANDOM) WHERE rownum < 2));
INSERT INTO employee VALUES
('Ying','G','Brown', '055-923-819',      '0214984833', '38', '1550', (select address from (select * from bookstore order by DBMS_RANDOM.RANDOM) WHERE rownum < 2));
*/



/**
Randomly select 1 addresses from bookstore 
select address from (select * from bookstore order by DBMS_RANDOM.RANDOM) WHERE rownum < 2;
*/

/**
select weekly_hours, hourly_rate from (select * from employee_wage order by DBMS_RANDOM.RANDOM) WHERE rownum < 2;
*/
