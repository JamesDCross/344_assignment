DROP TABLE customer             cascade constraints;

CREATE TABLE customer
(street_number VARCHAR2(5),
Street_name VARCHAR2(30),
postcode NUMBER(4) NOT NULL REFERENCES postcode(postcode),
customer_id CHAR (7)            PRIMARY KEY,
fname VARCHAR(15) NOT NULL,
lname VARCHAR(15) NOT NULL,
phone CHAR (10)
);

INSERT INTO customer VALUES
('22', 'Strawberry Lane', 9016, '0007365','Chubby','Checker', '0212546798');
INSERT INTO customer VALUES
('16', 'Princes Street', 9012, '0046290','Slim','Dusty', '0279843873');

INSERT INTO customer VALUES
('11', 'Boiling Down Road',9012,'0002233','Jimmy','Johns','');
INSERT INTO customer VALUES
('17','Duchess Ave',9016,'0000010','Callum','Grimmer','0223280679');
INSERT INTO customer VALUES
('14','Findlayson Road',9012,'0022056','Tim','Shadbolt','0272524455');
INSERT INTO customer VALUES
('25','River Street',9016,'0024789','Joseph','Parker','');
INSERT INTO customer VALUES
('560','George Street',9016,'0001010','David','Clark','');
INSERT INTO customer VALUES
('34', 'Midland Street',9012,'0033210','Dave','Brubeck','');
INSERT INTO customer VALUES
('131a','Queen Street',9016,'0035670','Trent','Brown','0223220987');
INSERT INTO customer VALUES
('11','Pitt Street',9016,'0668220','Sammy','Dee','0274429824');
INSERT INTO customer VALUES
('2','Wigan Street',9012,'0096210','Michael','Peterson','0211197862');
INSERT INTO customer VALUES
('62','Robertson Street',9016,'0000223','Foxy','Brown','0274542211');

