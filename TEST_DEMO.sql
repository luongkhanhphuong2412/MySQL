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