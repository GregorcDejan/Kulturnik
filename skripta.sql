CREATE TABLE IF NOT EXISTS Uporabnik (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Ime` VARCHAR(45) NOT NULL,
  `Priimek` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `telefon` VARCHAR(45) NOT NULL,
  `geslo` VARCHAR(45) NOT NULL,
  `datum_rojstva` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS Dogodek (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Naziv` VARCHAR(45) NOT NULL,
  `Kraj` VARCHAR(300) NOT NULL,
  `Ura` TIME NOT NULL,
  `Izvajalec` VARCHAR(45) NOT NULL,
  `Lokacija` VARCHAR(45) NOT NULL,
  `Cena` INT NULL DEFAULT 0,
  `Opis` VARCHAR(2000) NULL,
  `Slika` VARCHAR(2000) NULL DEFAULT 'https://www.mearto.com/assets/no-image-83a2b680abc7af87cfff7777d0756fadb9f9aecd5ebda5d34f8139668e0fc842.png',
  `Uporabnik_ID` INT NULL DEFAULT 0,
  `Tip` VARCHAR(45) NOT NULL,
  `Datum` DATE NOT NULL,
  `Vir` VARCHAR(2000) NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Dogodek_Uporabnik_idx` (`Uporabnik_ID` ASC),
  CONSTRAINT `fk_Dogodek_Uporabnik`
    FOREIGN KEY (`Uporabnik_ID`)
    REFERENCES `mydb`.`Uporabnik` (`ID`)
    );

