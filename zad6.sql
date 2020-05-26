--CREATE DATABASE firma;
CREATE SCHEMA ksiegowosc;
CREATE TABLE ksiegowosc.pracownicy(
	id_pracownika VARCHAR(5) PRIMARY KEY NOT NULL,
	imie VARCHAR(25) NOT NULL,
	nazwisko VARCHAR(25) NOT NULL,
	adres VARCHAR(60) NOT NULL,
	telefon VARCHAR(13) 
);
COMMENT ON TABLE ksiegowosc.pracownicy is 'Dane Pracownikow';

CREATE TABLE ksiegowosc.godziny(
	id_godziny VARCHAR(5) PRIMARY KEY NOT NULL,
	data DATE,
	liczba_godzin SMALLINT,
	id_pracownika VARCHAR(5) REFERENCES ksiegowosc.pracownicy(id_pracownika)
);
http://127.0.0.1:3075/datagrid/panel/9238586?is_query_tool=true&sgid=1&sid=1&server_type=pg&did=16900#COMMENT ON TABLE ksiegowosc.godziny is 'godziny pracownikow';

CREATE TABLE ksiegowosc.pensja(
	id_pensji VARCHAR(5) PRIMARY KEY NOT NULL,
	stanowisko VARCHAR(35),
	kwota MONEY NOT NULL
);
COMMENT ON TABLE ksiegowosc.pensja is 'rodziaj pensji';

CREATE TABLE ksiegowosc.premia(
	id_premii VARCHAR(5) PRIMARY KEY NOT NULL,
	rodzaj VARCHAR(35),
	kwota MONEY NOT NULL
);
COMMENT ON TABLE ksiegowosc.premia is 'rodziaj premii';

CREATE TABLE ksiegowosc.wynagrodzenie(
	id_wynagrodzenia VARCHAR(5) PRIMARY KEY NOT NULL,
	data DATE,
	id_pracownika VARCHAR(5) REFERENCES ksiegowosc.pracownicy(id_pracownika),
	id_godziny VARCHAR(5) REFERENCES ksiegowosc.godziny(id_godziny),
	id_pensji VARCHAR(5) REFERENCES ksiegowosc.pensja(id_pensji),
	id_premii VARCHAR(5) REFERENCES ksiegowosc.premia(id_premii)
);
COMMENT ON TABLE ksiegowosc.wynagrodzenie is 'rodziaj wynagrodzenia';

INSERT INTO ksiegowosc.pracownicy VALUES
('1qaz','Jan','Adamiak','KrakĂłw ul.WesoĹ‚a 21a','651676128'),
('2wsx','Anna','Nowak','Warszawa ul.Nowa 212/1','921111233'),
('3edc','Jakub','Olczowy','KrakĂłw ul.zarnowiejska 23/11','877656727'),
('4rfv','Joanna','Lachowicz','BiaĹ‚ystok ul.Szkolna 12','789090872'),
('5tgb','Aadm','Wzorowy','KrakĂłw ul. WrocĹ‚awska 69/12','911231986'),
('6yhn','Jadwiga','Koperta','JanĂłw 12a','123222654'),
('7ujm','JĂłzef','Laskowksi','Warszawa ul.Nowoursynowska 211/1a','131432560'),
('8ijn','Jan','Antes','KrakĂłw ul.Nawojki 221/1','655233123'),
('9plm','Kacper','Borowy','KrakĂłw ul.Mazowiecka 80/3','987345012'),
('10is','Damian','Drewniany','KrakĂłw ul.Galla 71/1','233987612');
--SELECT * FROM ksiegowosc.pracownicy;

INSERT INTO ksiegowosc.godziny VALUES
('h1','2020-05-01',100,'1qaz'),
('h2','2020-05-02',150,'2wsx'),
('h3','2020-05-03',167,'3edc'),
('h4','2020-05-04',100,'4rfv'),
('h5','2020-05-05',87,'5tgb'),
('h6','2020-05-06',92,'6yhn'),
('h7','2020-05-07',124,'7ujm'),
('h8','2020-05-08',111,'8ijn'),
('h9','2020-05-09',102,'9plm'),
('h10','2020-05-10',169,'10is');
--SELECT * FROM ksiegowosc.godziny;

INSERT INTO ksiegowosc.pensja VALUES
('ps1','Prezes',9330),
('ps2','Wiceprezes',6223),
('ps3','Kierownik Zmiany',5000),
('ps4','Kierownik',4500),
('ps5','Brygadzista',3800),
('ps6','Sekretarka',3100),
('ps7','SprzÄ…tacz',2100),
('ps8','Pracownik Fizyczny',2100),
('ps9','Pomoc',2000),
('ps10','StaĹĽysta',1000);
--SELECT * FROM ksiegowosc.pensja VALUES;

INSERT INTO ksiegowosc.premia VALUES
('p1','Kierownicza',1000),
('p2','Urodzinowa',500),
('p3','Miesieczna',600),
('p4','Za prace w weekend',200),
('p5','Za Nadgodziny',600),
('p6','Na Dzieci',300),
('p7','Brak',0),
('p8','Dniowa',50),
('p9','Zapomoga',250),
('p10','Dodatek',150);
--SELECT * FROM ksiegowosc.premia VALUES;

INSERT INTO ksiegowosc.wynagrodzenie VALUES
('W01','2020-05-10','1qaz','h1','ps1','p1'),
('W02','2020-05-10','2wsx','h2','ps2','p1'),
('W03','2020-05-10','3edc','h3','ps3','p1'),
('W04','2020-05-10','4rfv','h4','ps4','p1'),
('W05','2020-05-10','5tgb','h5','ps5','p3'),
('W06','2020-05-10','6yhn','h6','ps6','p6'),
('W07','2020-05-10','7ujm','h7','ps7','p7'),
('W08','2020-05-10','8ijn','h8','ps8','p9'),
('W09','2020-05-10','9plm','h9','ps9','p5'),
('W10','2020-05-10','10is','h10','ps10','p4');
--SELECT * FROM ksiegowosc.wynagrodzenie VALUES;

--a)
ALTER TABLE ksiegowosc.pracownicy ALTER COLUMN telefon TYPE VARCHAR(20);
UPDATE ksiegowosc.pracownicy SET telefon = CONCAT('(+48)',telefon)
--SELECT telefon FROM ksiegowosc.pracownicy; 
--b)
UPDATE ksiegowosc.pracownicy SET telefon = (SUBSTRING(telefon, 1, 8)  || '-' ||SUBSTRING(telefon, 9, 3) ||'-' || SUBSTRING(telefon, 12, 3) );
--c)
SELECT UPPER(nazwisko) AS nazwisko, LENGTH(nazwisko) AS liczba FROM ksiegowosc.pracownicy
ORDER BY liczba DESC LIMIT 1;
--d)
ALTER TABLE ksiegowosc.pensja ALTER COLUMN kwota TYPE VARCHAR(20);
SELECT MD5(pra.id_pracownika) AS id_pracownika, MD5(imie) AS imie, MD5(nazwisko) AS nazwisko, MD5(adres) AS adres, MD5(telefon) AS telefon, MD5(kwota) AS pensja FROM ksiegowosc.pracownicy pra, ksiegowosc.pensja pen, ksiegowosc.wynagrodzenie id_p
WHERE id_p.id_pensji = pen.id_pensji AND id_p.id_pracownika = pra.id_pracownika;
--f)
SELECT imie, nazwisko, pen.kwota AS pensja, pre.kwota AS premia  
  FROM  ksiegowosc.pracownicy pra,ksiegowosc.premia pre , ksiegowosc.pensja pen  LEFT JOIN  ksiegowosc.wynagrodzenie id_p
                ON id_p.id_pensji = pen.id_pensji;
--g)
SELECT CONCAT('Pracownik '|| imie ||' ' ||nazwisko||', w dniu '|| data ||' otrzymał pensję całkowitą na kwotę '|| '' ) AS raport FROM ksiegowosc.pracownicy,ksiegowosc.wynagrodzenie;
				
 