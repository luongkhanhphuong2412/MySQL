USE company;  /*How to select a data in a column or a row (Filtering Rows)*/
DESCRIBE employee;
SELECT * FROM employee;
SELECT * FROM employee where Education= "Bachelors";
SELECT * FROM employee where PaymentTier>2 and Age>30;
SELECT * FROM employee where City= "Pune";
SELECT DISTINCT Gender FROM employee;
SELECT * FROM employee where (ExperienceInCurrentDomain and LeaveOrNot) is null;
SELECT * FROM employee where Age= NULL;
INSERT INTO employee VALUES ("Bachelors","2023", "Vietnam", "60", "38", "Female", "No", "0", "1");
SELECT * FROM employee where City= "Vietnam";
SELECT COUNT(DISTINCT City) FROM employee;
SELECT COUNT(DISTINCT Age) FROM employee;
SELECT * FROM employee WHERE City="Pune" or City= "New Delhi"; /*sql AND OR NOT*/
SELECT * FROM employee ORDER BY Age, Gender, City ASC;
SELECT * FROM employee ORDER BY Age ASC, City DESC;
SELECT * FROM employee where NOT Education= "Bachelors";
/* BETWEEN AND IN OPERATORS*/
SELECT * FROM employee where Age BETWEEN 30 AND 40;
SELECT * FROM employee where Age NOT BETWEEN 30 AND 40;
SELECT * FROM employee where Age IN(25,27,60); /* Instead of using OR also have NOT IN*/
SELECT * FROM employee WHERE Age BETWEEN 20 AND 30 AND ExperienceInCurrentDomain NOT IN (2,3);
/* UPDATE AND DELETE*/
SET SQL_SAFE_UPDATES=0;
UPDATE employee
SET ExperienceInCurrentDomain = 0
WHERE City = "Bangalore";  /* Fix loi tren SQL Workbench*/
DELETE FROM employee WHERE City= "Bangalore";
/*LIMIT*/
SELECT * FROM employee
WHERE PaymentTier= 2
limit 5;
SELECT * FROM employee
limit 5 offset 5;
/* MIN AND MAX*/
SELECT MIN(PaymentTier) AS SMALLESTPaymentTier
FROM employee;
SELECT MAX(Age) as Highest_Age
from employee;
/* COUNT, AVG, SUM*/
SELECT COUNT(JOININGYEAR) FROM employee;
SELECT AVG (Age) FROM employee;
SELECT SUM(PaymentTier) FROM employee;
SELECT COUNT(*) FROM employee; 
/* LIKE*/
SELECT * FROM employee WHERE City LIKE "P%";
SELECT * FROM employee WHERE City LIKE "%i";
SELECT * FROM employee where Gender NOT LIKE "_e%"; /* %-> many characters, _-> single character*/
/* DDL Commands(Data Definition Language)
1. Create
2. Alter
3. Drop
4. Truncate
5. Rename*/

CREATE TABLE STUDENTS(S_ID INT(4), SNAME VARCHAR(15));
DESCRIBE STUDENTS;
INSERT INTO STUDENTS VALUE(22070782, "Phuong");
INSERT INTO STUDENTS VALUE(22070783, "An");
INSERT INTO STUDENTS VALUE(22070789, "Thinh");
COMMIT; /* made changes into the database*/
SELECT * FROM STUDENTS;
/* Add new column*/
ALTER  TABLE STUDENTS ADD(GRADE VARCHAR(4));
ALTER TABLE STUDENTS DROP COLUMN GRADE;  /* Drop a column*/
ALTER TABLE STUDENTS MODIFY COLUMN SNAME VARCHAR(30); /*CHANGE THE DATA TYPE*/
ALTER TABLE STUDENTS RENAME COLUMN SNAME TO NAME_OF_STUDENTS; /* CHANGE THE COLUMN NAME*/
/* 3. DROP: completely delete data
4. Truncate: Table present but the data deleted
5. DELETE: remove all the table structure*/
Use hospital;
SET autocommit=0; /* get back the data*/
DELETE FROM hopital_list;
COMMIT; /* commit the changes, cannot changes back after that*/
ROLLBACK;
SELECT * FROM hopital_list;
TRUNCATE TABLE hopital_list;
DROP TABLE hopital_list; /* The table doesn't exist*/

USE school; 
RENAME TABLE student_information TO student_in4;
/* Built-in Functions in MySQL: 
1. Strings function- operate on string data types
2. Numeric functions- operate on numeric data types
3. Date functions- operate on date data types
4. Aggregate functions- operate on all of the data types and produce summarized result sets. */

/* String functions: Upper, lower, length, trim, NSTR*/

SELECT UPPER(City) from employee; -- Converts into upper case letters
Select LOWER(City) from employee; -- Converts into lower case letters
Select LENGTH('WELCOME'); -- Return the length of string
SELECT LENGTH(City) from employee;

-- Print Names of employees whose name has 4 characters

SELECT City from employee where LENGTH(City)=4;
SELECT TRIM('z' from "zzoraclezzz"); -- Removes the specified characters from both sides. 
SELECT INSTR("WELCOME", "E"); -- Returns te position of the character within a string
SELECT SUBSTR("WELCOME", 2,3); -- 2 number starts to count, 3- the quantity of number, start in E, 3 letters from that ELC
SELECT SUBSTRING("WELCOME", 4,2);
SELECT SUBSTRING(City, 2,3) from employee;
-- CONCAT: 
SELECT CONCAT("AMERICA", "AUSTRALIA"); -- CONNECT 2 WORDS
SELECT * FROM employee;
SELECT CONCAT(Education, JoiningYear) Graduation from employee; -- combine 2 columns information
/* Numeric Functions: ABS, SORT, MOD, power, truncate
Truncate() function truncates a number to the specified number of decimal places*/
SELECT ABS(-40);
SELECT ABS(40);

SELECT SQRT(25);
SELECT MOD(10,3);
SELECT power(2,5);

-- TRUNCATE FUNCTION: 
SELECT TRUNCATE(40.1234, 3); -- 3 VALUES AFTER THE DECIMAL
SELECT TRUNCATE(6876, -1); -- THE LAST DIGIT WILL CONVERT TO 0 
SELECT TRUNCATE(6876, -2); -- THE LAST TWO DIGIT WILL BECOME ZERO 

-- GREATEST() AND LEAST(): returns greatest, least values in the provided values
SELECT GREATEST(100, 200, 300, 400, 500);

/* DATE FUNCTIONS:
CURDATE()/ CURRENT_DATE(): function returns the current date
CURTIME()/ CURRENT_TIME(): fucntion returns the current time
NOW(): function returns the current date and time
SYSDATE(): function returns the current date and time. 
MONTH(): funtion return th month part for a given date(a number from 1 to 12)
YEAR(): fuunction returns the year part for a given date( from 1000 to 9999) 
DAY(): functions retruns the day of the month for a given date (from 1 to 31)*/

SELECT CURRENT_DATE(); 
SELECT CURRENT_TIME(); 
SELECT NOW();
SELECT SYSDATE(); -- THE SAME NOW()
SELECT MONTH("2022-05-19");
SELECT YEAR("2022-05-19");

-- Queries on Date functions: 
Use company;
select * from employee;
-- DISPLAYS EMPLOYEES WHO ARE JOINED IN 2015: 
SELECT * FROM employee where YEAR(JoiningYear)= "2014"; 
SHOW COLUMNS FROM employee; -- check the data type. 
ALTER TABLE employee MODIFY COLUMN JoiningYear int;
-- MONTHNAME() ="JUNE"

/* GROUPBY:
- The GROUPBY clause groups records into summary rows
- Returns one records for each group
- Typically also involves aggregates: COUNT, MAX, SUM, AVG,etc.
- Can group by one or more columns*/

SELECT PaymentTier,SUM(ExperienceInCurrentDomain) FROM employee group by PaymentTier;
-- Check the average age based on experience current domain
SELECT ExperienceInCurrentDomain, AVG(Age)  from employee group by ExperienceInCurrentDomain;
SELECT ExperienceInCurrentDomain, MAX(Age) from employee group by ExperienceInCurrentDomain; -- MAX AGE
-- HOW MANY PEOPLE IN EACH PAYMENTTIER: 
SELECT PaymentTier, COUNT(*) FROM employee group by PaymentTier;
SELECT * FROM employee; 
SELECT ExperienceInCurrentDomain,Education, COUNT(*) FROM employee group by ExperienceInCurrentDomain; -- incompatible
-- HAVING: GROUPBY(GROUPBY)
SELECT ExperienceInCurrentDomain,Education, COUNT(*) FROM employee group by ExperienceInCurrentDomain having count(*)>3; -- just model not run in this data!!!
-- ORDER OF EXECUTION: 
/* Where----> Group by ---> Having---> Order by
SELECT column-names
FROM table-name
  WHERE condition
    GROUP BY column-names
      HAVING condition
        ORDER BY column-names      */

SELECT PaymentTier,SUM(ExperienceInCurrentDomain) FROM employee 
where PaymentTier<>60 
group by PaymentTier 
having SUM(ExperienceInCurrentDomain)> 400 
order by SUM(ExperienceInCurrentDomain) DESC;

SELECT * FROM employee order by Age ASC;


-- JOIN TABLE: 
USE COMPANY;
CREATE TABLE ORDERS(OrderID INT(20),CustomerID INT(20),	EmployeeID INT(20),	OrderDate DATETIME,	ShipperID INT(80));
CREATE TABLE CUSTOMERS(CustomerID INT(20),CustomerName VARCHAR(40),	ContactName VARCHAR(40),Address VARCHAR(50),City VARCHAR(40),PostalCode INT(50),Country VARCHAR(20));

INSERT INTO ORDERS VALUES(10308,2,7,'1996-09-18',3);
INSERT INTO ORDERS VALUES(10309,	37,3, "1996-09-19",	1);
INSERT INTO ORDERS VALUES(10310,	77,	8	,"1996-09-20",	2);
UPDATE ORDERS
SET OrderID =10310
where OrderDate ="1996-09-20";
DELETE FROM ORDERS WHERE OrderDate='1996-09-18 02:53:50';
SELECT * FROM ORDERS;

INSERT INTO CUSTOMERS VALUES(1, "Alfreds Futterkiste",	"Maria Anders",	"Obere Str. 57",	"Berlin",	12209,	"Germany");
INSERT INTO CUSTOMERS VALUES(2, "Ana Trujillo Emparedados y helados", "Ana Trujillo",	"Avda. de la Constitución 2222",	"México D.F.",	05021, "Mexico");
INSERT INTO CUSTOMERS VALUES(3, "Antonio Moreno Taquería","	Antonio Moreno", "	Mataderos 2312", "	México D.F.",	05023,"	Mexico");
use company;
SELECT * FROM CUSTOMERS;
SELECT * FROM ORDERS;

-- INNER JOIN: 
/* SELECT column_name(s)
FROM table1
INNER JOIN table2
ON table1.column_name = table2.column_name;*/

SELECT ORDERS.OrderID, CUSTOMERS.CustomerName
FROM ORDERS
INNER JOIN CUSTOMERS ON ORDERS.CustomerID = CUSTOMERS.CustomerID;

/* HOW TO JOIN 3 TABLES:
SELECT Orders.OrderID, Customers.CustomerName, Shippers.ShipperName
FROM ((Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID)
INNER JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID); */

CREATE TABLE Shippers(ShipperID INT(20), ShipperName VARCHAR(40), Phone INT(255));
Drop table Shippers; /* 
INSERT INTO Shippers VALUES(1, "Speedy Express"	, 50355591);
INSERT INTO Shippers VALUES(2, "United Package", 50355531);
INSERT INTO Shippers VALUES(3,	"Federal Shipping", 50359931);
select * from Shippers;

/* JOIN 3 TABLES TOGETHER: */
SELECT orders.OrderID, customers.CustomerName, shippers.Shippername
FROM ((orders
INNER JOIN customers ON orders.CustomerID= customers.CustomerID)
INNER JOIN shippers ON orders.ShipperID= shippers.ShipperID);

/* LEFT JOIN SYNTAX: 
SELECT column_name(s)
FROM table1
LEFT JOIN table2
ON table1.column_name = table2.column_name;*/

SELECT customers.CustomerName, orders. OrderID
FROM customers
LEFT JOIN orders
ON customers.CustomerID = orders.CustomerID
ORDER BY customers.CustomerName;

select * from orders;

/* RIGHT JOIN SYNTAX:
SELECT Orders.OrderID, Employees.LastName, Employees.FirstName
FROM Orders
RIGHT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
ORDER BY Orders.OrderID; */
USE company;
/* CROSS JOIN SYNTAX: 
SELECT column_name(s)
FROM table1
CROSS JOIN table2;*/

SELECT customers.CustomerName, orders. OrderID
FROM customers
cross join orders
where customers.CustomerID= orders.OrderID
order by CustomerName; 
/* If you add a WHERE clause (if table1 and table2 has a relationship),
 the CROSS JOIN will produce the same result as the INNER JOIN clause*/
 
 /* SELF JOIN SYNTAX: 
SELECT column_name(s)
FROM table1 T1, table1 T2
WHERE condition;


Example: 
SELECT A.CustomerName AS CustomerName1, B.CustomerName AS CustomerName2, A.City
FROM Customers A, Customers B
WHERE A.CustomerID <> B.CustomerID
AND A.City = B.City
ORDER BY A.City; */

/* UNION OPERATOR: is used to combine the result-set of two or more SELECT statements
SELECT column_name(s) FROM table1
UNION
SELECT column_name(s) FROM table2; */

SELECT CustomerID from customers
UNION
SELECT CustomerID from orders;

/* UNION ALL: ALLOW DUPLICATE VALUES*/
select CustomerID from customers
UNION ALL
SELECT CustomerID from orders
ORDER BY CustomerID DESC;

/* GROUP BY: */
SELECT * FROM customers;
select count( "CustomerID") from customers
group by country;

/* Group by with JOIN example: */
select shippers.ShipperName, COUNT(orders.OrderID) AS number_of_orders from orders
inner join shippers on shippers.ShipperID = orders.ShipperID
group by ShipperName
order by ShipperName;

/* Having Syntax:
SELECT column_name(s)
FROM table_name
WHERE condition
GROUP BY column_name(s)
HAVING condition
ORDER BY column_name(s);*/

/* EXIST Syntax: 
SELECT column_name(s)
FROM table_name
WHERE EXISTS
(SELECT column_name FROM table_name WHERE condition);*/

SELECT ShipperID
FROM orders
WHERE EXISTS (SELECT CustomerName FROM customers WHERE customers.CustomerID = orders.CustomerID);

/* SELECT SupplierName
FROM Suppliers
WHERE EXISTS (SELECT ProductName FROM Products WHERE Products.SupplierID = Suppliers.supplierID AND Price < 20);*/

use northwind;
SELECT SupplierName
FROM Suppliers
WHERE EXISTS (SELECT ProductName FROM Products WHERE Products.SupplierID = Suppliers.supplierID AND Price < 20);

/* THE ANY OPERATOR: 
SELECT column_name(s)
FROM table_name
WHERE column_name operator ANY
  (SELECT column_name
  FROM table_name
  WHERE condition);*/
select * from orderdetails;
select * from products; 
/* Finds any records in the OrderDetails table that Quantity = 10.*/
select ProductName 
from products where ProductID= ANY( select ProductID from orderdetails where Quantity =10);

select ProductName 
from products where ProductID= ALL( select ProductID from orderdetails where Quantity =10);

select all ProductName from products where TRUE; 

/* Find the name of the product if all the records in the OrderDetails has Quantity either equal to 6 or 2.*/
SELECT ProductName 
FROM products
WHERE ProductID = ALL (SELECT ProductId
                       FROM orderdetails
                       WHERE Quantity = 6 OR Quantity = 2);
                       
/*Find the OrderID whose maximum Quantity among all product of that OrderID is greater than average quantity of all OrderID.*/
SELECT OrderID 
FROM OrderDetails 
GROUP BY OrderID 
HAVING max(Quantity) > ALL (SELECT avg(Quantity) 
                            FROM OrderDetails 
                            GROUP BY OrderID);

/* CASE SYNTAX: 
CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    WHEN conditionN THEN resultN
    ELSE result
END; */

select * from orderdetails;

select OrderID, Quantity,
CASE
    WHEN Quantity> 30 THEN " The Quantity is greater than 30"
    WHEN Quantity= 30 THEN "The quantity is equal to 30"
    ELSE "The quantity is under 30"
END AS Quantity_Text
from orderdetails;
/* The following SQL will order the customers by City. However, if City is NULL, then order by Country:*/
select CustomerName, City, Country,
CASE
   WHEN City is NULL THEN Country
   ELSE City
END Orginality
from customers;
/* IF NULL Function: 
The MySQL IFNULL() function lets you return an alternative value if an expression is NULL.
SELECT ProductName, UnitPrice * (UnitsInStock + IFNULL(UnitsOnOrder, 0))
FROM Products;


COALESCE function: 
SELECT ProductName, UnitPrice * (UnitsInStock + COALESCE(UnitsOnOrder, 0))
FROM Products; */
-- Single line comment

-- MySQL CONSTRAINT: 
-- NOT NULL constraint:
use company;
select * from customers;
ALTER table customers
modify CustomerID int not null;

-- UNIQUE CONSTRAINT: 
CREATE TABLE PERSONS( 
   ID INT NOT NULL,
   Last_name VARCHAR(255) not null,
   First_name VARCHAR(255),
   Age int, 
   UNIQUE(ID));
   
-- Define a UNIQUE constraint on multiple columns, use the following SQL syntax:
CREATE TABLE PEOPLE( 
   ID INT NOT NULL,
   Last_name VARCHAR(255) not null,
   First_name VARCHAR(255),
   Age int, 
   CONSTRAINT Person_infor UNIQUE(ID, Last_name));

-- UNIQUE Constraint on ALTER TABLE: 
ALTER TABLE PERSONS
ADD UNIQUE( First_name) ;

-- DELETE UNIQUE CONSTRAINT: 
ALTER TABLE PERSONS
DROP INDEX First_name; 
/* PRIMARY CONSTRAINT: 
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    PRIMARY KEY (ID)
);

CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CONSTRAINT PK_Person PRIMARY KEY (ID,LastName)
);

Note: In the example above there is only ONE PRIMARY KEY (PK_Person). 
However, the VALUE of the primary key is made up of TWO COLUMNS (ID + LastName).
*/
-- ADD PRIMARY KEY: 
SELECT * FROM customers;
ALTER TABLE customers
ADD PRIMARY KEY (CustomerID);

/* ALTER TABLE customers
ADD CONSTRAINT Customers_key PRIMARY KEY(ContactName,Address); */

alter table customers
drop primary key;




