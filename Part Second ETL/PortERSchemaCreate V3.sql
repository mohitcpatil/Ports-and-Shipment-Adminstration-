-- MySQL Script generated by MySQL Workbench
-- Mon Nov 16 18:40:41 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Port_ER
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Port_ER` ;

-- -----------------------------------------------------
-- Schema Port_ER
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Port_ER` DEFAULT CHARACTER SET utf8 ;
USE `Port_ER` ;

-- -----------------------------------------------------
-- Table `Port_ER`.`Products`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Port_ER`.`Products` ;

CREATE TABLE IF NOT EXISTS `Port_ER`.`Products` (
  `Product_ID` INT NOT NULL AUTO_INCREMENT,
  `Product_Measure` VARCHAR(30) NOT NULL COMMENT 'Ton, Container, Kg, Liter, etc.',
  `Bulk_OR_Container` TINYINT NOT NULL,
  `Product_Name` VARCHAR(130) NOT NULL,
  `Product_Type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Product_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Port_ER`.`Countries`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Port_ER`.`Countries` ;

CREATE TABLE IF NOT EXISTS `Port_ER`.`Countries` (
  `Country_Code` VARCHAR(2) NOT NULL,
  `Country_Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Country_Code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Port_ER`.`States`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Port_ER`.`States` ;

CREATE TABLE IF NOT EXISTS `Port_ER`.`States` (
  `Countries_Country_Code` VARCHAR(2) NOT NULL,
  `State_Code` VARCHAR(3) NOT NULL,
  `State_Name` VARCHAR(80) NOT NULL,
  `State_Type` VARCHAR(60) NULL,
  PRIMARY KEY (`Countries_Country_Code`, `State_Code`),
  INDEX `fk_States_Countries1_idx` (`Countries_Country_Code` ASC) VISIBLE,
  CONSTRAINT `fk_States_Countries1`
    FOREIGN KEY (`Countries_Country_Code`)
    REFERENCES `Port_ER`.`Countries` (`Country_Code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Port_ER`.`Vendors`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Port_ER`.`Vendors` ;

CREATE TABLE IF NOT EXISTS `Port_ER`.`Vendors` (
  `Vendor_ID` INT NOT NULL AUTO_INCREMENT,
  `Vendor_Name` VARCHAR(50) NOT NULL,
  `Contact_Person` VARCHAR(25) NULL,
  `Email` VARCHAR(35) NULL,
  `Phone` VARCHAR(20) NULL,
  `States_Countries_Country_Code` VARCHAR(2) NULL,
  `States_State_Code` VARCHAR(3) NULL,
  PRIMARY KEY (`Vendor_ID`),
  INDEX `fk_Vendors_States1_idx` (`States_Countries_Country_Code` ASC, `States_State_Code` ASC) VISIBLE,
  CONSTRAINT `fk_Vendors_States1`
    FOREIGN KEY (`States_Countries_Country_Code` , `States_State_Code`)
    REFERENCES `Port_ER`.`States` (`Countries_Country_Code` , `State_Code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Port_ER`.`Timezones`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Port_ER`.`Timezones` ;

CREATE TABLE IF NOT EXISTS `Port_ER`.`Timezones` (
  `Timezone_ID` INT NOT NULL,
  `Timezone_name` VARCHAR(30) NOT NULL,
  `Timezone_UTC_Offset` INT NOT NULL,
  PRIMARY KEY (`Timezone_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Port_ER`.`Ports`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Port_ER`.`Ports` ;

CREATE TABLE IF NOT EXISTS `Port_ER`.`Ports` (
  `Port_Code` VARCHAR(5) NOT NULL,
  `Port_Name` VARCHAR(25) NOT NULL,
  `Latitude` VARCHAR(45) NOT NULL,
  `Longitude` VARCHAR(45) NOT NULL,
  `Timezones_Timezone_ID` INT NOT NULL,
  `States_Countries_Country_Code` VARCHAR(2) NOT NULL,
  `States_State_Code` VARCHAR(3) NULL,
  PRIMARY KEY (`Port_Code`),
  INDEX `fk_Ports_Timezones1_idx` (`Timezones_Timezone_ID` ASC) VISIBLE,
  INDEX `fk_Ports_States1_idx` (`States_Countries_Country_Code` ASC, `States_State_Code` ASC) VISIBLE,
  CONSTRAINT `fk_Ports_Timezones1`
    FOREIGN KEY (`Timezones_Timezone_ID`)
    REFERENCES `Port_ER`.`Timezones` (`Timezone_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ports_States1`
    FOREIGN KEY (`States_Countries_Country_Code` , `States_State_Code`)
    REFERENCES `Port_ER`.`States` (`Countries_Country_Code` , `State_Code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Port_ER`.`Shipments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Port_ER`.`Shipments` ;

CREATE TABLE IF NOT EXISTS `Port_ER`.`Shipments` (
  `Shipment_ID` VARCHAR(10) NOT NULL,
  `Quantity` INT NOT NULL,
  `Product` INT NOT NULL,
  `Vendor_ID` INT NOT NULL,
  `Destination` VARCHAR(5) NOT NULL,
  `Origin` VARCHAR(5) NOT NULL,
  `Datetime Departed` DATETIME NOT NULL,
  `Datetime Arrived` DATETIME NOT NULL,
  PRIMARY KEY (`Shipment_ID`),
  INDEX `fk_Shipment Fact_Product Dimension_idx` (`Product` ASC) VISIBLE,
  INDEX `fk_Shipment Fact_Vendor Dimension1_idx` (`Vendor_ID` ASC) VISIBLE,
  INDEX `fk_Shipments_Ports1_idx` (`Destination` ASC) VISIBLE,
  INDEX `fk_Shipments_Ports2_idx` (`Origin` ASC) VISIBLE,
  CONSTRAINT `fk_Shipment Fact_Product Dimension`
    FOREIGN KEY (`Product`)
    REFERENCES `Port_ER`.`Products` (`Product_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Shipment Fact_Vendor Dimension1`
    FOREIGN KEY (`Vendor_ID`)
    REFERENCES `Port_ER`.`Vendors` (`Vendor_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Shipments_Ports1`
    FOREIGN KEY (`Destination`)
    REFERENCES `Port_ER`.`Ports` (`Port_Code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Shipments_Ports2`
    FOREIGN KEY (`Origin`)
    REFERENCES `Port_ER`.`Ports` (`Port_Code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
