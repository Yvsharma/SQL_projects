
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

-- GROUP BY clause is used in a SELECT statement to group the results by one or more columns.

SELECT region, count(customer_id) AS customer_count
FROM customer 
GROUP BY region;

SELECT product_id,sum(quantity) AS quantity_sold 
FROM sales 
GROUP BY product_id 
ORDER BY quantity_sold DESC;

SELECT customer_id,
MIN(sales) AS min_sales,
MAX(sales) AS max_sales, 
AVG(sales) AS Average_sales, 
SUM(sales) AS Total_sales
FROM sales 
GROUP BY customer_id
ORDER BY total_sales DESC 
LIMIT 5;

-- -------------------------------------------------------------------------------------------------------------------------

/*HAVING clause is used in combination with the GROUP BY clause to restrict the groups of returned rows to only those 
whose the condition is TRUE */

SELECT region,count(customer_id) AS customer_count
FROM customer
GROUP BY region 
HAVING count(customer_id) > 200 ;

-- -------------------------------------------------------------------------------------------------------------------------
-- Exercise :- 4

-- Q1. Make a dashboard showing the following figures for each product ID
-- a) Total sales (in $) order by this column in descending
-- b) Total sales quantity
-- c) Number of orders
-- d) Max Sales value
-- e) Min Sales value
-- f) Average sales value
select product_id ,sum(sales) as SALES ,sum(quantity) as Quantity ,count(order_id) as "No. of order"
,max(sales) as "Highest value order",min(sales) as "Highest value order" ,avg(sales) as "Average value order"
 from sales
group by product_id;

-- Q2. Get the list of product ID’s where the quantity of product sold is greater than 10

select product_id, sum(quantity) as "Total quantity" from sales
group by product_id
having Sum(quantity)>10;

-- -------------------------------------------------------------------------------------------------------------------------
-- The CASE expression is a conditional expression , similar to if/else statements

select * , CASE
when age<30 then "Young" -- on the basis of this condition it follows and revert this
when age>60 then "Senior Citizen" -- on the basis of this condition it follows and revert this
Else 'Middle aged'  -- on the basis of this condition it follows and revert this
end as Age_category  -- this will create new column
from customer;

select * from customer;

-- -------------------------------------------------------------------------------------------------------------------------
-- how to create a new table from a old table

-- createing sales table of year 2015
 create table sales_2015 as 
 select * from sales 
 where ship_date between "2015-01-01" and "2015-12-31";
 
 select count(*) from sales_2015;
 
 select count(distinct(customer_id)) from sales_2015;
 
 -- customer with age between 20 and 60
 
create table Customer_20_60 as 
select *  from customer
where age between 20 and 60;
 
 select count(*) from customer_20_60;
 
 select count(distinct(customer_id)) from customer_20_60;
 
 -- -------------------------------------------------------------------------------------------------------------------------
-- JOIN in MySQL

/* NNER JOIN compares each row of table1 with each row of table2 to find all pairs of rows 
which satisfy the join-predicate. 
When satisfied, column values for each matched pair of rows of A and B are combined into a result row. */

SELECT
a.order_line ,
a.product_id,
a.customer_id,
a.sales,
b.customer_name,
b.age
FROM sales_2015 AS a 
INNER JOIN customer_20_60 AS b 
ON a.customer_id = b.customer_id
ORDER BY customer_id;

/* The LEFT JOIN returns all rows from the left table, even if there are no matches in the right table. */

SELECT
a.order_line ,
a.product_id,
a.customer_id,
a.sales,
b.customer_name,
b.age
FROM sales_2015 AS a 
LEFT JOIN customer_20_60 AS b 
ON a.customer_id = b.customer_id
ORDER BY customer_id;

-- The RIGHT JOIN returns all rows from the right table, even if there are no matches in the left table.

SELECT
a.order_line ,
a.product_id,
a.customer_id,
a.sales,
b.customer_name,
b.age
FROM sales_2015 AS a 
RIGHT JOIN customer_20_60 AS b 
ON a.customer_id = b.customer_id
ORDER BY customer_id;

-- The FULL JOIN combines the results of both left and right outer joins
/*
SELECT
a.order_line ,
a.product_id,
a.customer_id,
a.sales,
b.customer_name,
b.age,
b.customer_id
FROM sales_2015 AS a 
full join customer_20_60 AS b 
ON a.customer_id = b.customer_id
ORDER BY a.customer_id , b.customer_id;
*/
-- in MySQL Full join is not applicable and for doind full join we can use Union .
 
-- The Cross Join creates a cartesian product between two sets of data.
-- creating new tables
create table moth_value (MM integer);
create table year_value (YYYY integer);

rename table moth_value to month_value;

-- inserting values in both the table
insert into month_value value
(1),(2),(3),(4),
(5),(6),(7),(8),
(9),(10),(11),(12);

insert into year_value value
(2011),(2012),(2013),(2014),
(2015),(2016),(2017),(2018),
(2019),(2020);

select * from month_value;
select * from year_value;



SELECT a.YYYY, b.MM
FROM year_value AS a, month_value AS b
ORDER BY a.YYYY, b.MM;

 -- -------------------------------------------------------------------------------------------------------------------------
/* EXCEPT operator is used to return all rows in the first SELECT statement that are not returned by the second SELECT 
statement. */

SELECT customer_id
FROM sales_2015 
EXCEPT
SELECT customer_id
FROM customer_20_60
ORDER BY customer_id;

/* UNION operator is used to combine the result sets of 2 or more SELECT statements. It removes duplicate rows between 
the various SELECT statements. */

SELECT customer_id
FROM sales_2015 
UNION
SELECT customer_id
FROM customer_20_60
ORDER BY customer_id;

-- count
select count(customer_id) from sales_2015;
select count(customer_id) from customer_20_60;

SELECT count(customer_id
)FROM sales_2015 
UNION
SELECT count(customer_id)
FROM customer_20_60;

SELECT customer_id
FROM sales_2015 
UNION all
SELECT customer_id
FROM customer_20_60
ORDER BY customer_id;

create table total_customer 
SELECT customer_id
FROM sales_2015 
UNION all
SELECT customer_id
FROM customer_20_60
ORDER BY customer_id;

create table union_all_table 
SELECT count(customer_id
)FROM sales_2015 
UNION all
SELECT count(customer_id)
FROM customer_20_60;

create table union_all_table2 
SELECT customer_id
FROM sales_2015 
UNION all
SELECT customer_id
FROM customer_20_60;

select count(*) from total_customer;
select count(*) from union_all_table2;  -- that shows union and union all are same

-- Intersect operator is used to find the common rows from the results of two Select queries

SELECT customer_id from sales_2015
intersect
select customer_id from customer_20_60

-- --------------------------------------------------------------------------------------------------------------------------------

-- Exercise :- 5

-- 1. Find the total sales done in every state for customer_20_60 and sales_2015 table
-- Hint: Use Joins and Group By command
select * from customer_20_60;
select * from sales_2015;

select c.customer_id,s.sales,c.region from sales as s
inner join  customer_id as c on c.customer_id=s.csutomer_id




-- 2. Get data containing Product_id, product name, category, total sales 
-- value of that product and total quantity sold. (Use sales and product table)