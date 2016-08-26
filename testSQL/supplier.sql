DROP TABLE supplier cascade constraints;
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
