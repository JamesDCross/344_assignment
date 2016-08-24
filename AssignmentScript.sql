DROP TABLE supplier;
DROP TABLE bookstore cascade constraints;
DROP TABLE book;
DROP TABLE employee cascade constraints;
DROP TABLE transactions;
DROP TABLE employee_wage;
DROP TABLE customer;
DROP TABLE postcode;
DROP TABLE qualifications;
DROP TABLE qualifications_type;
DROP TABLE supplies;
DROP TABLE book_tran;



CREATE TABLE supplier
(bank_account_number    CHAR(18)    PRIMARY KEY,
company_name VARCHAR2(30) NOT NULL,
contact_number CHAR(10));

INSERT INTO supplier VALUES
('39-6443-9454523-48','National Scholastic','034191123');
INSERT INTO supplier VALUES
('33-3456-9482743-32','Mills and Boon','035763832');
INSERT INTO supplier VALUES
('26-6843-4856284-68','Paperback Writers','04457484');



CREATE TABLE bookstore
(city        VARCHAR2(20)  NOT NULL,
 address     VARCHAR2(30)   PRIMARY KEY,
account     CHAR(14)       NOT NULL,
date_opened   DATE);

INSERT INTO bookstore VALUES
('Milton', '33 Union Street', '0234-9871-8373', TO_DATE('22-05-1999','DD-MM-YYYY'));
INSERT INTO bookstore VALUES
('Bluff', '99 Oyster Road', '0453-1543-8532', TO_DATE('08-01-1998','DD-MM-YYYY'));
INSERT INTO bookstore VALUES
('Invercargill', '33 Dee Street', '0324-9553-8443', TO_DATE('14-06-1997','DD-MM-YYYY'));
INSERT INTO bookstore VALUES
('Waihola', '21 Lake Road', '0334-9321-7673', TO_DATE('14-12-2003','DD-MM-YYYY'));
INSERT INTO bookstore VALUES
('Gore', '11 Bogan Street', '0854-6354-9142', TO_DATE('24-12-2001','DD-MM-YYYY'));
INSERT INTO bookstore VALUES
('Temuka', '69 Kina Ave',  '0534-9143-6453', TO_DATE('31-10-2009','DD-MM-YYYY'));



CREATE TABLE book
(title    VARCHAR2(30) NOT NULL,
isbn   CHAR(17)                         PRIMARY KEY,
fname    VARCHAR2(15) NOT NULL,
middle_init    CHAR,
lname    VARCHAR2(15) NOT NULL,
price    NUMBER(5), /*Currency*/
amount_in_stock   NUMBER(2));

INSERT INTO book VALUES
('Rusty Bed Springs', '326-1-234923-21-2', 'I','P','Knightley','2950', '2');
INSERT INTO book VALUES
('Snakes of the World', '321-1-234333-21-8', 'Anna','','Conda','2250', '5');
INSERT INTO book VALUES
('Tyrrants of the Potatoes', '336-1-285647-32-6', 'Dic','','Tater','1900', '12');
INSERT INTO book VALUES
('Trees', '284-1-573847-98-4', 'I','M','Board','2950', '5');
INSERT INTO book VALUES
('Robotics Handbook', '634-2-125445-65-2', 'Anne','D','Roid','7600', '3');
INSERT INTO book VALUES
('Windy Nights', '343-1-234352-21-2', 'Gale','','Force','4590', '5');
INSERT INTO book VALUES
('Lion Tamming', '323-3-323434-76-7', 'Claud','B','Ottem','2950', '20');



CREATE TABLE employee
(fname    VARCHAR2(15) NOT NULL,
middle_init    CHAR,
lname    VARCHAR2(15) NOT NULL,
ird_number      CHAR(11)      PRIMARY KEY,
contact_number  CHAR(10),
weekly_hours   NUMBER(2),
hourly_rate    NUMBER(5) NOT NULL, /*Currency*/
baddress VARCHAR2(30) CONSTRAINT baddress_constraint REFERENCES bookstore(address) DISABLE);

ALTER TABLE employee ENABLE CONSTRAINT baddress_constraint;

INSERT INTO employee VALUES
('John','B','Good', '024-613-323',       '0212344505', '38', '1525', '11 Bogan Street');
INSERT INTO employee VALUES
('Debbie','D','Dallas', '023-543-765',   '0215739542', '32', '1800', '21 Lake Road');
INSERT INTO employee VALUES
('Tom','N','Mates', '013-643-923',       '0273938492', '30', '2050', '33 Union Street');INSERT INTO employee VALUES
('Rebbecca','B','Smith', '075-142-345',  '0214847395', '38', '1525', '33 Dee Street');
INSERT INTO employee VALUES
('Greg','T','Somerville', '087-681-765', '0270394722', '38', '2150', '99 Oyster Road');
INSERT INTO employee VALUES
('Todd','A','BlackAdder', '091-813-913', '0215738375', '15', '1925', '21 Lake Road');
INSERT INTO employee VALUES
('Wayne','','Kerr', '023-842-366',       '0273231043', '38', '1900', '11 Bogan Street');
INSERT INTO employee VALUES
('Leroy','J','Brown', '073-834-552',     '0215551234', '20', '2000', '21 Lake Road');
INSERT INTO employee VALUES
('Ying','G','Brown', '055-923-819',      '0214984833', '38', '1550', '33 Dee Street');


CREATE TABLE employee_wage
(weekly_hours   NUMBER(2),
hourly_rate    NUMBER(5),
wage NUMBER (4));



CREATE TABLE transactions
("date" DATE,
"time" DATE,
transaction_number CHAR (17)    PRIMARY KEY);

INSERT INTO transactions VALUES
(TO_DATE('22-05-2013','DD-MM-YYYY'), TO_DATE('13:34:23','hh24:mi:ss'), '000-0000-1434-455');
INSERT INTO transactions VALUES
(TO_DATE('22-05-2013','DD-MM-YYYY'), TO_DATE('09:49:17','hh24:mi:ss'), '000-0000-1234-125');




CREATE TABLE customer
(street_number NUMBER(3),
Street_name VARCHAR2(30),
postcode NUMBER(4),
customer_id CHAR (7)            PRIMARY KEY,
fname VARCHAR(15),
lname VARCHAR(15),
phone CHAR (10));

INSERT INTO customer VALUES
('22', 'Strawberry Lane', '9016','0007365','Chubby','Checker', '0212546798');
INSERT INTO customer VALUES
('16', 'Princes Street', '9012','0046290','Slim','Dusty', '0279843873');
INSERT INTO customer VALUES
('11', 'Boiling Down Road','7986','0002233','Jimmy','Johns','');
INSERT INTO customer VALUES
('17','Duchess Ave','9016','000010','Callum','Grimmer','0223280679');
INSERT INTO customer VALUES
('14','Findlayson Road','9874','0022056','Tim','Shadbolt','0272524455');
INSERT INTO customer VALUES
('25','River Street','9710','0024789','Joseph','Parker','');
INSERT INTO customer VALUES
('560','George Street','9016','0001010','David','Clark');
INSERT INTO customer VALUES
('34', 'Midland Street','9012','0033210','Dave','Brubeck');
INSERT INTO customer VALUES
('131a','Queen Street','9016','0035670','Trent','Brown');
INSERT INTO customer VALUES
('11','Pitt Street','9016','0668220','Sammy','Dee');
INSERT INTO customer VALUES
('2','Wigan Street','9710','0096210','Michael','Peterson');
INSERT INTO customer VALUES
('62','Robertson Street','9710','0000223','Foxy','Brown');


CREATE TABLE postcode
(postcode NUMBER (4)            PRIMARY KEY,
suburb VARCHAR (15),
city VARCHAR (15));

INSERT INTO postcode VALUES
('9016', 'Dunedin City', 'Dunedin');
INSERT INTO postcode VALUES
('9012', 'South Dunedin', 'Dunedin');
INSERT INTO postcode VALUES
('9874','Otahuti','Invercargill');
INSERT INTO postcode VALUES
('9710','','Gore');
INSERT INTO postcode VALUES
('7896','','Temuka');




CREATE TABLE qualifications
(eird_number CHAR (11),
qname VARCHAR(30),
date_received DATE,
expiry_date DATE);

INSERT INTO qualifications VALUES
('024-613-323', 'First Aid', TO_DATE('22-05-2013','DD-MM-YYYY'), TO_DATE('22-05-2015','DD-MM-YYYY'));
INSERT INTO qualifications VALUES
('023-842-366', 'BSci', TO_DATE('25-10-1999','DD-MM-YYYY'), TO_DATE(''));
INSERT INTO qualifications VALUES
('055-923-81','BA English Literature',TO_DATE('12-05-2012','DD-MM-YYYY'),'');
INSERT INTO qualifications VALUES
('087-681-76','BCom Marketing',TO_DATE('17/05/13','DD/MM/RR','');
INSERT INTO qualifications VALUES
('023-543-765','BCom Marketing',TO_DATE('12/jan/2011','DD/MON/YYYY');



CREATE TABLE qualifications_type
(eird_number CHAR(11),
qname VARCHAR(30),
qtype VARCHAR(20));

INSERT INTO qualifications_type VALUES
('024-613-323','First Aid', 'Health and Safety');
INSERT INTO qualifications_type VALUES
('023-842-366', 'BSci', 'bachelors degree');
INSERT INTO qualifications_type VALUES
('055-923-81','BA English Literature','bachelors degree');
INSERT INTO qualifications_type VALUES
('087-681-76','BCom Marketing','bachelors degree');
INSERT INTO qualifications_type VALUES
('023-543-765','BCom Marketing','bachelors degree');



CREATE TABLE supplies
(sbank_account_number CHAR(18),
bisbn CHAR(17));

INSERT INTO supplies VALUES
('39-6443-9454523-48','326-1-234923-21-2');
INSERT INTO supplies VALUES
('39-6443-9454523-48','321-1-234333-21-8');



CREATE TABLE book_tran
(bisbn CHAR (17),
ttransaction_number CHAR (17));

INSERT INTO book_tran VALUES
('326-1-234923-21-2', '000-0000-1434-455');
INSERT INTO book_tran VALUES
('321-1-234333-21-8', '000-0000-1234-125');

COMMIT;
