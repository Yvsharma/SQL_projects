
/* Multiline comment
create database udemy
use udemy
select * from customer;
select * from product;
select * from sales;
*/
-- -----------------------------------------------------------------------------------------------------------------------------
-- to check data type of columns in a table
select column_name,Data_type from INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'customer';
select column_name,Data_type from INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'product';
select column_name,Data_type from INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'sales';

-- -----------------------------------------------------------------------------------------------------------------------------

-- to change column name
alter table sales
change `Ship Date`  Ship_date date;
alter table sales
change `Order Line` Order_line int;
alter table sales
change `Order ID`  Order_ID varchar(30);
alter table sales
change `Order Date`  Order_date date;
alter table sales
change `Ship Mode` Ship_mode varchar(200);
alter table sales
change `Customer ID` Customer_id varchar(200);
alter table sales
change `Product ID` Product_id varchar(200);

alter table customer
change `Customer ID` Customer_id varchar(200);
alter table customer
change `Customer Name` Customer_name varchar(200);

alter table product
change `Product ID` Product_id varchar(200);
alter table product
change `Sub-Category` Sub_category varchar(200);
alter table product
change `Product Name` Product_name varchar(200);

-- -----------------------------------------------------------------------------------------------------------------------------

-- IN condition is used to help reduce the need to use multiple OR conditions in a SELECT, INSERT, UPDATE, or DELETE 
-- statement.

SELECT *
FROM customer
WHERE city IN ('Philadelphia', 'Seattle');

-- OR

SELECT *
FROM customer
WHERE city = 'Philadelphia' OR city = 'Seattle';

-- -----------------------------------------------------------------------------------------------------------------------------

-- The BETWEEN condition is used to retrieve values within a range in a SELECT, INSERT, UPDATE, or DELETE statement.

SELECT * FROM customer
WHERE age BETWEEN 20 AND 30;

-- Which is same as
SELECT * FROM customer
WHERE age>= 20 AND age<= 30;

SELECT * FROM customer
WHERE age NOT BETWEEN 20 and 30;

SELECT * FROM sales
WHERE ship_date BETWEEN '2015-04-01' AND '2016-04-01';

-- -----------------------------------------------------------------------------------------------------------------------------

-- The MySQL "LIKE" condition allows you to perform pattern matching using Wildcards.
--  % Allows you to match any string of any length (including zero length)
--  _ Allows you to match on a single character

SELECT * FROM customer
WHERE customer_name LIKE 'Jo%';

SELECT * FROM customer
WHERE customer_name LIKE '%od%';

SELECT * FROM customer
WHERE customer_name LIKE '____ %';

SELECT customer_name FROM customer
WHERE customer_name LIKE 'Jas_n';
 
SELECT customer_name FROM customer
WHERE customer_name NOT LIKE 'J%';

SELECT * FROM customer
WHERE customer_name LIKE 'G\%';


-- ---------------------------------------------------------------------------------------------------------------------------------
-- Exercise - 1 
-- Q1) Get the list of all cities where the region is South or east without any 
-- duplicates using IN statement

SELECT DISTINCT City FROM customer
WHERE Region IN ('South','East');

-- Q2) Get the list of all orders where the ‘sales’ value is between 100 and 
-- 500 using the BETWEEN operator

SELECT * FROM SALES
WHERE sales between 100 AND 500;

-- Q3) Get the list of customers whose last name contains only 4 characters 
-- using LIKE

SELECT * FROM customer
WHERE customer_name LIKE '____ %';

-- -------------------------------------------------------------------------------------------------------------------------

-- The ORDER BY clause is used to sort the records in result set. It can only be used in SELECT statements.

SELECT * FROM customer
WHERE state = 'California' 
ORDER BY Customer_name;

-- Same as

SELECT * FROM customer
WHERE state = 'California' 
ORDER BY Customer_name ASC;

SELECT * FROM customer
ORDER BY 2 DESC;  -- here 2 means column no. 2 of that selected table

SELECT * FROM customer
WHERE age>25 
ORDER BY City ASC, Customer_name DESC;

SELECT * FROM customer
ORDER BY age;

-- -------------------------------------------------------------------------------------------------------------------------
-- LIMIT statement is used to limit the number of records returned based on a limit value.

SELECT * FROM customer
WHERE age >= 25
ORDER BY age DESC
LIMIT 8;

SELECT * FROM customer
WHERE age >=25
ORDER BY age ASC
LIMIT 10;
 
 -- here we can also use "OFFSET" if you want to skip somelines
 SELECT * FROM customer
WHERE age >= 25
ORDER BY age DESC
LIMIT 8 OFFSET 2;
 
-- -------------------------------------------------------------------------------------------------------------------------
-- Exercise 2

-- Q1. Retrieve all orders where ‘discount’ value is greater than zero ordered 
-- in descending order basis ‘discount’ value
select * from sales
where Discount > 0
order by Discount DESC;

-- Q2. Limit the number of results in above query to top 10
select * from sales
where Discount > 0
order by Discount DESC
limit 10;

-- -------------------------------------------------------------------------------------------------------------------------

/* The keyword AS is used to assign an alias to the column or a table. It is inserted between the column name and the 
column alias or between the table name and the table alias. */

SELECT Customer_id AS "Serial number", Customer_name as name, Age as "Customer age" FROM Customer ;

-- -------------------------------------------------------------------------------------------------------------------------
-- Count function returns the count of an expression

SELECT COUNT(*) FROM sales;

SELECT count( DISTINCT order_id) AS "Number of Orders" , COUNT(order_line) as "Number of Products Ordered"
FROM sales WHERE customer_id = 'CG-12520';

-- -------------------------------------------------------------------------------------------------------------------------

-- AGGRIGATE FUNCTIONS

-- Sum function returns the summed value of an expression

SELECT sum(Profit) AS "Total Profit"
FROM sales;

SELECT round(sum(Profit), 2) AS "Total Profit"
FROM sales;
-- Round is used to make round figure and no. "2" means upto that decimal place

SELECT sum(quantity) AS "Total Quantity"
FROM sales 
where product_id = 'FUR-TA-10000577';

-- AVG function returns the average value of an expression.

SELECT avg(age) AS "Average Customer Age"
FROM customer;

SELECT avg(sales * 0.10) AS "Average Commission Value"
FROM sales;

-- MIN/MAX function returns the minimum/maximum value of an expression

SELECT MIN(sales) AS Min_sales_June15 
FROM sales 
WHERE order_date BETWEEN '2015-06-01' AND '2015-06-30';

SELECT MAX(sales) AS Min_sales_June15 
FROM sales 
WHERE order_date BETWEEN '2015-06-01' AND '2015-06-30';

-- -------------------------------------------------------------------------------------------------------------------------
-- Exercise 3

-- Q1. Find the sum of all ‘sales’ values.
select sum(sales) from sales;

-- Q2. Find count of the number of customers in north region with age 
-- between 20 and 30
select count(customer_name) as "WEST region customer count" from customer 
where region = 'WEST'
and age between 20 and 30;

-- Q3. Find the average age of East region customers
select avg(age) as "Avg age of EAST customers" from customer
where region = 'East';

-- Q4. Find the Minimum and Maximum aged customer from Philadelphia
select min(age) as "Minimum age", max(age) as "Maximum age" from customer
where city = 'Philadelphia';

-- Q5. Find count of the number of customers with age between 20 and 30
select count(customer_name) as "customer count" from customer 
where age between 20 and 30;

-- -------------------------------------------------------------------------------------------------------------------------

