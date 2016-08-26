DROP TABLE qualifications_type;

CREATE TABLE qualifications_type
(eird_number CHAR(11),
qname VARCHAR(30),
qtype VARCHAR(20),
CONSTRAINT qualifications_type_pk PRIMARY KEY (eird_number, qname, qtype),
CONSTRAINT qualifications_foreign_key FOREIGN KEY (eird_number, qname) REFERENCES QUALIFICATIONS(eird_number, qname));

INSERT INTO qualifications_type VALUES
(	(select eird_number from QUALIFICATIONS where rownum = 1),
	(select qname from QUALIFICATIONS where rownum = 1),
	'Health and Safety');
INSERT INTO qualifications_type VALUES
(	(select eird_number from QUALIFICATIONS where rownum = 1),
        (select qname from QUALIFICATIONS where rownum = 1), 
	'bachelors degree');
/**
ask teach why the rownum = 2 return null? 
*/


/**
INSERT INTO qualifications_type VALUES
('024-613-323','First Aid', 'Health and Safety');
INSERT INTO qualifications_type VALUES
('023-842-366', 'BSci', 'bachelors degree');
*/
