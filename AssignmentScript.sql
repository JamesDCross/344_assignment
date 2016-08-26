DROP TABLE supplier             cascade constraints;
DROP TABLE bookstore            cascade constraints;
DROP TABLE book                 cascade constraints;
DROP TABLE employee             cascade constraints;
DROP TABLE transactions         cascade constraints;
DROP TABLE employee_wage        cascade constraints;
DROP TABLE post_code            cascade constraints;
DROP TABLE customer             cascade constraints;
DROP TABLE qualifications_type  cascade constraints;
DROP TABLE qualifications;
DROP TABLE supplies;
DROP TABLE book_tran;


CREATE TABLE supplier
(bank_account_number    CHAR(18)    PRIMARY KEY,
company_name VARCHAR2(30) NOT NULL,
contact_number CHAR(10)
);

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
date_opened   DATE
);


INSERT INTO bookstore VALUES ('Milton', '33 Union Street', '0234-9871-8373', TO_DATE('22-05-1999','DD-MM-YYYY'));
INSERT INTO bookstore VALUES ('Bluff', '99 Oyster Road', '0453-1543-8532', TO_DATE('08-01-1998','DD-MM-YYYY'));
INSERT INTO bookstore VALUES ('Invercargill', '33 Dee Street', '0324-9553-8443', TO_DATE('14-06-1997','DD-MM-YYYY'));
INSERT INTO bookstore VALUES ('Waihola', '21 Lake Road', '0334-9321-7673', TO_DATE('14-12-2003','DD-MM-YYYY'));
INSERT INTO bookstore VALUES ('Gore', '11 Bogan Street', '0854-6354-9142', TO_DATE('24-12-2001','DD-MM-YYYY'));
INSERT INTO bookstore VALUES ('Temuka', '69 Kina Ave',  '0534-9143-6453', TO_DATE('31-10-2009','DD-MM-YYYY'));
INSERT INTO bookstore VALUES ('Beijing', '101500 MiYun',  '0123-4567-6453', TO_DATE('03-01-1986','DD-MM-YYYY'));



CREATE TABLE book
(title    VARCHAR2(30) NOT NULL,
isbn   CHAR(17)              PRIMARY KEY,
fname    VARCHAR2(15) NOT NULL,
middle_init    CHAR,
lname    VARCHAR2(15) NOT NULL,
price    NUMBER(5), /*Currency*/
amount_in_stock   NUMBER(2)
);

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
weekly_hours   NUMBER(2) NOT NULL,
hourly_rate    NUMBER(5) NOT NULL, /*Currency*/
baddress VARCHAR2(30) REFERENCES bookstore(address)
);


INSERT INTO employee VALUES
('John','B','Good', '024-613-323',       '0212344505', '38', '1525', '11 Bogan Street');
INSERT INTO employee VALUES
('Debbie','D','Dallas', '023-543-765',   '0215739542', '32', '1800', '21 Lake Road');
INSERT INTO employee VALUES
('Tom','N','Mates', '013-643-923',       '0273938492', '30', '2050', '33 Union Street');
INSERT INTO employee VALUES
('Rebbecca','B','Smith', '075-142-345',  '0214847395', '38', '1505', '33 Dee Street');
INSERT INTO employee VALUES
('Greg','T','Somerville', '087-681-765', '0270394722', '38', '2150', '99 Oyster Road');
INSERT INTO employee VALUES
('Todd','A','BlackAdder', '091-813-913', '0215738375', '15', '1925', '21 Lake Road');
INSERT INTO employee VALUES
('Wayne','','Kerr', '023-842-366',       '0273231043', '38', '1900', '11 Bogan Street');
INSERT INTO employee VALUES
('Leroy','J','Brown', '073-834-552',     '0215551234', '20', '2000', '21 Lake Road');
INSERT INTO employee VALUES('Ying','G','Brown', '055-923-819',      '0214984833', '38', '1550', '33 Dee Street');
INSERT INTO employee VALUES('Wei', NULL,'Zhao', '012-923-819',      '0217777777', '77', '7777', '33 Dee Street');



CREATE TABLE employee_wage
(week_hours   NUMBER(2),
hour_rate    NUMBER(5),
wage NUMBER (6) default 1000,
PRIMARY KEY (week_hours, hour_rate)
);

INSERT INTO employee_wage VALUES
('38', '1525','57950');
INSERT INTO employee_wage VALUES
('32', '1800','57600');
INSERT INTO employee_wage VALUES
('30', '2050','61500');
INSERT INTO employee_wage VALUES
('38', '1520','57750');
INSERT INTO employee_wage VALUES
('38', '2150','81700');
INSERT INTO employee_wage VALUES
('15', '1925','28875');
INSERT INTO employee_wage VALUES
('38', '1900','72200');
INSERT INTO employee_wage VALUES
('20', '2000','40000');
INSERT INTO employee_wage VALUES
('38', '1550','58900');



CREATE TABLE post_code
(pcode NUMBER (4) PRIMARY KEY,
suburb VARCHAR (15),
city VARCHAR (15) NOT NULL
);

INSERT INTO post_code VALUES
('9016', 'Dunedin City', 'Dunedin');
INSERT INTO post_code VALUES
('9012', 'South Dunedin', 'Dunedin');
INSERT INTO post_code VALUES
('9874','Otahuti','Invercargill');
INSERT INTO post_code VALUES
('7986','','Gore');
INSERT INTO post_code VALUES
('9710','Helensbrook','Milton');


CREATE TABLE customer
(street_number VARCHAR2(5),
Street_name VARCHAR2(30),
postcode NUMBER(4) NOT NULL REFERENCES post_code(pcode),
customer_id CHAR (7)            PRIMARY KEY,
fname VARCHAR(15) NOT NULL,
lname VARCHAR(15) NOT NULL,
phone CHAR (10)
);

INSERT INTO customer VALUES
('22', 'Strawberry Lane', '9016','0007365','Chubby','Checker', '0212546798');
INSERT INTO customer VALUES
('16', 'Princes Street', '9012','0046290','Slim','Dusty', '0279843873');
INSERT INTO customer VALUES
('11', 'Boiling Down Road','7986','0002233','Jimmy','Johns','');
INSERT INTO customer VALUES
('17','Duchess Ave','9016','0000010','Callum','Grimmer','0223280679');
INSERT INTO customer VALUES
('14','Findlayson Road','9874','0022056','Tim','Shadbolt','0272524455');
INSERT INTO customer VALUES
('25','River Street','9710','0024789','Joseph','Parker','');
INSERT INTO customer VALUES
('560','George Street','9016','0001010','David','Clark','');
INSERT INTO customer VALUES
('34', 'Midland Street','9012','0033210','Dave','Brubeck','');
INSERT INTO customer VALUES
('131a','Queen Street','9016','0035670','Trent','Brown','0223220987');
INSERT INTO customer VALUES
('11','Pitt Street','9016','0668220','Sammy','Dee','0274429824');
INSERT INTO customer VALUES
('2','Wigan Street','9710','0096210','Michael','Peterson','0211197862');
INSERT INTO customer VALUES
('62','Robertson Street','9710','0000223','Foxy','Brown','0274542211');


CREATE TABLE qualifications
(qird_number CHAR (11) NOT NULL REFERENCES employee (ird_number),
qname VARCHAR(30) NOT NULL,
date_received DATE,
expiry_date DATE,
PRIMARY KEY (qird_number, qname)
);

INSERT INTO qualifications VALUES
('024-613-323', 'First Aid', TO_DATE('22-05-2013','DD-MM-YYYY'), TO_DATE('22-05-2015','DD-MM-YYYY'));
INSERT INTO qualifications VALUES
('023-842-366', 'BSci', TO_DATE('25-10-1999','DD-MM-YYYY'),'');
INSERT INTO qualifications VALUES
('055-923-819','BA',TO_DATE('12-05-2012','DD-MM-YYYY'),'');
INSERT INTO qualifications VALUES
('087-681-765','BCom',TO_DATE('17/05/13','DD/MM/RR'),'');
INSERT INTO qualifications VALUES
('023-543-765','BCom',TO_DATE('12/jan/2011','DD/MON/YYYY'),'');
INSERT INTO qualifications VALUES
('023-543-765','BA',TO_DATE('12/jan/2011','DD/MON/YYYY'),'');



CREATE TABLE qualifications_type
(eird_number CHAR (11) NOT NULL REFERENCES employee (ird_number),
qname VARCHAR(30) NOT NULL,
qtype VARCHAR(20) NOT NULL,
FOREIGN KEY (eird_number, qname) REFERENCES qualifications (qird_number, qname)
);


INSERT INTO qualifications_type VALUES
('024-613-323', 'First Aid', 'Health and Safety');
INSERT INTO qualifications_type VALUES
('023-842-366', 'BSci', 'Computer Science');
INSERT INTO qualifications_type VALUES
('055-923-819', 'BA','English Literature');
INSERT INTO qualifications_type VALUES
('087-681-765', 'BCom','Marketing');
INSERT INTO qualifications_type VALUES
('023-543-765', 'BCom','Finance');
INSERT INTO qualifications_type VALUES
('023-543-765', 'BA', 'English Literature');



CREATE TABLE supplies
(sbank_account_number CHAR(18) REFERENCES supplier (bank_account_number),
bisbn CHAR(17) REFERENCES book(isbn),
PRIMARY KEY (sbank_account_number, bisbn));

INSERT INTO supplies VALUES
('39-6443-9454523-48','326-1-234923-21-2');
INSERT INTO supplies VALUES
('39-6443-9454523-48','321-1-234333-21-8');



CREATE TABLE transactions
("date" DATE NOT NULL,
"time" DATE NOT NULL,
transaction_number CHAR (17)    PRIMARY KEY,
eird_number CHAR(11)  REFERENCES employee (ird_number),
ccustomer_id CHAR (7) REFERENCES customer (customer_id)
);

INSERT INTO transactions VALUES
(TO_DATE('22-05-2013','DD-MM-YYYY'), TO_DATE('13:34:23','hh24:mi:ss'), '000-0000-1434-455','073-834-552','0007365');
INSERT INTO transactions VALUES
(TO_DATE('24-06-2013','DD-MM-YYYY'), TO_DATE('09:49:11','hh24:mi:ss'), '000-0000-1234-125','024-613-323','0035670');
INSERT INTO transactions VALUES
(TO_DATE('02-08-2013','DD-MM-YYYY'), TO_DATE('11:40:57','hh24:mi:ss'), '000-0000-1234-126','075-142-345','0022056');
INSERT INTO transactions VALUES
(TO_DATE('13-09-2013','DD-MM-YYYY'), TO_DATE('15:23:31','hh24:mi:ss'), '000-0000-1234-127','013-643-923','0035670');
INSERT INTO transactions VALUES
(TO_DATE('17-11-2013','DD-MM-YYYY'), TO_DATE('12:43:04','hh24:mi:ss'), '000-0000-1234-128','075-142-345','0000010');
INSERT INTO transactions VALUES
(TO_DATE('30-11-2013','DD-MM-YYYY'), TO_DATE('16:31:23','hh24:mi:ss'), '000-0000-1234-200','024-613-323','0668220');
INSERT INTO transactions VALUES
(TO_DATE('22-01-2014','DD-MM-YYYY'), TO_DATE('12:59:29','hh24:mi:ss'), '000-0000-1234-203','075-142-345','0007365');
INSERT INTO transactions VALUES
(TO_DATE('22-03-2014','DD-MM-YYYY'), TO_DATE('14:03:40','hh24:mi:ss'), '000-0000-1234-204','023-543-765','0668220');


CREATE TABLE book_tran
(bisbn CHAR (17)  NOT NULL  REFERENCES book(isbn),
ttransaction_number CHAR (17) NOT NULL  REFERENCES transactions(transaction_number),
units NUMBER(2),
PRIMARY KEY (bisbn, ttransaction_number)
);

INSERT INTO book_tran VALUES
('326-1-234923-21-2', '000-0000-1434-455', '1');
INSERT INTO book_tran VALUES
('336-1-285647-32-6', '000-0000-1434-455', '2');
INSERT INTO book_tran VALUES
('323-3-323434-76-7', '000-0000-1434-455', '1');
INSERT INTO book_tran VALUES
('321-1-234333-21-8', '000-0000-1234-125', '1');
INSERT INTO book_tran VALUES
('343-1-234352-21-2', '000-0000-1234-126', '1');
INSERT INTO book_tran VALUES
('323-3-323434-76-7', '000-0000-1234-127', '1');
INSERT INTO book_tran VALUES
('284-1-573847-98-4', '000-0000-1234-128', '1');
INSERT INTO book_tran VALUES
('343-1-234352-21-2', '000-0000-1234-200', '2');
INSERT INTO book_tran VALUES
('336-1-285647-32-6', '000-0000-1234-203', '1');
INSERT INTO book_tran VALUES
('634-2-125445-65-2', '000-0000-1234-204', '1');


COMMIT;
