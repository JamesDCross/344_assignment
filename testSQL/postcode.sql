DROP TABLE postcode            cascade constraints;

CREATE TABLE postcode
(postcode NUMBER (4)            PRIMARY KEY,
suburb VARCHAR (15),
city VARCHAR (15));

INSERT INTO postcode VALUES
(9016, 'Dunedin City', 'Dunedin');
INSERT INTO postcode VALUES
(9012, 'South Dunedin', 'Dunedin');
