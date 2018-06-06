DROP TABLE DOGODEK;
DROP TABLE UPORABNIK;


CREATE TABLE IF NOT EXISTS Uporabnik (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Ime` VARCHAR(45) NOT NULL,
  `Priimek` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `telefon` VARCHAR(45) NOT NULL,
  `geslo` VARCHAR(45) NOT NULL,
  `datum_rojstva` VARCHAR(45) NOT NULL,
  `avatar` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`ID`));


CREATE TABLE IF NOT EXISTS Dogodek (
 `ID` INT NOT NULL AUTO_INCREMENT,
  `Naziv` VARCHAR(45) NOT NULL,
  `Kraj` VARCHAR(300) NOT NULL,
  `Ura` TIME NOT NULL,
  `Izvajalec` VARCHAR(45) NOT NULL,
  `Lokacija` VARCHAR(45) NOT NULL,
  `Cena` VARCHAR(20) NULL ,
  `Opis` VARCHAR(2000) NULL,
  `Slika` VARCHAR(2000) NULL DEFAULT 'https://www.mearto.com/assets/no-image-83a2b680abc7af87cfff7777d0756fadb9f9aecd5ebda5d34f8139668e0fc842.png',
  `Uporabnik_ID` INT NULL DEFAULT 1, 
  `Tip` VARCHAR(45) NOT NULL,
  `Datum` DATE NOT NULL,
  `Vir` VARCHAR(2000) NULL,
  PRIMARY KEY (`ID`),
  
  CONSTRAINT `fk_Dogodek_Uporabnik`
    FOREIGN KEY (`Uporabnik_ID`)
    REFERENCES `Uporabnik` (`ID`) ON DELETE CASCADE
    );
select * from uporabnik;



INSERT INTO UPORABNIK(ID,ime,priimek,email,telefon,geslo,datum_rojstva) VALUES(1,'Dejan','Gregorc','dejan.gregorc@student.um.si','041451061','password','18.03.1998');
INSERT INTO UPORABNIK(ime,priimek,email,telefon,geslo,datum_rojstva)VALUES('Janez','Novak','janez.novak@gmail.com','041569347','pass','03.09.1997');
INSERT INTO UPORABNIK(ime,priimek,email,telefon,geslo,datum_rojstva)VALUES('Maja','Kotnik','maja.kotnik@gmail.com','041563212','pass','05.08.1997');
INSERT INTO UPORABNIK(ime,priimek,email,telefon,geslo,datum_rojstva) VALUES('Domen','Delas','domen.delas@student.um.si','041546325','password','20.03.2000');
INSERT INTO UPORABNIK(ime,priimek,email,telefon,geslo,datum_rojstva) VALUES('Mihec','Pihec','miha.piha@zelo.si','555015550','geslo','1.2.2000');
INSERT INTO UPORABNIK(ime,priimek,email,telefon,geslo,datum_rojstva) VALUES('Janko','Panko','jankec.pankec@zaspankec.si','041451061','geslo','1.2.2000');
INSERT INTO UPORABNIK (ime,priimek,email,telefon,geslo,datum_rojstva) VALUES ('Tina','Bezjak','tina.bezjak@gmail.com','041422334','geslo1','21.5.1998');
INSERT INTO UPORABNIK (ime,priimek,email,telefon,geslo,datum_rojstva) VALUES ('Boris','Vasiljev','boris.vasiljev@gmail.com','041555009','geslo2','21.6.1990');
INSERT INTO UPORABNIK (ime,priimek,email,telefon,geslo,datum_rojstva) VALUES ('Martina','Kos','martina.kos@gmail.com','041000234','geslo3','21.7.1988');
INSERT INTO UPORABNIK(id,ime,priimek,email,telefon,geslo,datum_rojstva) VALUES (666,'Admin','Glavni','admin@kulturnik.gg','666555444','admin','2012-12-12');
INSERT INTO DOGODEK(naziv,kraj,ura,izvajalec,lokacija,cena,opis,slika,tip,datum,vir) VALUES('Koncert Marko Škugor','Celje','18:00:00','Marko Škugor','Celjski grad',20,'Koncert prvega glasu Dalmacije','http://content.eventim.com/static/uploaded/at/orch_960_360.jpg','Glasba','2018-2-5','www.eventim.si/si/vstopnice/dalmatinski-kulinaricni-dogodek-jakobski-dol-gostilna-zmavc-1042488/performance.html');
