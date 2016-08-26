DROP TABLE qualifications;

CREATE TABLE qualifications (
eird_number CHAR (11) REFERENCES EMPLOYEE(ird_number),
qname VARCHAR(30),
date_received DATE,
expiry_date DATE,
CONSTRAINT qualifications_pk PRIMARY KEY(eird_number, qname));


INSERT INTO qualifications VALUES
((select IRD_NUMBER from (select * from employee order by DBMS_RANDOM.RANDOM) WHERE ROWNUM < 2), 
	'First Aid', TO_DATE('22-05-2013','DD-MM-YYYY'), TO_DATE('22-05-2015','DD-MM-YYYY'));
INSERT INTO qualifications VALUES
((select IRD_NUMBER from (select * from employee order by DBMS_RANDOM.RANDOM) WHERE ROWNUM < 2), 
	'BSci', TO_DATE('25-10-1999','DD-MM-YYYY'), TO_DATE(''));
