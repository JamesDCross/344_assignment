DROP TABLE book_tran;
CREATE TABLE book_tran
(bisbn CHAR (17)   REFERENCES book(isbn),
ttransaction_number CHAR (17)  REFERENCES transactions(transaction_number),
CONSTRAINT book_tran_pk PRIMARY KEY(bisbn, ttransaction_number));


INSERT INTO book_tran VALUES(
	(select isbn from (select * from book order by dbms_random.random) where rownum < 2),
	(select TRANSACTION_NUMBER from (select * from transactions order by dbms_random.random) where rownum < 2)
);

INSERT INTO book_tran VALUES(
	(select isbn from (select * from book order by dbms_random.random) where rownum < 2),
	(select TRANSACTION_NUMBER from (select * from transactions order by dbms_random.random) where rownum < 2)
);

INSERT INTO book_tran VALUES(
	(select isbn from (select * from book order by dbms_random.random) where rownum < 2),
	(select TRANSACTION_NUMBER from (select * from transactions order by dbms_random.random) where rownum < 2)
);
/**
INSERT INTO book_tran VALUES
('326-1-234923-21-2', '000-0000-1434-455');
INSERT INTO book_tran VALUES
('321-1-234333-21-8', '000-0000-1234-125');
*/
