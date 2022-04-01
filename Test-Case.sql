USE owas_monkeyDB;

-- Author: Ogunniyi Owamamwen

-- primary department
SELECT * FROM department;

-- employee
SELECT * FROM employee; 
SELECT * FROM current_department;
SELECT * FROM education;

-- employee address  
SELECT * FROM emp_address;

-- employee bank
SELECT * FROM bank;

-- medical
SELECT * FROM medical;

-- holiday leave
SELECT * FROM holiday_leave;

-- employees salary
SELECT * FROM salary;

-- loan
SELECT * FROM loan;

-- loan return
SELECT * FROM loan_return;

-- attendance
SELECT * FROM attendance;

-- for angents
SELECT * FROM agent;
SELECT * FROM agent_address;

-- approval agent
SELECT * FROM approval_agent;

-- Customer
SELECT * FROM customer;
SELECT * FROM cust_address;

-- category
SELECT * FROM category;

-- product price
SELECT * FROM product_price;

-- product 
SELECT * FROM product;

-- customer orders
SELECT * FROM `owas_monkeyDB`.`order`;

-- customer payment
SELECT * FROM payment;

-- the details order by customer
SELECT * FROM order_details;

-- order_detail_delivery in progress
SELECT * FROM order_detail_delivery;

-- delivery
-- successful delivery to customer
SELECT * FROM delivery;

-- agent payment
SELECT * FROM agent_payment;


 -- Employees with concat
SELECT CONCAT(a.titleOfcountesy,',   ', a.lastName,'   ',a.firstName) AS 'Employees'
 FROM employee AS a;
 
SELECT * FROM employee;
SELECT * FROM department;
SELECT * FROM current_department;

-- Employee with thier department
SELECT CONCAT(a.titleOfcountesy,',   ', a.lastName,'   ',a.firstName) AS 'Employees', b.position, d.deptName, d.note
 FROM employee AS a
 JOIN current_department AS b
 ON a.employee_id = b.employee_id
 JOIN department AS d
 ON b.department_id = d.department_id;
 
-- Employee approval agent
SELECT CONCAT(a.titleOfcountesy,',   ', a.lastName,'   ',a.firstName) AS 'Employee approval', CONCAT(c.firstName,'   ',c.lastName) AS 'Agent'
FROM employee AS a
INNER JOIN approval_agent AS b
ON a.employee_id = b.employee_id
INNER JOIN agent AS c
ON b.agent_id = c.agent_id;

-- Product with price per unit
SELECT a.productName, b.unitPrice, a.unitInStock
FROM product AS a
JOIN product_price AS b
ON a.product_price_id = b.product_price_id;

-- Product, price, stock and category you can filter by categoryname
SELECT d.categoryname, a.productName, b.unitPrice, a.unitInStock
FROM product AS a
JOIN product_price AS b
ON a.product_price_id = b.product_price_id
LEFT JOIN category AS d
ON a.category_id = d.category_id
-- WHERE d.categoryname = 'Fruit'
;



