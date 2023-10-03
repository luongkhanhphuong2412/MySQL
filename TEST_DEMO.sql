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
