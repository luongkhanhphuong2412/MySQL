# MySQL
# SQL

**SQL is a standard language for accessing and manipulating databases.**

# What is SQL?

- SQL stands for Structured Query Language
- Used to communicate to the database to perform different kinds of operations
- SQL lets you access and manipulate databases
- SQL became a standard of the American National Standards Institute (ANSI) in 1986, and of the International Organization for Standardization (ISO) in 1987

# Using SQL in Your Web Site

To build a web site that shows data from a database, you will need:

- An RDBMS database program (i.e. MS Access, SQL Server, MySQL)
- To use a server-side scripting language, like PHP or ASP
- To use SQL to get the data you want
- To use HTML / CSS to style the page

# RDBMS

RDBMS stands for Relational Database Management System.

RDBMS is the basis for SQL, and for all modern database systems such as MS SQL Server, IBM DB2, Oracle, MySQL, and Microsoft Access.

The data in RDBMS is stored in database objects called tables. A table is a collection of related data entries and it consists of columns and rows. 

# Some of The Most Important SQL Commands

- `SELECT` - extracts data from a database
- `UPDATE` - updates data in a database
- `DELETE` - deletes data from a database
- `INSERT INTO` - inserts new data into a database
- `CREATE DATABASE` - creates a new database
- `ALTER DATABASE` - modifies a database
- `CREATE TABLE` - creates a new table
- `ALTER TABLE` - modifies a table
- `DROP TABLE` - deletes a table
- `CREATE INDEX` - creates an index (search key)
- `DROP INDEX` - deletes an index

# DBMS→ Database Management System

Dbase, Foxpro, MS-access etc,..

# RDBMS→ Relational Database Management System

Oracle, MS-SQL Server, DB2, MySQL, Ms- Acesss etc

# What is Database- Data Storage Area

# Database Component:

Database→ Client( first) and Server (to storage) 

Data is actually stored in Database server( Remote machines)

We can send SQL Commands using client client software

2 types of client 

—> Graphical mode (GUI)

—> CLI ( Command Line Interface) 

MySQL—> MySQL Workbench(GUI) 

               My SQL CommandLinetool (CLI)

         —> Toad

        —>  Squirrel 

        —>  Aquadata studio

# SQL Language and Commands:

1. **DDL (Data Definition Language)**
- CREATE, ALTER, DROP, TRUNCATE, RENAME
1. **DML (Data Manipulation Language)** 
- INSERT, UPDATE, DELETE
1. **DRL/ DQL (Data Retrievel/ Data Query Language)**
- SELECT
1. **TCL (Transaction Control Language)**
- COMMIT, ROLLBACK, SAVE POINT
1. **DCL (Data Control Language)**
- GRANT, REVOKE

# OR vs AND

The `OR` operator displays a record if *any* of the conditions are TRUE.

The `AND` operator displays a record if *all* the conditions are TRUE.

SELECT * FROM Customers

WHERE Country = 'Spain' AND (CustomerName LIKE 'G%' OR CustomerName LIKE 'R%');

# The NOT Operator

The `NOT` operator is used in combination with other operators to give the opposite result, also called the negative result.
