DROP TABLE supplies;

CREATE TABLE supplies
(sbank_account_number CHAR(18) REFERENCES supplier (bank_account_number),
bisbn CHAR(17) REFERENCES book(isbn),
CONSTRAINT supplies_pk PRIMARY KEY(sbank_account_number, bisbn));



INSERT INTO supplies VALUES
('39-6443-9454523-48','326-1-234923-21-2');
INSERT INTO supplies VALUES
('39-6443-9454523-48','321-1-234333-21-8');
