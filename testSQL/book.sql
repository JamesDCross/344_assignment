DROP TABLE book                 cascade constraints;
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
