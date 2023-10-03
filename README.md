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
# The NOT Operator

The `NOT` operator is used in combination with other operators to give the opposite result, also called the negative result.

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/ae90b51e-0b3e-421f-92d8-95fc204e5f4b/01253239-12e2-465c-a859-f1471c543c48/Untitled.png)

# INSERT INTO Syntax

It is possible to write the `INSERT INTO` statement in two ways:

1. Specify both the column names and the values to be inserted:

INSERT INTO *table_name* (*column1*, *column2*, *column3*, ...)

VALUES (*value1*, *value2*, *value3*, ...);

# The SQL UPDATE Statement

The `UPDATE` statement is used to modify the existing records in a table.

# UPDATE Syntax

UPDATE *table_name*

SET *column1* = *value1*, *column2* = *value2*, ...

WHERE *condition*;

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/ae90b51e-0b3e-421f-92d8-95fc204e5f4b/d1ef1d2e-c91e-47fe-b065-147b6caee249/Untitled.png)

# The SQL DELETE Statement

The `DELETE` statement is used to delete existing records in a table.

# DELETE Syntax

DELETE FROM *table_name* WHERE *condition*;

# The SQL SELECT TOP Clause

The `SELECT TOP` clause is used to specify the number of records to return.

The `SELECT TOP` clause is useful on large tables with thousands of records. Returning a large number of records can impact performance.

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/ae90b51e-0b3e-421f-92d8-95fc204e5f4b/7d435315-398b-477e-820b-7fa56795d0f5/Untitled.png)

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/ae90b51e-0b3e-421f-92d8-95fc204e5f4b/02e59e0b-3969-4b3f-9bdb-8936e0992b33/Untitled.png)

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/ae90b51e-0b3e-421f-92d8-95fc204e5f4b/0e1346a9-9aef-40c1-89cb-a96432cef645/Untitled.png)

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/ae90b51e-0b3e-421f-92d8-95fc204e5f4b/44ab63a3-5bc2-46c4-a07e-ec26b7097842/Untitled.png)

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/ae90b51e-0b3e-421f-92d8-95fc204e5f4b/da5b8c87-19ff-45ac-b98d-3365f742a411/Untitled.png)

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/ae90b51e-0b3e-421f-92d8-95fc204e5f4b/fd65ec0d-1cc3-4f37-a09b-2c2cca61aca8/Untitled.png)

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/ae90b51e-0b3e-421f-92d8-95fc204e5f4b/5f3eada4-49cf-4f9d-a687-f98d248d993d/Untitled.png)

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/ae90b51e-0b3e-421f-92d8-95fc204e5f4b/0f4bf138-4f79-4c11-b457-ca37fd18e589/Untitled.png)

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/ae90b51e-0b3e-421f-92d8-95fc204e5f4b/0fe8a4d3-b349-468b-b9e0-012f9a7ebc94/Untitled.png)

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/ae90b51e-0b3e-421f-92d8-95fc204e5f4b/5cdb43b2-3fe1-43df-ab5b-d38820a0973c/Untitled.png)

Create is used to create database objects(Database, Table, views, synonymes, etc)

ALTER: 

- Adding a new column
- Dropping the existing column
- Modifying the existing column (Increase/ Decrease size of column&change the datatype of the column)
- Renaming a column
