-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema hotel_management
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema hotel_management
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hotel_management` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `hotel_management` ;

-- -----------------------------------------------------
-- Table `hotel_management`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel_management`.`customer` (
  `customer_id` INT NOT NULL,
  `first_name` VARCHAR(30) NULL DEFAULT NULL,
  `last_name` VARCHAR(30) NULL DEFAULT NULL,
  `phone` VARCHAR(15) NULL DEFAULT NULL,
  `email` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hotel_management`.`hotel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel_management`.`hotel` (
  `hotel_id` INT NOT NULL,
  `hotel_name` VARCHAR(50) NULL DEFAULT NULL,
  `city` VARCHAR(30) NULL DEFAULT NULL,
  `rating` DECIMAL(2,1) NULL DEFAULT NULL,
  `total_rooms` INT NULL DEFAULT NULL,
  PRIMARY KEY (`hotel_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hotel_management`.`room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel_management`.`room` (
  `room_id` INT NOT NULL,
  `hotel_id` INT NULL DEFAULT NULL,
  `room_type` VARCHAR(20) NULL DEFAULT NULL,
  `price_per_night` DECIMAL(10,2) NULL DEFAULT NULL,
  `room_status` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`room_id`),
  INDEX `hotel_id` (`hotel_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hotel_management`.`booking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel_management`.`booking` (
  `booking_id` INT NOT NULL,
  `customer_id` INT NULL DEFAULT NULL,
  `room_id` INT NULL DEFAULT NULL,
  `hotel_id` INT NULL DEFAULT NULL,
  `check_in` DATE NULL DEFAULT NULL,
  `check_out` DATE NULL DEFAULT NULL,
  `booking_status` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`booking_id`),
  INDEX `customer_id` (`customer_id` ASC) VISIBLE,
  INDEX `room_id` (`room_id` ASC) VISIBLE,
  INDEX `hotel_id` (`hotel_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hotel_management`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel_management`.`employee` (
  `employee_id` INT NOT NULL,
  `hotel_id` INT NULL DEFAULT NULL,
  `employee_name` VARCHAR(50) NULL DEFAULT NULL,
  `department` VARCHAR(30) NULL DEFAULT NULL,
  `designation` VARCHAR(30) NULL DEFAULT NULL,
  `salary` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  INDEX `hotel_id` (`hotel_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hotel_management`.`feedback`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel_management`.`feedback` (
  `feedback_id` INT NOT NULL,
  `customer_id` INT NULL DEFAULT NULL,
  `hotel_id` INT NULL DEFAULT NULL,
  `rating` INT NULL DEFAULT NULL,
  `comments` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`feedback_id`),
  INDEX `customer_id` (`customer_id` ASC) VISIBLE,
  INDEX `hotel_id` (`hotel_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hotel_management`.`loyalty_program`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel_management`.`loyalty_program` (
  `loyalty_id` INT NOT NULL,
  `customer_id` INT NULL DEFAULT NULL,
  `tier` VARCHAR(20) NULL DEFAULT NULL,
  `points` INT NULL DEFAULT NULL,
  PRIMARY KEY (`loyalty_id`),
  INDEX `customer_id` (`customer_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hotel_management`.`payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel_management`.`payment` (
  `payment_id` INT NOT NULL,
  `booking_id` INT NULL DEFAULT NULL,
  `amount` DECIMAL(10,2) NULL DEFAULT NULL,
  `payment_mode` VARCHAR(20) NULL DEFAULT NULL,
  `payment_status` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  INDEX `booking_id` (`booking_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hotel_management`.`service`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel_management`.`service` (
  `service_id` INT NOT NULL,
  `service_name` VARCHAR(50) NULL DEFAULT NULL,
  `service_cost` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`service_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hotel_management`.`service_usage`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel_management`.`service_usage` (
  `usage_id` INT NOT NULL,
  `booking_id` INT NULL DEFAULT NULL,
  `service_id` INT NULL DEFAULT NULL,
  `quantity` INT NULL DEFAULT NULL,
  `total_cost` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`usage_id`),
  INDEX `booking_id` (`booking_id` ASC) VISIBLE,
  INDEX `service_id` (`service_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
