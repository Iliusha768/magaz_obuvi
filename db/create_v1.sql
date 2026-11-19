-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema magaz
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema magaz
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `magaz` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `magaz` ;

-- -----------------------------------------------------
-- Table `magaz`.`category_tovar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `magaz`.`category_tovar` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `category` TEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `magaz`.`name_tovar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `magaz`.`name_tovar` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name_tovar` TEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `magaz`.`пункты выдачи_import`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `magaz`.`пункты выдачи_import` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `postcode` INT NOT NULL,
  `city` TEXT NOT NULL,
  `street` TEXT NOT NULL,
  `house` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 37
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `magaz`.`status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `magaz`.`status` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `status` TEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `magaz`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `magaz`.`role` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `role` TEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `magaz`.`user_import`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `magaz`.`user_import` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `role` INT NOT NULL,
  `name` TEXT NOT NULL,
  `login` TEXT NOT NULL,
  `password` TEXT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `gg_idx` (`role` ASC) VISIBLE,
  CONSTRAINT `gg`
    FOREIGN KEY (`role`)
    REFERENCES `magaz`.`role` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `magaz`.`заказ_import`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `magaz`.`заказ_import` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `order_date` TEXT NOT NULL,
  `delivery_date` TEXT NOT NULL,
  `post_adress` INT NOT NULL,
  `name` INT NOT NULL,
  `code` INT NOT NULL,
  `status` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `f_idx` (`name` ASC) VISIBLE,
  INDEX `dsa_idx` (`status` ASC) VISIBLE,
  INDEX `asd_idx` (`post_adress` ASC) VISIBLE,
  CONSTRAINT `asd`
    FOREIGN KEY (`post_adress`)
    REFERENCES `magaz`.`пункты выдачи_import` (`id`),
  CONSTRAINT `dsa`
    FOREIGN KEY (`status`)
    REFERENCES `magaz`.`status` (`id`),
  CONSTRAINT `f`
    FOREIGN KEY (`name`)
    REFERENCES `magaz`.`user_import` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `magaz`.`postavshi`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `magaz`.`postavshi` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name_postavshika` TEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `magaz`.`proizvoditel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `magaz`.`proizvoditel` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `proizvoditel` TEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `magaz`.`tovar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `magaz`.`tovar` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `articul` TEXT NOT NULL,
  `name_tovar` INT NOT NULL,
  `edinitsa` TEXT NOT NULL,
  `price` INT NOT NULL,
  `postavshi` INT NOT NULL,
  `proizvoditel` INT NOT NULL,
  `category_tovar` INT NOT NULL,
  `skidka` INT NOT NULL,
  `na_sklade` INT NOT NULL,
  `opisanie` TEXT NULL DEFAULT NULL,
  `photo` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `po_idx` (`name_tovar` ASC) VISIBLE,
  INDEX `da_idx` (`postavshi` ASC) VISIBLE,
  INDEX `s_idx` (`proizvoditel` ASC) VISIBLE,
  INDEX `d_idx` (`category_tovar` ASC) VISIBLE,
  CONSTRAINT `d`
    FOREIGN KEY (`category_tovar`)
    REFERENCES `magaz`.`category_tovar` (`id`),
  CONSTRAINT `da`
    FOREIGN KEY (`postavshi`)
    REFERENCES `magaz`.`postavshi` (`id`),
  CONSTRAINT `po`
    FOREIGN KEY (`name_tovar`)
    REFERENCES `magaz`.`name_tovar` (`id`),
  CONSTRAINT `s`
    FOREIGN KEY (`proizvoditel`)
    REFERENCES `magaz`.`proizvoditel` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 31
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `magaz`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `magaz`.`order` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `order_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `pruduct_count` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fg_idx` (`order_id` ASC) VISIBLE,
  INDEX `sdfdsf_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fg`
    FOREIGN KEY (`order_id`)
    REFERENCES `magaz`.`заказ_import` (`id`),
  CONSTRAINT `sdfdsf`
    FOREIGN KEY (`product_id`)
    REFERENCES `magaz`.`tovar` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
