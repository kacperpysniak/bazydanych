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
COMMENT ON TABLE ksiegowosc.godziny is 'godziny pracownikow';

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
('1qaz','Jan','Adamiak','Kraków ul.Wesoła 21a','651676128'),
('2wsx','Anna','Nowak','Warszawa ul.Nowa 212/1','921111233'),
('3edc','Jakub','Olczowy','Kraków ul.zarnowiejska 23/11','877656727'),
('4rfv','Joanna','Lachowicz','Białystok ul.Szkolna 12','789090872'),
('5tgb','Aadm','Wzorowy','Kraków ul. Wrocławska 69/12','911231986'),
('6yhn','Jadwiga','Koperta','Janów 12a','123222654'),
('7ujm','Józef','Laskowksi','Warszawa ul.Nowoursynowska 211/1a','131432560'),
('8ijn','Jan','Antes','Kraków ul.Nawojki 221/1','655233123'),
('9plm','Kacper','Borowy','Kraków ul.Mazowiecka 80/3','987345012'),
('10is','Damian','Drewniany','Kraków ul.Galla 71/1','233987612');
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
('ps7','Sprzątacz',2100),
('ps8','Pracownik Fizyczny',2100),
('ps9','Pomoc',2000),
('ps10','Stażysta',1000);
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

--4
--a)
SELECT id_pracownika,nazwisko FROM ksiegowosc.pracownicy;
--b)
SELECT id_p.id_pracownika FROM ksiegowosc.wynagrodzenie id_p, ksiegowosc.pensja pen 
WHERE pen.id_pensji = id_p.id_pensji AND pen.kwota > MONEY(1000);
--c)
SELECT id_p.id_pracownika FROM ksiegowosc.wynagrodzenie id_p, ksiegowosc.pensja pen, ksiegowosc.premia pre
WHERE pen.id_pensji = id_p.id_pensji AND pre.id_premii = id_p.id_premii AND pen.kwota > MONEY(2000) AND  pre.kwota = MONEY(0);
--d)
SELECT * FROM ksiegowosc.pracownicy
WHERE imie LIKE 'J%';
--e)
SELECT * FROM ksiegowosc.pracownicy
WHERE nazwisko LIKE '%n%' AND imie LIKE '%a';
--f)
SELECT imie, nazwisko, liczba_godzin-160 AS nadgodziny FROM ksiegowosc.pracownicy pr, ksiegowosc.godziny god
WHERE pr.id_pracownika = god.id_pracownika AND liczba_godzin > 160;
--g)
SELECT imie, nazwisko FROM ksiegowosc.pracownicy pre, ksiegowosc.pensja pen, ksiegowosc.wynagrodzenie id_p
WHERE id_p.id_pracownika = pre.id_pracownika AND id_p.id_pensji = pen.id_pensji AND pen.kwota >= MONEY(1500) AND pen.kwota <= MONEY(3000);
--h)
SELECT imie, nazwisko, liczba_godzin-160 AS nadgodziny FROM ksiegowosc.pracownicy pra, ksiegowosc.godziny god, ksiegowosc.premia pre, ksiegowosc.wynagrodzenie id_p
WHERE id_p.id_pracownika = pra.id_pracownika AND id_p.id_godziny = god.id_godziny AND id_p.id_premii = pre.id_premii AND liczba_godzin > 160 AND pre.kwota = MONEY(0);
--i)
SELECT pra.id_pracownika, imie, nazwisko, kwota AS pensja FROM ksiegowosc.pracownicy pra, ksiegowosc.pensja pen, ksiegowosc.wynagrodzenie id_p
WHERE id_p.id_pensji = pen.id_pensji AND id_p.id_pracownika = pra.id_pracownika
ORDER BY pensja;
--j)
SELECT pra.id_pracownika, imie, nazwisko, pen.kwota AS pensja, pre.kwota AS premia FROM ksiegowosc.pracownicy pra, ksiegowosc.pensja pen, ksiegowosc.wynagrodzenie id_p, ksiegowosc.premia pre 
WHERE id_p.id_pensji = pen.id_pensji AND id_p.id_pracownika = pra.id_pracownika AND id_p.id_premii = pre.id_premii
ORDER BY pensja DESC, premia DESC;
--k)
SELECT COUNT(id_pracownika) AS ilosc_pracownikow, stanowisko FROM ksiegowosc.pensja pen, ksiegowosc.wynagrodzenie id_p
WHERE id_p.id_pensji = pen.id_pensji
GROUP BY stanowisko;
--l)
SELECT AVG(kwota::numeric)::money AS srednia_placa, MIN(kwota) AS minimalna_placa, MAX(kwota) AS maksymalna_placa FROM ksiegowosc.pensja pen
WHERE pen.stanowisko = 'Kierownik';
--m)
SELECT SUM(pen.kwota::numeric)::money + SUM(pre.kwota::numeric)::money AS suma_wynagrodzen FROM ksiegowosc.wynagrodzenie id_p, ksiegowosc.pensja pen, ksiegowosc.premia pre
WHERE id_p.id_pensji = pen.id_pensji AND id_p.id_premii = pre.id_premii;
--f)
SELECT stanowisko, SUM(pen.kwota::numeric)::money + SUM(pre.kwota::numeric)::money AS suma_wynagrodzen FROM ksiegowosc.wynagrodzenie id_p, ksiegowosc.pensja pen, ksiegowosc.premia pre
WHERE id_p.id_pensji = pen.id_pensji AND id_p.id_premii = pre.id_premii
GROUP BY stanowisko;
--g)
SELECT stanowisko, COUNT(id_p.id_premii) AS liczba_premii FROM ksiegowosc.wynagrodzenie id_p, ksiegowosc.pensja pen, ksiegowosc.premia pre
WHERE id_p.id_pensji = pen.id_pensji AND id_p.id_premii = pre.id_premii AND pre.kwota != MONEY(0)
GROUP BY stanowisko








