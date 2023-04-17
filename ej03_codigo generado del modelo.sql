-- MySQL Script generated by MySQL Workbench
-- Tue Apr 11 17:44:56 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`camionero`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`camionero` ;

CREATE TABLE IF NOT EXISTS `mydb`.`camionero` (
  `idcamionero` INT NOT NULL AUTO_INCREMENT,
  `dni` VARCHAR(10) NOT NULL,
  `nombre` INT NULL,
  `direccion` VARCHAR(100) NULL,
  `salario` FLOAT NULL,
  `poblacion` VARCHAR(30) NULL,
  PRIMARY KEY (`idcamionero`),
  UNIQUE INDEX `dni_UNIQUE` (`dni` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`provincia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`provincia` ;

CREATE TABLE IF NOT EXISTS `mydb`.`provincia` (
  `idprovincia` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idprovincia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`paquete`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`paquete` ;

CREATE TABLE IF NOT EXISTS `mydb`.`paquete` (
  `idpaquete` INT NOT NULL AUTO_INCREMENT,
  `codigo` VARCHAR(20) NOT NULL,
  `descripción` VARCHAR(150) NULL,
  `destinatario` VARCHAR(45) NOT NULL,
  `direccionDestinatario` VARCHAR(100) NOT NULL,
  `fk_camionero` INT NOT NULL,
  `fk_provincia` INT NOT NULL,
  PRIMARY KEY (`idpaquete`),
  INDEX `fk_paquete_camionero_idx` (`fk_camionero` ASC) VISIBLE,
  INDEX `fk_paquete_provincia1_idx` (`fk_provincia` ASC) VISIBLE,
  CONSTRAINT `fk_paquete_camionero`
    FOREIGN KEY (`fk_camionero`)
    REFERENCES `mydb`.`camionero` (`idcamionero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_paquete_provincia1`
    FOREIGN KEY (`fk_provincia`)
    REFERENCES `mydb`.`provincia` (`idprovincia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`camion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`camion` ;

CREATE TABLE IF NOT EXISTS `mydb`.`camion` (
  `idcamion` INT NOT NULL AUTO_INCREMENT,
  `matricula` VARCHAR(7) NOT NULL,
  `modelo` VARCHAR(45) NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `potencia` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcamion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`camionero_camion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`camionero_camion` ;

CREATE TABLE IF NOT EXISTS `mydb`.`camionero_camion` (
  `idcamionero_camion` INT NOT NULL AUTO_INCREMENT,
  `fk_camion` INT NOT NULL,
  `fk_camionero` INT NOT NULL,
  INDEX `fk_camion_has_camionero_camionero1_idx` (`fk_camionero` ASC) VISIBLE,
  INDEX `fk_camion_has_camionero_camion1_idx` (`fk_camion` ASC) VISIBLE,
  PRIMARY KEY (`idcamionero_camion`),
  CONSTRAINT `fk_camion_has_camionero_camion1`
    FOREIGN KEY (`fk_camion`)
    REFERENCES `mydb`.`camion` (`idcamion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_camion_has_camionero_camionero1`
    FOREIGN KEY (`fk_camionero`)
    REFERENCES `mydb`.`camionero` (`idcamionero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ciudad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`ciudad` ;

CREATE TABLE IF NOT EXISTS `mydb`.`ciudad` (
  `idciudad` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `fk_provincia` INT NOT NULL,
  PRIMARY KEY (`idciudad`),
  INDEX `fk_ciudad_provincia1_idx` (`fk_provincia` ASC) VISIBLE,
  CONSTRAINT `fk_ciudad_provincia1`
    FOREIGN KEY (`fk_provincia`)
    REFERENCES `mydb`.`provincia` (`idprovincia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`direccion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`direccion` ;

CREATE TABLE IF NOT EXISTS `mydb`.`direccion` (
  `iddireccion` INT NOT NULL AUTO_INCREMENT,
  `calle` VARCHAR(45) NOT NULL,
  `portal` CHAR(2) NULL,
  `numero` INT NULL,
  `fk_ciudad` INT NOT NULL,
  PRIMARY KEY (`iddireccion`),
  INDEX `fk_direccion_ciudad1_idx` (`fk_ciudad` ASC) VISIBLE,
  CONSTRAINT `fk_direccion_ciudad1`
    FOREIGN KEY (`fk_ciudad`)
    REFERENCES `mydb`.`ciudad` (`idciudad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
