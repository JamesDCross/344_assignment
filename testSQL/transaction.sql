DROP TABLE transactions         cascade constraints;

CREATE TABLE transactions
("date" DATE NOT NULL,
"time" DATE NOT NULL,
transaction_number CHAR (17)    PRIMARY KEY,
eird_number CHAR(11)  REFERENCES employee (ird_number),
ccustomer_id CHAR (7) REFERENCES customer (customer_id)
);

INSERT INTO transactions VALUES
(TO_DATE('22-05-2013','DD-MM-YYYY'), TO_DATE('13:34:23','hh24:mi:ss'),'000-0000-1234-124',
	(select IRD_NUMBER from (select * from employee order by DBMS_RANDOM.RANDOM) WHERE ROWNUM < 2),
	(select customer_id from (select * from customer order by DBMS_RANDOM.RANDOM) WHERE ROWNUM < 2));

INSERT INTO transactions VALUES
(TO_DATE('24-06-2013','DD-MM-YYYY'), TO_DATE('09:49:11','hh24:mi:ss'), '000-0000-1234-125',
	(select IRD_NUMBER from (select * from employee order by DBMS_RANDOM.RANDOM) WHERE ROWNUM < 2),
        (select customer_id from (select * from customer order by DBMS_RANDOM.RANDOM) WHERE ROWNUM < 2));
INSERT INTO transactions VALUES
(TO_DATE('02-08-2013','DD-MM-YYYY'), TO_DATE('11:40:57','hh24:mi:ss'), '000-0000-1234-126',
      	(select IRD_NUMBER from (select * from employee order by DBMS_RANDOM.RANDOM) WHERE ROWNUM < 2),
        (select customer_id from (select * from customer order by DBMS_RANDOM.RANDOM) WHERE ROWNUM < 2));
INSERT INTO transactions VALUES
(TO_DATE('13-09-2013','DD-MM-YYYY'), TO_DATE('15:23:31','hh24:mi:ss'), '000-0000-1234-127',      
	(select IRD_NUMBER from (select * from employee order by DBMS_RANDOM.RANDOM) WHERE ROWNUM < 2),
        (select customer_id from (select * from customer order by DBMS_RANDOM.RANDOM) WHERE ROWNUM < 2));
INSERT INTO transactions VALUES
(TO_DATE('17-11-2013','DD-MM-YYYY'), TO_DATE('12:43:04','hh24:mi:ss'), '000-0000-1234-128',
	(select IRD_NUMBER from (select * from employee order by DBMS_RANDOM.RANDOM) WHERE ROWNUM < 2),
        (select customer_id from (select * from customer order by DBMS_RANDOM.RANDOM) WHERE ROWNUM < 2));
INSERT INTO transactions VALUES
(TO_DATE('30-11-2013','DD-MM-YYYY'), TO_DATE('16:31:23','hh24:mi:ss'), '000-0000-1234-200',
       (select IRD_NUMBER from (select * from employee order by DBMS_RANDOM.RANDOM) WHERE ROWNUM < 2),
       (select customer_id from (select * from customer order by DBMS_RANDOM.RANDOM) WHERE ROWNUM < 2));
INSERT INTO transactions VALUES
(TO_DATE('22-01-2014','DD-MM-YYYY'), TO_DATE('12:59:29','hh24:mi:ss'), '000-0000-1234-203',
       (select IRD_NUMBER from (select * from employee order by DBMS_RANDOM.RANDOM) WHERE ROWNUM < 2),
       (select customer_id from (select * from customer order by DBMS_RANDOM.RANDOM) WHERE ROWNUM < 2));
INSERT INTO transactions VALUES
(TO_DATE('22-03-2014','DD-MM-YYYY'), TO_DATE('14:03:40','hh24:mi:ss'), '000-0000-1234-204',
       (select IRD_NUMBER from (select * from employee order by DBMS_RANDOM.RANDOM) WHERE ROWNUM < 2),
       (select customer_id from (select * from customer order by DBMS_RANDOM.RANDOM) WHERE ROWNUM < 2));
