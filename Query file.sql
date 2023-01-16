-- for creating database
-- create database Demo;

-- for starting .
-- use demo;

-- create table students is the table name , remaning are column name, datatype is written near column name
create table student(
Roll_no int,
Name varchar(30),
Class int,
DOB date );  -- Formate must be Year-Month-Day

-- to view complete table
select * from student;

-- inserting data
insert student value (
1,"Yashvardhan sharma",12,"1980-03-14"
);

insert student value (
1,"Yashvardhan sharma",12,"14-03-1980"
);

-- multiple data inserting
insert student values
(2,"Kapil",11,"1988-05-14"),
(3,"Shyam",12,"1984-12-18"),
(4,"Ajay",10,"1982-03-16"),
(5,"Om",18,"1986-04-15"),
(6,"Sourabh",6,"1985-09-11"),
(7,"Kamal",11,"1985-10-24");

-- to view complete table
select * from student;

select name,Class from student;

insert student values
(7,"Kapil",10,"1988-05-14");

insert student values
(null,"Kapil",10,"1988-05-14");

--  use of DISTINCT
-- to see only unique data no duplicates allowed
select distinct (Name)  from student;

select distinct Name,DOB from student;

-- use of where

select * from student
where class= 12;

select * from student
where Name= "Kapil";

select Name,DOB,Class from student
where Name="Kapil";

select * from student
where class>10;


-- use of AND OR
-- AND :- it has to setisfy all the conditions
-- OR :- Any of the situation

 select * from student
 where name = "Kapil" and class = 11;
 
 select * from student
 where name = "Kapil" or class = 11;

 select * from student
 where name = "Kapil" and class = 12;
 
  select * from student
 where name = "Kapil" or class = 12;
 
 -- use of not
 
 select * from student
where not Name= "Kapil";

select * from student
where Name= "Kapil" and not class=10;

select * from student
where class>10 and class < 8;

select * from student
where class>10 or class < 8;

SELECT COUNT(*) FROM SALES;
SELECT * FROM SALES;

SELECT COUNT(DISCOUNT)FROM SALES
WHERE NOT DISCOUNT = 0;

SELECT * FROM SALES;

-- Q-  FIND ORDER ID WHOSE SHIP MODE IS SECOND CLASS?
ALTER table sales
RENAME COLUMN custoer_id TO customer_id;
RENAME COLUMN `Order Date` TO order_date,
RENAME COLUMN `Ship Date` TO ship_date,
RENAME COLUMN `Ship Mode` TO ship_mode,
RENAME COLUMN `Customer ID` TO custoer_id,
RENAME COLUMN `Product ID` TO product_id;

select order_id from sales
where ship_mode= "Second class";

-- order by and group by

-- order by 
select * from sales
order by order_id;  -- asending order

-- same way
select * from sales
order by order_id ASC;

select * from sales
order by order_id DESC; -- DEC = decendingg order

-- group by 
select * from sales
group by ship_mode;

select count(*), ship_mode from sales
group by ship_mode
order by count(*) DESC;

-- Alias is defined as AS
select ship_mode as "Ship mode", count(*) as Total from sales
group by ship_mode;

-- limit

select count(*), ship_mode from sales
group by ship_mode
order by count(*) DESC
limit 2;

-- offset
select count(*), ship_mode from sales
group by ship_mode
order by count(*) DESC
limit 1 offset 3;

-- aggrigate function
select * from sales;

select sum(Quantity) as "Total quantity" from sales;

-- Q find sum of quantity according to ship mode?
select sum(Quantity) as "Total quantity" , ship_mode from sales
group by ship_mode;


-- use of  like 
select * from sales;
 
 select customer_id, order_date from sales
where customer_id = "CG-12520";

 select customer_id from sales
where customer_id like "CG%"  -- CG% customer id starts with CG
order by customer_id;

 select customer_id from sales
where customer_id like "%40"  -- %40 customer id ends with 40
order by customer_id;

 select customer_id from sales
where customer_id like "CG%40"; -- CG%40 custermer id starts with CG and ends with 40

-- use of in
select * from sales
where customer_id in ('BH-11710',"CG-12520");

-- max , min
select max(sales) from sales;
select min(sales) from sales;

-- join and subquery

-- inner join (common values)
select * from product;
select * from sales;

ALTER table product
RENAME COLUMN `Product ID` TO product_id,
RENAME COLUMN `Sub-Category` TO sub_category,
RENAME COLUMN `Product Name`  TO product_name;

select product.product_id,product.Product_Name,sales.ship_mode ,sales.order_id from product
inner join sales on product.product_id=sales.product_id;

