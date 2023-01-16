create table sales(
InvoiceNo varchar (30),
CarId varchar (30),
CustId varchar (30),
SaleDate date,
PaymentMode varchar (30),
EmpID varchar (30),
SalePrice int,
Commission int);


insert sales value
('I00001','D001','C0001','2019-01-24','Credit Card','E004',613247.00,73589.64),
('I00002','S001','C0002','2018-12-12','Online','E001',590321.00,70838.52),
('I00003','S002','C0004','2019-01-25','Cheque','E010',604000.00,72480.00),
('I00004','D002','C0001','2018-10-15','Bank Finance','E007',659982.00,79197.84),
('I00005','E001','C0003','2018-12-20','Credit Card','E002',369310.00,44317.20),
('I00006','S002','C0002','2019-01-30','Bank Finance','E007',620214.00,74425.68);

select * from sales;

-- find the answers for below questions
-- Q1. Display the number of cars purchased by each customer from the SALES table.
select custid as "Customer ID",count(carID) as "No. of car" from sales
group by custid;

-- Q2. Display the customer Id and number of cars purchased if the customer purchased more than 1 car from SALES table
select custid as "Customer ID",count(carID) as "No. of car" from sales
group by custid
having count(carid)>1;

-- Q3. Display the number of people in each category of payment mode from the table SALES
select count(custID) as "No. of payments",paymentmode from sales
group by paymentmode;

-- Q4. Display the PaymentMode and number of payments made using that mode more than once.
select count(custID) as "No. of payments",paymentmode from sales
group by paymentmode
having count(custID)>1 ;


