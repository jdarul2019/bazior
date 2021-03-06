drop database if exists bazik;
CREATE DATABASE bazik;
use bazik;

CREATE TABLE Specjalizacja(
	id int NOT NULL auto_increment primary key,
	specjalizacja varchar(40)
	);

CREATE TABLE Adres(
	id int NOT NULL auto_increment primary key,
	miasto varchar(50),
	ulica varchar(50),
	nr_domu int,
	nr_mieszkania int,
	kod_poczt int
	);

CREATE TABLE Lekarze(
	id int NOT NULL auto_increment primary key,
	imie varchar(34),
	nazwisko varchar(40),
	adres int,
	specjalizacja int,
	foreign key (adres) references adres(id),
	foreign	key (specjalizacja) references specjalizacja(id)
	);

CREATE TABLE Uzytkownicy(
	id int NOT NULL auto_increment primary key,
	login varchar(25),
	haslo varchar(25),
	data_dodania timestamp,
	uprawnienia_admin int,
	uprawnienia_edycja int
	);

CREATE TABLE Sale(
	id int NOT NULL auto_increment primary key,
	numer int,
	data_dodania timestamp,
	dodano_przez int,
	typ_sali varchar(50),
	foreign key (dodano_przez) references Uzytkownicy(id)
	);


CREATE TABLE Opiekunowie(
	id int NOT NULL auto_increment primary key,
	imie varchar(25),
	nazwisko varchar(40),
	adres int,
	stanowisko varchar(45),
	foreign key (adres) references adres(id)
	);

CREATE TABLE Pokoje(
	id int NOT NULL auto_increment primary key,
	numer int,
	data_dodania timestamp,
	dodano_przez int,
	foreign key (dodano_przez) references Uzytkownicy(id)
	);

CREATE TABLE Pacjenci(
	id int NOT NULL auto_increment primary key,
	imie varchar(25),
	nazwisko varchar(40),
	pokoj int,
	opiekun int,
	data_dodania timestamp,
	dodano_przez int,
	foreign key (pokoj) references Pokoje(id),
	foreign key (opiekun) references Opiekunowie(id),
	foreign key (dodano_przez) references Uzytkownicy(id) 
	);

CREATE TABLE Zajecia(
	id int NOT NULL auto_increment primary key,
	sala int,
	prowadzacy int,
	pacjent int,
	foreign key (sala) references Sale(id),
	foreign key (prowadzacy) references Lekarze(id),
	foreign key (pacjent) references Pacjenci(id)
	);

CREATE TABLE Token(
	id int NOT NULL auto_increment primary key,
	token text,
	data timestamp
	);

insert into Specjalizacja (specjalizacja) values 
				('kardiolog'),
				('neurolog'),
				('ortopeda'),
				('dermatolog'),
				('laryngolog'),
				('fizjoterapeuta'),
				('psycholog');

insert into Adres (miasto, ulica, nr_domu, nr_mieszkania, kod_poczt) values
				('Gliwice','Zwyci??stwa','4','7','44100'),
				('Gliwice','Przysz??o??ci','46','5','44119'),
				('Zabrze','Wolno??ci','11','2','12123'),
				('Katowice','S??oneczna','14','4','65432'),
				('Katowice','Ksi????ycowa','65','1','45432'),
				('Warszawa','Gwiezdna','43','53','11222'),
				('Bytom','Brudna','54','2','99999'),
				('Gdynia','Mokra','2','1','43234'),
				('Rzesz??w','Dolna','4','12','31235'),
				('Oslo','G??rna','45','62','12354'),
				('Sztokholm','??rednia','2','12','77777'),
				('Berlin','Z??a','26','21','11445'),
				('Madryt','Ciep??a','9','56','87654'),
				('Dallas','Dzika','1','1','90909'),
				('Mos Espa','Piaskowa','27','5','21378'),
				('Talerzowo','Kolorowa','2','17','44556'),
				('Gliwice','Portowa','4','8','32646'),
				('Gliwice','Zielona','64','6','24532'),
				('Gliwice','Jedno??ci','14','2','44119'),
				('Gliwice','Bema','64','52','44100'),
				('Gliwice','Ruska','213','32','44103'),
				('Zabrze','Buchen??w','65','3','53423'),
				('Zabrze','Martwa','86','8','65432'),
				('Zabrze','Krucha','19','6','46789'),
				('Zabrze','Toszecka','96','5','95214'),
				('Katowice','Chorzowska','43','1','74938');

insert into Lekarze (imie, nazwisko, adres, specjalizacja) values
				('Pawe??','Kowalski',2,4),
				('Tomek','Z??om',1,2),
				('??ukasz','Lyks',3,1),
				('Micha??','By??',4,3),
				('Kacper','Pejs',5,6),
				('Micha??','Kich',6,5),
				('Damian','Strzelec',7,6),
				('Mateusz','Jaml',8,7),
				('Jakub','Drak',9,7);

insert into Uzytkownicy (login, haslo, data_dodania, uprawnienia_admin, uprawnienia_edycja) values
				('admin','admin','2021-02-01 17:56:52','1','1');

insert into Sale (numer, data_dodania, dodano_przez, typ_sali) values 
				('101','2021-02-01 17:56:52',1,'sala do gier'),
				('102','2021-02-01 17:56:52',1,'sala gimnastyczna'),
				('105','22021-02-01 17:56:52',1,'jadalnia'),
				('106','2021-02-01 17:56:52',1,'salon'),
				('108','2021-02-01 17:56:52',1,'kantorek'),
				('110','2021-02-01 17:56:52',1,'sauna'),
				('111','2021-02-01 17:56:52',1,'sala relaksu'),
				('112','2021-02-01 17:56:52',1,'kuchnia'),
				('113','2021-02-01 17:56:52',1,'p??ywalnia');

insert into Opiekunowie (imie, nazwisko, adres, stanowisko) values
				('Paulina','Klej',10,'piel??gniarz'),
				('Robert','Zielonka',11,'piel??gniarz'),
				('Marek','Nik',12,'piel??gniarz'),
				('Anna','Nik',12,'kucharz'),
				('Jagoda','By??',4,'sprz??tacz'),
				('Rozalia','Kropla',14,'recepcjonista'),
				('Ben','Kenobi',15,'ochroniarz'),
				('Jan','Beskid',16,'ogrodnik'),
				('Stanis??aw','G??o??ny',17,'piel??gniarz');

insert into Pokoje (numer, data_dodania, dodano_przez) values 
				('210','2021-02-01 16:56:52',1),
				('211','2021-02-01 16:56:52',1),
				('212','2021-02-01 16:56:52',1),
				('213','2021-02-01 16:56:52',1),
				('214','2021-02-01 16:56:52',1),
				('215','2021-02-01 16:56:52',1),
				('216','2021-02-01 16:56:52',1),
				('217','2021-02-01 17:56:52',1),
				('218','2021-02-01 17:56:52',1),
				('219','2021-02-01 17:56:52',1),
				('220','2021-02-01 17:56:52',1),
				('221','2021-02-01 17:56:52',1),
				('222','2021-02-01 19:56:52',1),
				('223','2021-02-01 19:56:52',1),
				('224','2021-02-01 19:56:52',1),
				('225','2021-02-01 19:56:52',1),
				('226','2021-02-01 19:56:52',1),
				('227','2021-02-01 20:56:52',1),
				('228','2021-02-01 20:56:52',1),
				('229','2021-02-01 20:56:52',1),
				('230','2021-02-01 20:56:52',1);

insert into Pacjenci (imie, nazwisko, pokoj, opiekun, data_dodania, dodano_przez) values
				('Robert','??luz',1,1,'2021-02-01 17:56:52',1),
				('??ukasz','Majster',2,2,'2021-02-01 17:56:52',1),
				('Miros??aw','P??tla',3,3,'2021-02-01 17:56:52',1),
				('Maria','P??tla',3,3,'2021-02-01 17:56:52',1),
				('Dariusz','Mebel',4,9,'2021-02-01 17:56:52',1),
				('Wojciech','Cyfer',5,2,'2021-02-01 17:56:52',1),
				('Barbara','Kasztanowska',6,1,'2021-02-01 17:56:52',1),
				('Miros??aw','Kasztanowski',6,1,'2021-02-01 17:56:52',1),
				('Henryk','Bytomski',7,9,'2021-02-01 17:56:52',1),
				('R????a','Kowal',8,3,'2021-02-01 17:56:52',1),
				('Hanna','??elki',9,2,'2021-02-01 17:56:52',1);

insert into Zajecia (sala, prowadzacy, pacjent) values
				(9,5,6),
				(9,7,2),
				(2,7,8),
				(2,5,1),
				(1,9,4),
				(7,8,7);

select `Lekarze`.`imie`, `Lekarze`.`nazwisko`, `Specjalizacja`.`specjalizacja`, 'Lekarz' as `Zawod` from `Lekarze` inner join `specjalizacja` on `lekarze`.`specjalizacja`=`specjalizacja`.`id`
union
select `Opiekunowie`.`imie`, `Opiekunowie`.`nazwisko`, `Opiekunowie`.`stanowisko`,'Pracownik' from `Opiekunowie`;

select `Pacjenci`.`id`, `Pacjenci`.`imie`, `Pacjenci`.`nazwisko`, `Pokoje`.`numer`, concat(`Opiekunowie`.`imie`,' ', `Opiekunowie`.`nazwisko`) as 'Opiekun' from `Pacjenci` 
inner join `Pokoje` on `pokoje`.`id`=`pacjenci`.`pokoj` 
inner join `opiekunowie` on `opiekunowie`.`id`=`pacjenci`.`opiekun`;

select `Pokoje`.`numer` as `Numer pomieszczenia`, 'Sypialny' as `Typ` from `Pokoje`
union
select `Sale`.`numer`, `Sale`.`typ_sali` from `Sale`;

SELECT sale.numer, sale.typ_sali from sale INNER JOIN zajecia on zajecia.sala = sale.id INNER JOIN lekarze on lekarze.id = zajecia.prowadzacy WHERE lekarze.imie = "Damian"

SELECT lekarze.imie, lekarze.nazwisko FROM lekarze INNER join zajecia on zajecia.prowadzacy = lekarze.id INNER JOIN sale on sale.id = zajecia.sala WHERE sale.numer = 113

SELECT Concat(pacjenci.imie, " ", pacjenci.nazwisko) AS Pacjent FROM pacjenci INNER JOIN pokoje on pokoje.id = pacjenci.pokoj INNER JOIN opiekunowie on opiekunowie.id = pacjenci.opiekun WHERE pokoje.numer = 215 AND opiekunowie.nazwisko = "Klej"
