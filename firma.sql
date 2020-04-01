CREATE DATABASE base1;
CREATE SCHEMA Firma;

CREATE TABLE firma.pracownicy(
	id_pracownika INT PRIMARY KEY NOT NULL,
	nazwisko VARCHAR(50),
	imie VARCHAR(50),
	adres VARCHAR(100),
	telefon VARCHAR(12)
);

CREATE TABLE firma.godziny(
	id_godziny INT PRIMARY KEY NOT NULL,
	data DATE,
	liczba_godzin INT,
	id_pracownika INT
);

CREATE TABLE firma.pensje(
	id_pensji INT PRIMARY KEY NOT NULL,
	stanowisko VARCHAR(50),
	kwota MONEY,
	id_premii INT
);

CREATE TABLE firma.premie(
	id_premii INT PRIMARY KEY NOT NULL,
	rodzaj VARCHAR(100),
	kwota MONEY
);

ALTER TABLE firma.godziny
ADD FOREIGN KEY (id_pracownika) REFERENCES firma.pracownicy(id_pracownika);
ALTER TABLE firma.pensje
ADD FOREIGN KEY (id_premii) REFERENCES firma.premie(id_premii);

INSERT INTO firma.pracownicy
VALUES(1,'Jan','Kowalski','Warszawa ul.Nowa 12a/2','676776888');
INSERT INTO firma.pracownicy
VALUES(2,'Anna','Nowak','Kraków ul.Nawojki 222/3a','665111222');
INSERT INTO firma.pracownicy
VALUES(3,'Mateusz','Kalik','Kraków ul.Miła 44a','990999000');
INSERT INTO firma.pracownicy
VALUES(4,'Danuta','Merc','Poznań ul.Stawia 0991','221221111');
INSERT INTO firma.pracownicy
VALUES(5,'Damian','Matasik','Warszawa ul.Nowogrodzka 16','992900991');
INSERT INTO firma.pracownicy
VALUES(6,'Amelia','Chora','Gdańsk ul.Brzegowa 1a','222333222');
INSERT INTO firma.pracownicy
VALUES(7,'Janusz','Tracz','Warszawa ul.Plebaniowa 66','666721999');
INSERT INTO firma.pracownicy
VALUES(8,'Marek','Wąski','Bielsko-Biała ul. Czarnowiejska 13','+48683751721');
INSERT INTO firma.pracownicy
VALUES(9,'Dawid','Mreński','Bielsko-Biała ul. Skośna 43','+48280947791');
INSERT INTO firma.pracownicy
VALUES(10,'Antoni','Momoni','Dawidy Bankowe 44','111221333');

INSERT INTO firma.godziny
VALUES(1,'2020-03-01',9,4);
INSERT INTO firma.godziny
VALUES(2,'2020-03-02',8,3);
INSERT INTO firma.godziny
VALUES(3,'2020-03-01',6,2);
INSERT INTO firma.godziny
VALUES(4,'2020-03-03',6,4);
INSERT INTO firma.godziny
VALUES(5,'2020-03-01',7,2);
INSERT INTO firma.godziny
VALUES(6,'2020-03-01',7,1);
INSERT INTO firma.godziny
VALUES(7,'2020-03-02',12,3);
INSERT INTO firma.godziny
VALUES(8,'2020-03-03',8,1);
INSERT INTO firma.godziny
VALUES(9,'2020-03-02',8,10);
INSERT INTO firma.godziny
VALUES(10,'2020-03-01',10,7);

INSERT INTO firma.premie
VALUES(1,'Brak',0.00);
INSERT INTO firma.premie
VALUES(2,'Kierownicza',400.00);
INSERT INTO firma.premie
VALUES(3,'Dodatek',50.00);
INSERT INTO firma.premie
VALUES(4,'Premia Dzinna',25.00);
INSERT INTO firma.premie
VALUES(5,'Nadgodziny',100.00);
INSERT INTO firma.premie
VALUES(6,'Nadgodziny weekend',150.00);
INSERT INTO firma.premie
VALUES(7,'Urodzinowa',100.00);
INSERT INTO firma.premie
VALUES(8,'Świąteczna',200.00);
INSERT INTO firma.premie
VALUES(9,'Zapomoga',1000.00);
INSERT INTO firma.premie
VALUES(10,'Awans',2000.00);

INSERT INTO firma.pensje
VALUES(1,'Prezes',7100.00,2);
INSERT INTO firma.pensje
VALUES(2,'Wiceprezes',6224.00,2);
INSERT INTO firma.pensje
VALUES(3,'Brygadzista',4000.00,1);
INSERT INTO firma.pensje
VALUES(4,'Kierownik zmiany',5100.00,3);
INSERT INTO firma.pensje
VALUES(5,'Sekretarka',3100.00,1);
INSERT INTO firma.pensje
VALUES(6,'Sprzątaczka',2900.00,1);
INSERT INTO firma.pensje
VALUES(7,'Pracownik fizyczny',2900.00,1);
INSERT INTO firma.pensje
VALUES(8,'Pomoc',2750.00,4);
INSERT INTO firma.pensje
VALUES(9,'Operator',3400.00,1);
INSERT INTO firma.pensje
VALUES(10,'Stażysta',2500.00,1);

--SELECT*FROM firma.godziny;
