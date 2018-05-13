-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Film`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Film` (
  `ID` VARCHAR(45) NOT NULL,
  `Naslov` VARCHAR(45) NOT NULL,
  `Izvirni_naslov` VARCHAR(45) NULL,
  `punchline` VARCHAR(100) NULL,
  `Zanr` VARCHAR(45) NOT NULL,
  `Letnica` VARCHAR(45) NOT NULL,
  `Trajanje` INT NOT NULL,
  `Url` VARCHAR(100) NULL,
  `Poster` VARCHAR(200) NULL DEFAULT 'https://www.mearto.com/assets/no-image-83a2b680abc7af87cfff7777d0756fadb9f9aecd5ebda5d34f8139668e0fc842.png',
  `Distributer` VARCHAR(100) NOT NULL,
  `Jezik` VARCHAR(45) NOT NULL,
  `Drzava` VARCHAR(45) NOT NULL,
  `Opis` VARCHAR(500) NULL,
  `Filmcol` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Igralec`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Igralec` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Ime` VARCHAR(45) NOT NULL,
  `Priimek` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Direktor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Direktor` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Ime` VARCHAR(45) NOT NULL,
  `Priimek` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Scenarist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Scenarist` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Ime` VARCHAR(45) NOT NULL,
  `Priimek` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Producent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Producent` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Ime` VARCHAR(45) NOT NULL,
  `Priimek` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Film_has_Direktor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Film_has_Direktor` (
  `Film_ID` VARCHAR(45) NOT NULL,
  `Direktor_ID` INT NOT NULL,
  PRIMARY KEY (`Film_ID`, `Direktor_ID`),
  INDEX `fk_Film_has_Direktor_Direktor1_idx` (`Direktor_ID` ASC),
  INDEX `fk_Film_has_Direktor_Film_idx` (`Film_ID` ASC),
  CONSTRAINT `fk_Film_has_Direktor_Film`
    FOREIGN KEY (`Film_ID`)
    REFERENCES `mydb`.`Film` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Film_has_Direktor_Direktor1`
    FOREIGN KEY (`Direktor_ID`)
    REFERENCES `mydb`.`Direktor` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Film_has_Producent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Film_has_Producent` (
  `Film_ID` VARCHAR(45) NOT NULL,
  `Producent_ID` INT NOT NULL,
  PRIMARY KEY (`Film_ID`, `Producent_ID`),
  INDEX `fk_Film_has_Producent_Producent1_idx` (`Producent_ID` ASC),
  INDEX `fk_Film_has_Producent_Film1_idx` (`Film_ID` ASC),
  CONSTRAINT `fk_Film_has_Producent_Film1`
    FOREIGN KEY (`Film_ID`)
    REFERENCES `mydb`.`Film` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Film_has_Producent_Producent1`
    FOREIGN KEY (`Producent_ID`)
    REFERENCES `mydb`.`Producent` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Film_has_Scenarist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Film_has_Scenarist` (
  `Film_ID` VARCHAR(45) NOT NULL,
  `Scenarist_ID` INT NOT NULL,
  PRIMARY KEY (`Film_ID`, `Scenarist_ID`),
  INDEX `fk_Film_has_Scenarist_Scenarist1_idx` (`Scenarist_ID` ASC),
  INDEX `fk_Film_has_Scenarist_Film1_idx` (`Film_ID` ASC),
  CONSTRAINT `fk_Film_has_Scenarist_Film1`
    FOREIGN KEY (`Film_ID`)
    REFERENCES `mydb`.`Film` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Film_has_Scenarist_Scenarist1`
    FOREIGN KEY (`Scenarist_ID`)
    REFERENCES `mydb`.`Scenarist` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Film_has_Igralec`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Film_has_Igralec` (
  `Film_ID` VARCHAR(45) NOT NULL,
  `Igralec_ID` INT NOT NULL,
  PRIMARY KEY (`Film_ID`, `Igralec_ID`),
  INDEX `fk_Film_has_Igralec_Igralec1_idx` (`Igralec_ID` ASC),
  INDEX `fk_Film_has_Igralec_Film1_idx` (`Film_ID` ASC),
  CONSTRAINT `fk_Film_has_Igralec_Film1`
    FOREIGN KEY (`Film_ID`)
    REFERENCES `mydb`.`Film` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Film_has_Igralec_Igralec1`
    FOREIGN KEY (`Igralec_ID`)
    REFERENCES `mydb`.`Igralec` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Predvajanje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Predvajanje` (
  `ID` VARCHAR(45) NOT NULL,
  `datum` DATE NOT NULL,
  `Cas` TIME NOT NULL,
  `Kino` VARCHAR(45) NOT NULL,
  `Dvorana` VARCHAR(45) NOT NULL,
  `Film_ID` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Predvajanje_Film1_idx` (`Film_ID` ASC),
  CONSTRAINT `fk_Predvajanje_Film1`
    FOREIGN KEY (`Film_ID`)
    REFERENCES `mydb`.`Film` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
