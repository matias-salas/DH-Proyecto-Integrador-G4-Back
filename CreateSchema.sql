-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema 1023c03_GRUPO4
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema 1023c03_GRUPO4
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `1023c03_GRUPO4` DEFAULT CHARACTER SET utf8 ;
USE `1023c03_GRUPO4` ;

-- -----------------------------------------------------
-- Table `1023c03_GRUPO4`.`category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `1023c03_GRUPO4`.`category` ;

CREATE TABLE IF NOT EXISTS `1023c03_GRUPO4`.`category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `description` VARCHAR(255) NULL,
  `url` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `1023c03_GRUPO4`.`fuel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `1023c03_GRUPO4`.`fuel` ;

CREATE TABLE IF NOT EXISTS `1023c03_GRUPO4`.`fuel` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `abbreviation` VARCHAR(2) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `1023c03_GRUPO4`.`transmission`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `1023c03_GRUPO4`.`transmission` ;

CREATE TABLE IF NOT EXISTS `1023c03_GRUPO4`.`transmission` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `fuel_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fuel_transmission_idx` (`fuel_id` ASC) VISIBLE,
  CONSTRAINT `fuel_transmission`
    FOREIGN KEY (`fuel_id`)
    REFERENCES `1023c03_GRUPO4`.`fuel` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `1023c03_GRUPO4`.`product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `1023c03_GRUPO4`.`product` ;

CREATE TABLE IF NOT EXISTS `1023c03_GRUPO4`.`product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `short_description` VARCHAR(120) NOT NULL,
  `active` TINYINT NOT NULL DEFAULT 1,
  `address` VARCHAR(255) NOT NULL,
  `latitude` VARCHAR(45) NOT NULL,
  `longitude` VARCHAR(45) NOT NULL,
  `area` VARCHAR(45) NULL,
  `average_score` DOUBLE NULL,
  `category_id` INT NOT NULL,
  `transmission_id` INT NOT NULL,
  `site_policies` MEDIUMTEXT NULL,
  `hse_policies` MEDIUMTEXT NULL,
  `cancellation_policies` MEDIUMTEXT NULL,
  INDEX `category_id_idx` (`category_id` ASC) VISIBLE,
  INDEX `transmission_id_idx` (`transmission_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `prod_category_id`
    FOREIGN KEY (`category_id`)
    REFERENCES `1023c03_GRUPO4`.`category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `prod_transmission_id`
    FOREIGN KEY (`transmission_id`)
    REFERENCES `1023c03_GRUPO4`.`transmission` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `1023c03_GRUPO4`.`image`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `1023c03_GRUPO4`.`image` ;

CREATE TABLE IF NOT EXISTS `1023c03_GRUPO4`.`image` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NULL,
  `url` VARCHAR(255) NOT NULL,
  `product_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `product_id_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `img_product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `1023c03_GRUPO4`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `1023c03_GRUPO4`.`role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `1023c03_GRUPO4`.`role` ;

CREATE TABLE IF NOT EXISTS `1023c03_GRUPO4`.`role` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `1023c03_GRUPO4`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `1023c03_GRUPO4`.`user` ;

CREATE TABLE IF NOT EXISTS `1023c03_GRUPO4`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `lastname` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `enabled` TINYINT NOT NULL DEFAULT 1,
  `transmission_id` INT NOT NULL,
  `role_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_transmission_idx` (`transmission_id` ASC) VISIBLE,
  INDEX `user_role_idx` (`role_id` ASC) VISIBLE,
  CONSTRAINT `user_transmission`
    FOREIGN KEY (`transmission_id`)
    REFERENCES `1023c03_GRUPO4`.`transmission` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `user_role`
    FOREIGN KEY (`role_id`)
    REFERENCES `1023c03_GRUPO4`.`role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `1023c03_GRUPO4`.`favorite_product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `1023c03_GRUPO4`.`favorite_product` ;

CREATE TABLE IF NOT EXISTS `1023c03_GRUPO4`.`favorite_product` (
  `user_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  INDEX `user_id_idx` (`user_id` ASC) VISIBLE,
  INDEX `product_id_idx` (`product_id` ASC) VISIBLE,
  PRIMARY KEY (`user_id`, `product_id`),
  CONSTRAINT `fp_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `1023c03_GRUPO4`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fp_product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `1023c03_GRUPO4`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `1023c03_GRUPO4`.`reservation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `1023c03_GRUPO4`.`reservation` ;

CREATE TABLE IF NOT EXISTS `1023c03_GRUPO4`.`reservation` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `arrival_time` TIME NOT NULL,
  `check_in_date` DATE NOT NULL,
  `checkout_date` DATE NOT NULL,
  `comments` VARCHAR(45) NULL,
  `user_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_id_idx` (`user_id` ASC) VISIBLE,
  INDEX `product_id_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `res_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `1023c03_GRUPO4`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `res_product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `1023c03_GRUPO4`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `1023c03_GRUPO4`.`spec`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `1023c03_GRUPO4`.`spec` ;

CREATE TABLE IF NOT EXISTS `1023c03_GRUPO4`.`spec` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `icon` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `1023c03_GRUPO4`.`product_spec`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `1023c03_GRUPO4`.`product_spec` ;

CREATE TABLE IF NOT EXISTS `1023c03_GRUPO4`.`product_spec` (
  `id_product` INT NOT NULL,
  `id_spec` INT NOT NULL,
  INDEX `id_spec_idx` (`id_spec` ASC) VISIBLE,
  PRIMARY KEY (`id_product`, `id_spec`),
  CONSTRAINT `ps_product_id`
    FOREIGN KEY (`id_product`)
    REFERENCES `1023c03_GRUPO4`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ps_spec_id`
    FOREIGN KEY (`id_spec`)
    REFERENCES `1023c03_GRUPO4`.`spec` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
