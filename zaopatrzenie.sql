CREATE SCHEMA zaopatrzenie;

CREATE TABLE zaopatrzenie.Produkty(
	NazwaProduktu VARCHAR(40) NOT NULL PRIMARY KEY,
	CenaNetto MONEY,
	CenaBrutto MONEY
);

CREATE TABLE zaopatrzenie.Miejscowosci(
	KodPocztowy VARCHAR(6) NOT NULL PRIMARY KEY,
	Miasto VARCHAR(35)
);

CREATE TABLE zaopatrzenie.Dostawcy(
	Dostawca VARCHAR(40) NOT NULL PRIMARY KEY,
	AdresDostawcyUlica VARCHAR(40),
	NrBudynku/Mieszkania(10),
	KodPocztowy VARCHAR(6),
	FOREIGN KEY (KodPocztowy) REFERENCES zaopatrzenie.Miejscowosci(KodPocztowy)
);
	
CREATE TABLE zaopatrzenie.Dostawy(
	Dostawca VARCHAR(40) NOT NULL PRIMARY KEY,
	NazwaProduktu VARCHAR(40),
	NazwaProduktu2 VARCHAR(40),
	FOREIGN KEY (Dostawca) REFERENCES zaopatrzenie.Dostawcy(Dostawca),
	FOREIGN KEY (NazwaProduktu) REFERENCES zaopatrzenie.Produkty(NazwaProduktu)
);

INSERT INTO zaopatrzenie.Produkty VALUES
('Makaron Nitki','130','150'),
('Keczup pikantny','200','220'),
('Sos pomidorowy','89','110');

INSERT INTO zaopatrzenie.Miejscowosci VALUES
('31-435','Kraków'),
('31-342','Kraków'),
('04-242','Lublin'),
('30-243','Tarnów'),
('35-434','Nowy Targ');

INSERT INTO zaopatrzenie.Dostawcy VALUES
('Makarony Polskie','Turystyczna','40','31-435'),
('Polskie przetwory','Wojska Polskiego','44a','31-342'),
('Lubelski Makaron','Pi³sudskiego','332a','04-242'),
('Przetwory pomidorowe','Rolnicza','22/4','30-243'),
('Ma³opolskie smaki','Mickiewicza','223/77','35-434');

INSERT INTO zaopatrzenie.Dostawy VALUES
('Makarony Polskie','Makaron Nitki',''),
('Polskie przetwory','Keczup pikantny','Sos pomidorowy'),
('Lubelski Makaron','Makaron Nitki',''),
('Przetwory pomidorowe','Keczup pikantny',''),
('Ma³opolskie smaki','Sos pomidorowy','');
