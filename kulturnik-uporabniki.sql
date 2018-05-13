SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Uporabniki
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Uporabniki
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Uporabniki` DEFAULT CHARACTER SET utf8 ;
USE `Uporabniki` ;

-- -----------------------------------------------------
-- Table `Filmi`.`Uporabniki`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Uporabniki`.`Uporabniki` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Ime` VARCHAR(45) NOT NULL,
  `Priimek` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
