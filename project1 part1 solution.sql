create table Employee(
EmpNo int,
Ename varchar(30),
Salary int ,
Bonus int,
DeptId varchar(30));
-- To delet complete table from data base
-- drop table Employee;

-- to insert data in the table
insert Employee values
(102,'Kritika',60000,123,'D01'),
(110,'Tanya',50000,467,'D05'),
(106,'Sanya',48000,695,'D02'),
 (103,'Shabbir',45000,566,'D01'),
 (109,'Daribha',42000,NULL,'D04'),
 (105,'Joseph',34000,875,'D03'),
(108,'Nachaobi',29000,NULL,'D05'),
 (104,'Gurpreet',19000,565,'D04'),
 (107,'Vergese',15000,NULL,'D01'),
 (101,'Aaliya',10000,234,'D02');
 
 
 -- to see the complete table
 select * from employee;
 
-- find the answers for below questions
-- Q1. Find all those employees who have not been given a bonus.
select * from employee
where not bonus="null";

-- Q2. Display details of all those employees whose name starts with 'K'
select * from employee
where Ename like 'K%';

-- Q3 Display details of all those employees whose name ends with 'a'
select * from employee
where Ename like '%a';

-- Q4. Display details of all those employees whose names consist of exactly 5 letters 
-- and starts with any letter but has ‘ANYA’ after that.
select * from employee
where Ename like '_____' or '%anya';

-- Q5. Display names of all the employees containing 'se' as a substring in name
 select * from employee
where Ename like '%se%';

-- Q6. Display names of all employees containing 'a' as the second character
 select * from employee
where Ename like '_a%';

