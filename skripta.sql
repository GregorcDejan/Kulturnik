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
  `Naziv` VARCHAR(45)  NULL,
  `Kraj` VARCHAR(300)  NULL,
  `Ura` TIME  NULL,
  `Izvajalec` VARCHAR(45)  NULL,
  `Lokacija` VARCHAR(45)  NULL,
  `Cena` VARCHAR(20) NULL ,
  `Opis` VARCHAR(2000) NULL,
  `Slika` VARCHAR(2000) NULL DEFAULT 'https://www.mearto.com/assets/no-image-83a2b680abc7af87cfff7777d0756fadb9f9aecd5ebda5d34f8139668e0fc842.png',
  `Uporabnik_ID` INT NULL DEFAULT 1, 
  `Tip` VARCHAR(45)  NULL,
  `Datum` DATE  NULL,
  `Vir` VARCHAR(2000) NULL,
  PRIMARY KEY (`ID`),
  
  CONSTRAINT `fk_Dogodek_Uporabnik`
    FOREIGN KEY (`Uporabnik_ID`)
    REFERENCES `Uporabnik` (`ID`) ON DELETE CASCADE
    );
select * from uporabnik;



INSERT INTO UPORABNIK(ID,ime,priimek,email,telefon,geslo,datum_rojstva,avatar) VALUES(1,'Dejan','Gregorc','dejan.gregorc@student.um.si','041451061','password','18.03.1998','https://api.adorable.io/avatars/1000/a');
INSERT INTO UPORABNIK(ime,priimek,email,telefon,geslo,datum_rojstva,avatar)VALUES('Janez','Novak','janez.novak@gmail.com','041569347','pass','03.09.1997','https://api.adorable.io/avatars/1000/b');
INSERT INTO UPORABNIK(ime,priimek,email,telefon,geslo,datum_rojstva,avatar)VALUES('Maja','Kotnik','maja.kotnik@gmail.com','041563212','pass','05.08.1997','https://api.adorable.io/avatars/1000/c');
INSERT INTO UPORABNIK(ime,priimek,email,telefon,geslo,datum_rojstva,avatar) VALUES('Domen','Delas','domen.delas@student.um.si','041546325','password','20.03.2000','https://api.adorable.io/avatars/1000/d');
INSERT INTO UPORABNIK(ime,priimek,email,telefon,geslo,datum_rojstva,avatar) VALUES('Mihec','Pihec','miha.piha@zelo.si','555015550','geslo','1.2.2000','https://api.adorable.io/avatars/1000/e');
INSERT INTO UPORABNIK(ime,priimek,email,telefon,geslo,datum_rojstva,avatar) VALUES('Janko','Panko','jankec.pankec@zaspankec.si','041451061','geslo','1.2.2000','https://api.adorable.io/avatars/1000/f');
INSERT INTO UPORABNIK (ime,priimek,email,telefon,geslo,datum_rojstva,avatar) VALUES ('Tina','Bezjak','tina.bezjak@gmail.com','041422334','geslo1','21.5.1998','https://api.adorable.io/avatars/1000/g');
INSERT INTO UPORABNIK (ime,priimek,email,telefon,geslo,datum_rojstva,avatar) VALUES ('Boris','Vasiljev','boris.vasiljev@gmail.com','041555009','geslo2','21.6.1990','https://api.adorable.io/avatars/1000/h');
INSERT INTO UPORABNIK (ime,priimek,email,telefon,geslo,datum_rojstva,avatar) VALUES ('Martina','Kos','martina.kos@gmail.com','041000234','geslo3','21.7.1988','https://api.adorable.io/avatars/1000/i');
INSERT INTO UPORABNIK(id,ime,priimek,email,telefon,geslo,datum_rojstva,avatar) VALUES (666,'Admin','Glavni','admin@kulturnik.gg','666555444','admin','2012-12-12','https://api.adorable.io/avatars/1000/j');
INSERT INTO DOGODEK(naziv,kraj,ura,izvajalec,lokacija,cena,opis,slika,tip,datum,vir,avatar) VALUES('Koncert Marko Škugor','Celje','18:00:00','Marko Škugor','Celjski grad',20,'Koncert prvega glasu Dalmacije','http://content.eventim.com/static/uploaded/at/orch_960_360.jpg','Glasba','2018-2-5','www.eventim.si/si/vstopnice/dalmatinski-kulinaricni-dogodek-jakobski-dol-gostilna-zmavc-1042488/performance.html',https://api.adorable.io/avatars/1000/l);
