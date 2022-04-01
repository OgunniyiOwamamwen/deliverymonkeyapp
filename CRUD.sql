USE owas_monkeyDB;

-- Author: Ogunniyi Owamamwen
-- CRUD
-- the insert statement must be done by orderly because of stored procedure.
-- primary department
INSERT INTO `owas_monkeyDB`.`department`
(`department_id`,`deptName`,`note`,`IsActive`)VALUES(101,'Manager','The manager',1),
(102,'Meat','The meat is where you’ll find beef, chicken, and pork. You may also find some specialty meats like oxtail.',1),
(103,'Seafood','Where you’ll find, you guessed it, seafood! Fish, scallops, shrimp – everything that lives under the sea can be found in this department.',1),
(104,'Wine','Not all grocery stores sell wine, but the ones that do will also have a separate department for it.',1),
(105,'health and beauty department','The health and beauty department is where you’ll find shampoo, makeup, toothpaste and toothbrushes, and vitamins.',1),
(106,'Deli/Prepared Foods','The deli, just like the bakery or meat and seafood departments, will be located along the wall of the grocery store.',1),
(107,'Front End','This is where you will typically be able to find managers if you need help, a customer service desk, and of course, cashiers.',1),
(108,'Produce','The produce department is where you’ll find your fresh produce. If a store doesn’t have a separate floral department.',0),
(109,'Agent','The agent management',1);

-- The store-procedure combine three table because it reduce repeate filed like 'employee, istActive'.
DELIMITER $$
CREATE PROCEDURE `owas_monkeyDB`.`pro_employee` (IN p_employeeId INT,
												IN p_title VARCHAR(5),
                                                IN p_lname VARCHAR(45),
                                                IN p_fname VARCHAR(45),
                                                IN p_midname VARCHAR(45),
                                                IN p_dob DATE,
                                                IN p_email VARCHAR(45),
                                                IN p_taxCode VARCHAR(45),
                                                IN p_hpone INT,
                                                IN p_home_phone INT,
                                                IN p_current_dept_Id INT, -- current department
                                                IN p_dept_position VARCHAR(45),
                                                IN p_permanent TINYINT,
                                                IN p_departmentId INT,
                                                IN p_educationID INT, -- education
                                                IN p_cer_name VARCHAR(45),
                                                IN p_cer_note TEXT,
                                                IN p_isActive TINYINT
                                                ) 
BEGIN
INSERT INTO `owas_monkeyDB`.`employee`(`employee_id`,`titleOfCountesy`,`lastName`,`firstName`,`middleName`,`dateOfBirth`,`email`,`taxCode`,`phone`,`homePhone`,`IsActive`)
VALUES(p_employeeId,p_title,p_lname,p_fname,p_midname,p_dob,p_email,p_taxCode,p_hpone,p_home_phone,p_isActive);
INSERT INTO `owas_monkeyDB`.`current_department`(`current_department_id`,`position`,`IsPermanent`,`employee_id`,`department_id`,`IsActive`)
VALUES(p_current_dept_Id,p_dept_position,p_permanent,p_employeeId,p_departmentId,p_isActive);
INSERT INTO `owas_monkeyDB`.`education`(`education_id`,`name`,`notes`,`employee_id`,`IsActive`)
VALUES(p_educationID,p_cer_name,p_cer_note,p_employeeId,p_isActive);
END$$

-- INSERT DATA INTO EMPLOYEE by using PRO_EMPLOYEE
-- the courtesy titles “Mr.,” “Mrs.,” “Ms.,” “Dr.,”
-- It require twenty vaules to intsert into three tables because isActive and employee_id was repeated
-- `employee_id`,`titleOfCountesy`,`lastName`,`firstName`,`middleName`,`dateOfBirth`,`email`,`taxCode`,`phone`,`homePhone`,`current_department_id`,`position`,`IsPermanent`,`department_id`,`education_id`,`name`,`notes`
CALL pro_employee(301,'Ms','Tina','Luca','Sandy','1991-10-23','sand2@gmail.com','T91RTYHUJKIO2','32454565','05434567',201,'Senior',1,101,71,'Bsc management','Business management',1);
CALL pro_employee(302,'Mr','Owamamwen','Ogunniyi','Friday','1991-12-11','owas@hotmail.com','F91GTHJYUKIJ1','32454345','05456787',202,'Middle',1,103,72,'Certified Food Mananger (CFM)','Food management',1);
CALL pro_employee(303,'Mrs','Giogia','Tirado','Anna','1980-06-23','gioanna@outlook.com','B80HGHJKUYNG2','39455656','05256788',203,'Junior',1,102,73,'Certified Professional-Food Safety (CP-FS)','Food Safety',1);
CALL pro_employee(304,'Mr','Noah','Elijah','John','1975-08-15','noah4@gmail.com','W75ERFGTHYUJ1','33455678','053545678',204,'entry-level',1,105,74,'Food Safety Manager Certificate','Safety',0);
CALL pro_employee(305,'Dr','Henry','Alexander','Harper','1973-09-20','henry3@hotmail.com.com','G73HGHJKUJHG2','345656679','051587897',205,'Middle',1,109,75,'ServSafe Food Protection Certificate','Protection',1);

-- employee address
INSERT INTO `owas_monkeyDB`.`emp_address`
(`emp_address_id`,`Address1`,`Address2`,`city`,`region`,`country`,`employee_id`,`IsActive`)
VALUES(80,'118 Boulevard Saint-Germain',NULL,'Paris','Île-de-France','France',301,1),
      (81,'139 Boulevard brune',NULL,'Paris','Île-de-France','France',302,1),
       (82,'32 Avenue Spinoza',NULL,'Emereanvill','Île-de-France','France',303,1),
       (84,'58 Rue Parmentier',NULL,'Montreuil','Île-de-France','France',304,0),
       (85,'56 Villa de l`industrie',NULL,'Ouen','Île-de-France','France',305,1);
       
-- employee bank
INSERT INTO `owas_monkeyDB`.`bank`(`bank_id`,`IbanNunber`,`bankName`,`type`,`employee_id`,`IsActive`)
VALUES(51,'FR5635635636367325753H74646','Credit Agricole(CA)','Saving',301,1),
      (52,'FR6596837387388387386Y53673','BNP Pariba','Saving',302,1),
      (53,'FR5593857600795004630R56490','Crédit Mutuel','Saving',303,1),
      (54,'FR5550093859900049003M66464','La Banque Postale','LivretA',304,0),
      (55,'FR5800700388000359534D56465','BNP Paribas','Saving',304,1);

-- medical
INSERT INTO `owas_monkeyDB`.`medical`
(`medical_id`,`medicaName`,`Note`,`Date`,`employee_id`,`IsActive`)
VALUES(80,'Normal check up','The medical is for normal','2022-05-14',304,0),
      (81,'Normal check up','The medical is for normal','2022-05-14',301,1);

-- holiday leave
INSERT INTO `owas_monkeyDB`.`holiday_leave`
(`holiday_leave_id`,`startDate`,`endDate`,`days`,`note`,`type`,`employee_id`,`IsActive`)
VALUES(30,'2021-04-01','2021-04-30',29,'Grated bacause of sickness','Sick leave',301,0),
       (31,'2021-05-03','2021-05-31',28,'Grated bacause of sickness','Sick leave',302,0),
       (32,'2022-08-01','2022-08-31',30,'Normal august holiday','Holiday',303,1),
       (33,'2022-08-01','2022-08-31',30,'Normal august holiday','Holiday',305,1);

-- employees salary
INSERT INTO `owas_monkeyDB`.`salary`(`salary_id`,`hourPay`,`hours`,`basicSalary`,`loan`,
`bonus`,`cloth`,`stateTax`,`federalTax`,`netpay`,`month`,`year`,`employee_id`,`IsActive`)
VALUES(40,20,44,880,'No',0,0,300,100,36000,'January',2021,301,1),
      (41,20,44,880,'Yes',0,0,300,100,36000,'February',2021,302,1),
      (42,20,44,880,'No',0,0,300,100,36000,'March',2021,303,1),
      (43,20,44,880,'Yes',0,0,300,100,36000,'April',2021,304,0),
      (44,20,44,880,'No',0,0,300,100,36000,'January',2022,305,1);

-- loan
INSERT INTO `owas_monkeyDB`.`loan`
(`loan_id`,`loanAmount`,`loanType`,`notes`,`Date`,`employee_id`,`IsActive`)
VALUES(50,3000,'study','The loan for education','2021-02-6',302,1),
	  (51,4000,'study','The loan for education','2021-02-6',304,0);

-- loan return
INSERT INTO `owas_monkeyDB`.`loan_return`
(`loanReturn_id`,`returnAmount`,`paymentType`,`Notes`,`date`,`loan_id`,`IsActive`)
VALUES(70,4000,'Salary','The loan was return my salary','2021-04-16',51,0);

-- attendance
INSERT INTO `owas_monkeyDB`.`attendance`
(`attendance_id`,`inTime`,`outTime`,`hours`,`employee_id`,`IsActive`)
VALUES(20,'09:01:05','12:06:04',3,301,1),
      (21,'02:10:13','18:03:06',5,301,1),
      (22,'09:02:11','12:02:04',3,302,1),
      (23,'02:09:10','18:12:04',5,302,1),
      (24,'09:10:01','12:05:09',3,303,1),
      (25,'02:08:03','18:04:04',5,303,1),
      (26,'09:10:01','12:07:03',3,304,1),
      (27,'02:08:02','18:08:07',5,304,1),
      (28,'09:08:10','12:04:09',3,305,1),
      (29,'02:04:02','18:02:03',5,305,1);

-- for angents
DELIMITER $$
CREATE PROCEDURE `owas_monkeyDB`.`pro_agent` (IN p_agent_id int,
                                              IN p_fname VARCHAR(50),
                                              IN p_lname VARCHAR(50),
                                              IN p_phone INT,
                                              IN p_fax INT,
                                              IN p_email VARCHAR(50),
                                              IN p_notes VARCHAR(50),
                                              IN p_iban VARCHAR(50),
                                              IN p_address_id INT, -- address
                                              IN p_address1 VARCHAR(50),
                                              IN p_address2 VARCHAR(50),
                                              IN p_city VARCHAR(50),
                                              IN p_region VARCHAR(50),
                                              IN p_country VARCHAR(50),
                                              IN p_isActive TINYINT
                                                 )
BEGIN
INSERT INTO `owas_monkeyDB`.`agent`(`agent_id`,`firstName`,`lastName`,`phone`,`fax`,`email`,`notes`,`iban`,`IsActive`)
VALUES(p_agent_id,p_fname,p_lname,p_phone,p_fax,p_email,p_notes,p_iban,p_isActive);
INSERT INTO `owas_monkeyDB`.`agent_address`(`agent_address_id`,`Address1`,`Address2`,`city`,`region`,`country`,`agent_id`,`IsActive`)
VALUES(p_address_id,p_address1,p_address2,p_city,p_region,p_country,p_agent_id,p_isActive);
END$$

-- Insert into agent and address with stored procedure
CALL pro_agent(31, 'Ken', 'Rita',34343534,05343553,'reti23@gmail.com','agent','FR678700935678900047803M66434',80,'67 Boulevard Saint-Germain',NULL,'Paris','Île-de-France','France',1);
CALL pro_agent(32, 'Victory', 'Simon',34543511,053235678,'vitory34@gmail.com','agent','FR633300967678900043454M66887',81,'56 Rue Parmentier',NULL,'Paris','Île-de-France','France',0);

-- approval agent
INSERT INTO `owas_monkeyDB`.`approval_agent`(`approval_agent_id`,`employee_id`,`agent_id`,`isActive`)
VALUES(11,305,31,1),(12,305,32,0);

-- Customer
DELIMITER $$
CREATE PROCEDURE `owas_monkeyDB`.`pro_customer` (IN p_customer_id int,
                                              IN p_fname VARCHAR(50),
                                              IN p_lname VARCHAR(50),
                                              IN p_phone INT,
                                              IN p_fax INT,
                                              IN p_email VARCHAR(50),
                                              IN p_notes VARCHAR(50),
                                              IN p_employee_id INT,
                                              IN p_cust_address_id INT, -- address
                                              IN p_address1 VARCHAR(50),
                                              IN p_address2 VARCHAR(50),
                                              IN p_city VARCHAR(50),
                                              IN p_region VARCHAR(50),
                                              IN p_country VARCHAR(50),
                                              IN p_isActive TINYINT
                                                 )
BEGIN
INSERT INTO `owas_monkeyDB`.`customer`(`customer_id`,`firstName`,`lastName`,`phone`,`fax`,`email`,`notes`,`employee_id`,`IsActive`)
VALUES(p_customer_id,p_fname,p_lname,p_phone,p_fax,p_email,p_notes,p_employee_id,p_isActive);
INSERT INTO `owas_monkeyDB`.`cust_address`(`cust_address_id`,`Address1`,`Address2`,`city`,`region`,`country`,`customer_id`,`IsActive`)
VALUES(p_cust_address_id,p_address1,p_address2,p_city,p_region,p_country,p_customer_id,p_isActive);
END$$

-- Insert into customer and address with stored procedure
CALL pro_customer(85, 'Tina', 'Luca',34443632,053435689,'tina43@yahoo.com','customer',305,41,'95 Boulevard Saint-Germain',NULL,'Paris','Île-de-France','France',1);
CALL pro_customer(86, 'Tony', 'William',32243677,054335699,'tony60@yahoo.com','customer',305,42,'50 Avenue Spinoza',NULL,'Paris','Île-de-France','France',1);
CALL pro_customer(87, 'Smith', 'John',37644847,057897958,'john60@hotmail.com','customer',305,43,'49 Spinoza',NULL,'Paris','Île-de-France','France',0);

-- category
INSERT INTO `owas_monkeyDB`.`category`
(`category_id`,`categoryname`,`description`,`IsActive`)
VALUES(81,'Meat','food category',1),
	  (82,'Vegetable','food category',1),
	  (83,'seafood','food category',1),
	  (84,'Fruit','food category',1),
      (85,'Canned Goods','food category',1),
      (86,'Frozen Foods','food category',1),
      (87,'Fis and Shellfish','food category',1),
      (88,'Deli','food category',1);

-- product price
INSERT INTO `owas_monkeyDB`.`product_price`
(`product_price_id`,`unitPrice`,`disCounted`,`IsActive`)
VALUES(700, 20,0,1),(701, 30,0,1),(702, 22,0,1),(703, 12,0,1),(704, 8,0,1),(705, 4,0,1),(706, 6,0,1);

-- product
INSERT INTO `owas_monkeyDB`.`product`
(`product_id`,`productName`,`desProduct`,`unitInStock`,`category_id`,`product_price_id`,`IsActive`)
VALUES(90,'Banans','fruit',500,84,704,1),
      (91,'Apples','fruit',400,84,704,1),
      (93,'Grapes','fruit',500,84,704,1),
      (94,'Oranges','fruit',300,84,704,1),
      (95,'Potatoes','vegetable',300,82,703,1),
      (96,'Fish','Frozen foods',600,86,701,1),
      (97,'Onions','vegetable',2100,82,706,1),
      (98,'Broccoli','vegetable',3000,82,705,1),
      (99,'Olives','Canned good',2000,85,706,1),
      (100,'Soup','Canned good',700,85,706,1),
      (101,'Tuna','Canned good',2000,85,705,1),
      (102,'Veggies','Canned good',1000,86,705,1),
      (103,'Chicken','Meat',800,81,700,1),
      (104,'Beef','Meat',400,81,700,1),
      (105,'Pork','Meat',800,81,700,1);
      
-- customer with id:86 orders
INSERT INTO `owas_monkeyDB`.`order`
(`order_id`,`customer_id`,`product_id`,`quantity`)
VALUES(413,86,90,6),(414,86,93,4),(415,85,96,3),(416,85,98,4);

-- payment
-- customer with id:86 payment for orders
INSERT INTO `owas_monkeyDB`.`payment`
(`payment_id`,`amount`,`payment_type`,`total`,`customer_id`,`order_id`)
VALUES(330,8,'card',48,86,413),
      (331,8,'card',32,86,414),
      (332,30,'card',90,86,415),
      (333,4,'card',16,86,416);
      
-- order_details
-- the details order by customer
INSERT INTO `owas_monkeyDB`.`order_details`
(`order_detail_id`,`order_id`,`status`,`IsActive`)
VALUES(880,413,'pending',1),
      (881,414,'pending',1),
      (882,415,'pending',1),
      (883,416,'pending',1);

-- order_detail_delivery in progress
INSERT INTO `owas_monkeyDB`.`order_detail_delivery`
(`order_detail_delivery_id`,`order_detail_id`)
VALUES(480,880),(481,881),(482,882),(483,883);

-- delivery
-- successful delivery to customer
INSERT INTO `owas_monkeyDB`.`delivery`
(`delivery_id`,`status`,`order_detail_delivery_id`,`agent_id`,`isActive`)
VALUES(55,'delivered',480,31,1),
	  (56,'delivered',481,31,1),
      (57,'delivered',482,31,1),
      (58,'delivered',483,31,1);

-- agent payment
INSERT INTO `owas_monkeyDB`.`agent_payment`
(`agent_payment_id`,`amount`,`federalTax`,`month`,`year`,`agent_id`,`totalDelivery`,`IsActive`)
VALUES(69,25,5,'august',2021,31,1,1);
