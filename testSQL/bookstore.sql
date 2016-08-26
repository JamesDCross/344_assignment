drop table bookstore cascade constraints;
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
