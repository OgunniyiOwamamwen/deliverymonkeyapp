-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema owas_monkeyDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema owas_monkeyDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `owas_monkeyDB` DEFAULT CHARACTER SET utf8 ;
USE `owas_monkeyDB` ;

-- -----------------------------------------------------
-- Table `owas_monkeyDB`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `owas_monkeyDB`.`employee` (
  `employee_id` INT NOT NULL AUTO_INCREMENT,
  `titleOfCountesy` VARCHAR(5) NULL,
  `lastName` VARCHAR(45) NULL,
  `firstName` VARCHAR(45) NULL,
  `middleName` VARCHAR(45) NULL,
  `dateOfBirth` DATE NULL,
  `email` VARCHAR(45) NULL,
  `taxCode` VARCHAR(45) NULL,
  `phone` INT NULL,
  `homePhone` INT NULL,
  `IsActive` TINYINT NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`employee_id`, `IsActive`),
  UNIQUE INDEX `phone_UNIQUE` (`phone` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `owas_monkeyDB`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `owas_monkeyDB`.`customer` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(45) NULL,
  `lastName` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  `fax` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `notes` TEXT(600) NULL,
  `employee_id` INT NOT NULL,
  `IsActive` TINYINT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`),
  UNIQUE INDEX `phone_UNIQUE` (`phone` ASC) VISIBLE,
  INDEX `fk_customer_employee1_idx` (`employee_id` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  CONSTRAINT `fk_customer_employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `owas_monkeyDB`.`employee` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `owas_monkeyDB`.`salary`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `owas_monkeyDB`.`salary` (
  `salary_id` INT NOT NULL AUTO_INCREMENT,
  `hourPay` DECIMAL NULL,
  `hours` DECIMAL NULL,
  `basicSalary` DECIMAL NULL,
  `loan` CHAR(3) NULL,
  `bonus` DECIMAL NULL,
  `cloth` CHAR(5) NULL,
  `stateTax` DECIMAL NULL,
  `federalTax` DECIMAL NULL,
  `netpay` DECIMAL NULL,
  `month` VARCHAR(17) NULL,
  `year` INT NULL,
  `employee_id` INT NOT NULL,
  `IsActive` TINYINT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`salary_id`),
  INDEX `fk_salary_employee1_idx` (`employee_id` ASC) VISIBLE,
  CONSTRAINT `fk_salary_employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `owas_monkeyDB`.`employee` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `owas_monkeyDB`.`education`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `owas_monkeyDB`.`education` (
  `education_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `notes` TEXT(600) NULL,
  `employee_id` INT NOT NULL,
  `IsActive` TINYINT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`education_id`),
  INDEX `fk_education_employee1_idx` (`employee_id` ASC) VISIBLE,
  CONSTRAINT `fk_education_employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `owas_monkeyDB`.`employee` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `owas_monkeyDB`.`bank`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `owas_monkeyDB`.`bank` (
  `bank_id` INT NOT NULL AUTO_INCREMENT,
  `IbanNunber` VARCHAR(45) NULL,
  `bankName` VARCHAR(45) NULL,
  `type` VARCHAR(45) NULL,
  `employee_id` INT NOT NULL,
  `IsActive` TINYINT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`bank_id`),
  INDEX `fk_bank_employee1_idx` (`employee_id` ASC) VISIBLE,
  CONSTRAINT `fk_bank_employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `owas_monkeyDB`.`employee` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `owas_monkeyDB`.`loan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `owas_monkeyDB`.`loan` (
  `loan_id` INT NOT NULL AUTO_INCREMENT,
  `loanAmount` DECIMAL NULL,
  `loanType` VARCHAR(45) NULL,
  `notes` TEXT(600) NULL,
  `Date` DATETIME NULL,
  `employee_id` INT NOT NULL,
  `IsActive` TINYINT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`loan_id`),
  INDEX `fk_loan_employee1_idx` (`employee_id` ASC) VISIBLE,
  CONSTRAINT `fk_loan_employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `owas_monkeyDB`.`employee` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `owas_monkeyDB`.`loan_return`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `owas_monkeyDB`.`loan_return` (
  `loanReturn_id` INT NOT NULL AUTO_INCREMENT,
  `returnAmount` DECIMAL NULL,
  `paymentType` VARCHAR(45) NULL,
  `Notes` TEXT(600) NULL,
  `date` DATETIME NULL,
  `loan_id` INT NOT NULL,
  `IsActive` TINYINT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`loanReturn_id`),
  INDEX `fk_loanReturn_loan1_idx` (`loan_id` ASC) VISIBLE,
  CONSTRAINT `fk_loanReturn_loan1`
    FOREIGN KEY (`loan_id`)
    REFERENCES `owas_monkeyDB`.`loan` (`loan_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `owas_monkeyDB`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `owas_monkeyDB`.`category` (
  `category_id` INT NOT NULL AUTO_INCREMENT,
  `categoryname` VARCHAR(45) NULL,
  `description` TEXT(600) NULL,
  `IsActive` TINYINT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `owas_monkeyDB`.`product_price`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `owas_monkeyDB`.`product_price` (
  `product_price_id` INT NOT NULL AUTO_INCREMENT,
  `unitPrice` DECIMAL NULL,
  `disCounted` DECIMAL NULL,
  `IsActive` TINYINT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_price_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `owas_monkeyDB`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `owas_monkeyDB`.`product` (
  `product_id` INT NOT NULL,
  `productName` VARCHAR(45) NULL,
  `desProduct` TEXT(150) NULL,
  `unitInStock` INT NULL,
  `category_id` INT NOT NULL,
  `product_price_id` INT NOT NULL,
  `IsActive` TINYINT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_id`),
  INDEX `fk_product_category1_idx` (`category_id` ASC) VISIBLE,
  INDEX `fk_product_product_price1_idx` (`product_price_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `owas_monkeyDB`.`category` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_product_price1`
    FOREIGN KEY (`product_price_id`)
    REFERENCES `owas_monkeyDB`.`product_price` (`product_price_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `owas_monkeyDB`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `owas_monkeyDB`.`order` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `customer_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `quantity` INT NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  INDEX `fk_order_customer1_idx` (`customer_id` ASC) VISIBLE,
  INDEX `fk_order_product1_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `owas_monkeyDB`.`customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `owas_monkeyDB`.`product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `owas_monkeyDB`.`order_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `owas_monkeyDB`.`order_details` (
  `order_detail_id` INT NOT NULL AUTO_INCREMENT,
  `order_id` INT NOT NULL,
  `status` VARCHAR(12) NULL,
  `IsActive` TINYINT NULL,
  PRIMARY KEY (`order_detail_id`),
  INDEX `fk_orderDetails_order1_idx` (`order_id` ASC) VISIBLE,
  CONSTRAINT `fk_orderDetails_order1`
    FOREIGN KEY (`order_id`)
    REFERENCES `owas_monkeyDB`.`order` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `owas_monkeyDB`.`order_detail_delivery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `owas_monkeyDB`.`order_detail_delivery` (
  `order_detail_delivery_id` INT NOT NULL AUTO_INCREMENT,
  `order_detail_id` INT NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_detail_delivery_id`),
  INDEX `fk_order_detail_delivery_order_details1_idx` (`order_detail_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_detail_delivery_order_details1`
    FOREIGN KEY (`order_detail_id`)
    REFERENCES `owas_monkeyDB`.`order_details` (`order_detail_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `owas_monkeyDB`.`department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `owas_monkeyDB`.`department` (
  `department_id` INT NOT NULL AUTO_INCREMENT,
  `deptName` VARCHAR(45) NULL,
  `note` TEXT(600) NULL,
  `IsActive` TINYINT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`department_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `owas_monkeyDB`.`holiday_leave`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `owas_monkeyDB`.`holiday_leave` (
  `holiday_leave_id` INT NOT NULL AUTO_INCREMENT,
  `startDate` DATE NULL,
  `endDate` DATE NULL,
  `days` VARCHAR(45) NULL,
  `note` TEXT(600) NULL,
  `type` VARCHAR(45) NULL,
  `employee_id` INT NOT NULL,
  `IsActive` TINYINT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`holiday_leave_id`),
  INDEX `fk_holiday_leave_employee1_idx` (`employee_id` ASC) VISIBLE,
  CONSTRAINT `fk_holiday_leave_employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `owas_monkeyDB`.`employee` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `owas_monkeyDB`.`attendance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `owas_monkeyDB`.`attendance` (
  `attendance_id` INT NOT NULL AUTO_INCREMENT,
  `inTime` TIME NULL,
  `outTime` TIME NULL,
  `hours` INT NULL,
  `employee_id` INT NOT NULL,
  `IsActive` TINYINT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`attendance_id`),
  INDEX `fk_attendance_employee1_idx` (`employee_id` ASC) VISIBLE,
  CONSTRAINT `fk_attendance_employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `owas_monkeyDB`.`employee` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `owas_monkeyDB`.`medical`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `owas_monkeyDB`.`medical` (
  `medical_id` INT NOT NULL AUTO_INCREMENT,
  `medicaName` VARCHAR(45) NULL,
  `Note` TEXT(600) NULL,
  `Date` DATE NULL,
  `employee_id` INT NOT NULL,
  `IsActive` TINYINT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`medical_id`),
  INDEX `fk_medical_employee_idx` (`employee_id` ASC) VISIBLE,
  CONSTRAINT `fk_medical_employee`
    FOREIGN KEY (`employee_id`)
    REFERENCES `owas_monkeyDB`.`employee` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `owas_monkeyDB`.`payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `owas_monkeyDB`.`payment` (
  `payment_id` INT NOT NULL AUTO_INCREMENT,
  `amount` DECIMAL NULL,
  `payment_type` VARCHAR(30) NULL,
  `total` DECIMAL NULL,
  `customer_id` INT NOT NULL,
  `order_id` INT NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_id`),
  INDEX `fk_payment_customer1_idx` (`customer_id` ASC) VISIBLE,
  INDEX `fk_payment_order1_idx` (`order_id` ASC) VISIBLE,
  CONSTRAINT `fk_payment_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `owas_monkeyDB`.`customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_payment_order1`
    FOREIGN KEY (`order_id`)
    REFERENCES `owas_monkeyDB`.`order` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `owas_monkeyDB`.`current_department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `owas_monkeyDB`.`current_department` (
  `current_department_id` INT NOT NULL AUTO_INCREMENT,
  `position` VARCHAR(35) NULL,
  `IsPermanent` TINYINT NULL,
  `employee_id` INT NOT NULL,
  `department_id` INT NOT NULL,
  `IsActive` TINYINT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`current_department_id`),
  INDEX `fk_current_department_employee1_idx` (`employee_id` ASC) VISIBLE,
  INDEX `fk_current_department_department1_idx` (`department_id` ASC) VISIBLE,
  CONSTRAINT `fk_current_department_employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `owas_monkeyDB`.`employee` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_current_department_department1`
    FOREIGN KEY (`department_id`)
    REFERENCES `owas_monkeyDB`.`department` (`department_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `owas_monkeyDB`.`emp_address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `owas_monkeyDB`.`emp_address` (
  `emp_address_id` INT NOT NULL AUTO_INCREMENT,
  `Address1` VARCHAR(45) NULL,
  `Address2` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `region` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `employee_id` INT NOT NULL,
  `IsActive` TINYINT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`emp_address_id`),
  INDEX `fk_emp_address_employee1_idx` (`employee_id` ASC) VISIBLE,
  CONSTRAINT `fk_emp_address_employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `owas_monkeyDB`.`employee` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `owas_monkeyDB`.`cust_address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `owas_monkeyDB`.`cust_address` (
  `cust_address_id` INT NOT NULL AUTO_INCREMENT,
  `Address1` VARCHAR(45) NULL,
  `Address2` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `region` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `customer_id` INT NOT NULL,
  `IsActive` TINYINT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cust_address_id`),
  INDEX `fk_cust_address_customer1_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_cust_address_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `owas_monkeyDB`.`customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `owas_monkeyDB`.`agent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `owas_monkeyDB`.`agent` (
  `agent_id` INT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(45) NULL,
  `lastName` VARCHAR(45) NULL,
  `phone` INT NULL,
  `fax` INT NULL,
  `email` VARCHAR(45) NULL,
  `notes` TEXT(600) NULL,
  `iban` VARCHAR(45) NULL,
  `IsActive` TINYINT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`agent_id`),
  UNIQUE INDEX `phone_UNIQUE` (`phone` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `owas_monkeyDB`.`agent_address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `owas_monkeyDB`.`agent_address` (
  `agent_address_id` INT NOT NULL AUTO_INCREMENT,
  `Address1` VARCHAR(45) NULL,
  `Address2` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `region` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `agent_id` INT NOT NULL,
  `IsActive` TINYINT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`agent_address_id`),
  INDEX `fk_agent_address_agent1_idx` (`agent_id` ASC) VISIBLE,
  CONSTRAINT `fk_agent_address_agent1`
    FOREIGN KEY (`agent_id`)
    REFERENCES `owas_monkeyDB`.`agent` (`agent_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `owas_monkeyDB`.`approval_agent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `owas_monkeyDB`.`approval_agent` (
  `approval_agent_id` INT NOT NULL,
  `employee_id` INT NOT NULL,
  `agent_id` INT NOT NULL,
  `isActive` TINYINT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`approval_agent_id`),
  INDEX `fk_approval_agent_employee1_idx` (`employee_id` ASC) VISIBLE,
  INDEX `fk_approval_agent_agent1_idx` (`agent_id` ASC) VISIBLE,
  CONSTRAINT `fk_approval_agent_employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `owas_monkeyDB`.`employee` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_approval_agent_agent1`
    FOREIGN KEY (`agent_id`)
    REFERENCES `owas_monkeyDB`.`agent` (`agent_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `owas_monkeyDB`.`delivery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `owas_monkeyDB`.`delivery` (
  `delivery_id` INT NOT NULL,
  `status` VARCHAR(12) NULL,
  `order_detail_delivery_id` INT NOT NULL,
  `agent_id` INT NOT NULL,
  `isActive` TINYINT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`delivery_id`),
  INDEX `fk_delivery_agent1_idx` (`agent_id` ASC) VISIBLE,
  INDEX `fk_delivery_order_detail_delivery1_idx` (`order_detail_delivery_id` ASC) VISIBLE,
  CONSTRAINT `fk_delivery_agent1`
    FOREIGN KEY (`agent_id`)
    REFERENCES `owas_monkeyDB`.`agent` (`agent_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_delivery_order_detail_delivery1`
    FOREIGN KEY (`order_detail_delivery_id`)
    REFERENCES `owas_monkeyDB`.`order_detail_delivery` (`order_detail_delivery_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `owas_monkeyDB`.`agent_payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `owas_monkeyDB`.`agent_payment` (
  `agent_payment_id` INT NOT NULL AUTO_INCREMENT,
  `amount` DECIMAL NULL,
  `federalTax` DECIMAL NULL,
  `month` VARCHAR(17) NULL,
  `year` INT NULL,
  `agent_id` INT NOT NULL,
  `totalDelivery` INT NULL,
  `IsActive` TINYINT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`agent_payment_id`),
  INDEX `fk_agent_payment_agent1_idx` (`agent_id` ASC) VISIBLE,
  CONSTRAINT `fk_agent_payment_agent1`
    FOREIGN KEY (`agent_id`)
    REFERENCES `owas_monkeyDB`.`agent` (`agent_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `owas_monkeyDB`.`agent_payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `owas_monkeyDB`.`agent_payment` (
  `agent_payment_id` INT NOT NULL AUTO_INCREMENT,
  `amont` DECIMAL NULL,
  `federalTax` DECIMAL NULL,
  `month` VARCHAR(17) NULL,
  `year` INT NULL,
  `agent_id` INT NOT NULL,
  `totalDelivery` INT NULL,
  `IsActive` TINYINT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`agent_payment_id`),
  INDEX `fk_agent_payment_agent1_idx` (`agent_id` ASC) VISIBLE,
  CONSTRAINT `fk_agent_payment_agent1`
    FOREIGN KEY (`agent_id`)
    REFERENCES `owas_monkeyDB`.`agent` (`agent_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `owas_monkeyDB`.`agent_payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `owas_monkeyDB`.`agent_payment` (
  `agent_payment_id` INT NOT NULL AUTO_INCREMENT,
  `amont` DECIMAL NULL,
  `federalTax` DECIMAL NULL,
  `month` VARCHAR(17) NULL,
  `year` INT NULL,
  `agent_id` INT NOT NULL,
  `totalDelivery` INT NULL,
  `IsActive` TINYINT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`agent_payment_id`),
  INDEX `fk_agent_payment_agent1_idx` (`agent_id` ASC) VISIBLE,
  CONSTRAINT `fk_agent_payment_agent1`
    FOREIGN KEY (`agent_id`)
    REFERENCES `owas_monkeyDB`.`agent` (`agent_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
