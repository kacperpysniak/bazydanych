CREATE SCHEMA stomatologia;

CREATE TABLE stomatologia.Pracownicy(
	IDPracownika VARCHAR(6) NOT NULL PRIMARY KEY,
	ImieLekarza VARCHAR(30) NOT NULL,
	NazwiskoLekarza VARCHAR(50) NOT NULL
);

CREATE TABLE stomatologia.Zabiegi(
	IDZabiegu VARCHAR(4) NOT NULL PRIMARY KEY,
	NazwaZabiegu VARCHAR(40)
);

CREATE TABLE stomatologia.Pacjenci(
	IDPacjenta VARCHAR(6) NOT NULL PRIMARY KEY,
	ImiePacjenta VARCHAR(30) NOT NULL,
	NazwiskoPacjenta VARCHAR(50) NOT NULL
);

CREATE TABLE stomatologia.Wizyty(
	DataWizyty DATE NOT NULL,
	GodzinaWizyty TIME NOT NULL,
	IDPracownika VARCHAR(6),
	IDPacjenta VARCHAR(6),
	IDZabiegu VARCHAR(4),
	PRIMARY KEY (DataWizyty, GodzinaWizyty),
	FOREIGN KEY (IDPracownika) REFERENCES stomatologia.Pracownicy(IDPracownika),
	FOREIGN KEY (IDPacjenta) REFERENCES stomatologia.Pacjenci(IDPacjenta),
	FOREIGN KEY (IDZabiegu) REFERENCES stomatologia.Zabiegi(IDZabiegu),	
);

INSERT INTO stomatologia.Pracownicy VALUES
('S1011','Maria','Nowak'),
('S1024','Jan','Kowalski'),
('S1034','Marek','Potocki'),
('S1045','Anna','Jab³oñska');


INSERT INTO stomatologia.Zabiegi VALUES
('Z496','Lakowanie'),
('Z500','Borowanie'),
('Z503','Usuwanie kamienia');


INSERT INTO stomatologia.Pacjenci VALUES
('P100','Anna','Jeleñ„'),
('P105','Jaros³aw','Nicpoñ„'),
('P108','Joanna','Nosek'),
('P120','Jan','Ka³u¿a'),
('P123','Olga','Nowacka'),
('P130','Jerzy','Lis');


INSERT INTO stomatologia.Wizyty VALUES
('2020-03-12','10:00','S1011','P100','Z500),
('2020-03-12','13:00','S1011','P105','Z496'),
('2020-03-12','15:00','S1034','P123','Z503'),
('2020-03-14','10:00','S1011','P108','Z500'),
('2020-03-16','17:00','S1024','P108','Z503'),
('2020-03-18','09:00','S1024','P120','Z500'),
('2020-03-20','08:00','S1034','P130','Z496');
