/* Note: Key: (Part of) Primary Key
Filled Diamond: NOT NULL
Not filled Diamond: NULL
Red colored: (Part of) Foreign key
Blue lined Diamond: Simple attribute (no key)*/

create database istech;
use istech;

-- Drop tables if exists: 
Drop table if exists members;
drop table if exists majors;
drop table if exists deparments;
Drop table if exists skillset;
Drop table if exists classes;
Drop table if exists audiences;
Drop table if exists members;
Drop table if exists events;
Drop table if exists event_registraion_list;
drop table if exists event_coordinators;
Drop table if exists leaders;
drop table if exists skills; 

CREATE TABLE members (
id INT auto_increment PRIMARY KEY,
account varchar(64),
first_name varchar(255) not null,
last_name varchar(255) not null,
dob datetime,
student_id int not null,
ms_teams_email varchar(64),
facebook_account varchar(64),
email varchar(225) not null,
trello_account varchar(64),
city_code varchar(64),
generation int,
created_at DATETIME,
created_by varchar(64),
active_at datetime,
joined_since date);



