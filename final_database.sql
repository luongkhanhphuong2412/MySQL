-- Create Database
CREATE DATABASE final;
DROP DATABASE final;

-- Drop tables if they exist in the 'final' database
USE final;
--  the object name ('Student') and the object type ('U' for user table).
IF OBJECT_ID('Student', 'U') IS NOT NULL
    DROP TABLE Student;

IF OBJECT_ID('Room', 'U') IS NOT NULL
    DROP TABLE Room;

IF OBJECT_ID('Employee', 'U') IS NOT NULL
    DROP TABLE Employee;

IF OBJECT_ID('Booking', 'U') IS NOT NULL
    DROP TABLE Booking;
--  the object name ('Booking_room') and the object type ('U' for user table).
IF OBJECT_ID('Booking_room', 'U') IS NOT NULL
    DROP TABLE Booking_room;

-- Create table Student
CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    first_name NVARCHAR(50),
    last_name NVARCHAR(50),
    dob DATE,
    gender NVARCHAR(10),
    phone_number NVARCHAR(15),
    email NVARCHAR(100),
    major NVARCHAR(50),
    password NVARCHAR(50)
);

-- Create table Room
CREATE TABLE Room (
    room_id INT PRIMARY KEY,
    location NVARCHAR(50),
    room_status NVARCHAR(50)
);

-- Create table Employee
CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    first_name NVARCHAR(50),
    last_name NVARCHAR(50),
    dob DATE,
    gender NVARCHAR(10),
    email NVARCHAR(100),
    phone_number NVARCHAR(15),
    password NVARCHAR(50)
);

-- Create table Booking
CREATE TABLE Booking (
    booking_id INT PRIMARY KEY,
    student_id INT,
    room_id INT,
    booking_date DATETIME,
    check_in_time DATETIME,
    check_out_time DATETIME,
    num_adults INT,
    reason NVARCHAR(255),
    confirmation_status NVARCHAR(50),
    pic_id INT,
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (room_id) REFERENCES Room(room_id),
    FOREIGN KEY (pic_id) REFERENCES Employee(employee_id)
);


-- Create Booking_room table (Bridge table)

CREATE TABLE Booking_room (
    booking_id INT FOREIGN KEY REFERENCES Booking(booking_id) 
	ON UPDATE CASCADE -- Khi update giá trị trong cột PK thì giá trị tương ứng trong cột FK sẽ tự động được update
	ON DELETE CASCADE,-- Khi xóa giá trị trong cột PK thì giá trị tương ứng trong cột FK sẽ tự động được xóa
    room_id INT FOREIGN KEY REFERENCES Room(room_id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- SELECT: 
select * from Booking_room;
select * from Student;
select * from Employee;
select * from Booking;
select * from Room;
select * from Booking_room;

-- INSERT DATA INTO TABLE STUDENTS: 
INSERT INTO Student (student_id, first_name, last_name, dob, gender, phone_number, email, major, password)
VALUES
    ('19123456', 'An', 'Nguyen', '1999-01-15', 'Male', '123456789', 'an.nguyen@example.com', 'BDA', 'password1'),
    ('19234567', 'Bao', 'Tran', '2000-03-20', 'Male', '987654321', 'bao.tran@example.com', 'MIS', 'password2'),
    ('20123456', 'Cam', 'Le', '2001-05-25', 'Female', '555111333', 'cam.le@example.com', 'ICE', 'password3'),
    ('20234567', 'Duc', 'Nguyen', '1999-07-12', 'Male', '555666777', 'duc.nguyen@example.com', 'KEUKA', 'password4'),
    ('21123456', 'Eva', 'Pham', '2000-09-18', 'Female', '222333444', 'eva.pham@example.com', 'AC', 'password5'),
    ('21234567', 'Trung', 'Vo', '2001-11-22', 'Male', '999000111', 'trung.vo@example.com', 'HELP', 'password6'),
    ('22123456', 'Giang', 'Tran', '2003-01-30', 'Female', '777888999', 'giang.tran@example.com', 'BEL', 'password7'),
    ('22234567', 'Hai', 'Do', '2004-04-05', 'Male', '444555666', 'hai.do@example.com', 'KEUKA', 'password8'),
    ('23123456', 'Ivy', 'Nguyen', '2005-06-10', 'Female', '111222333', 'ivy.nguyen@example.com', 'BDA', 'password9'),
    ('23234567', 'Khoi', 'Le', '1999-08-15', 'Male', '999111222', 'khoi.le@example.com', 'MIS', 'password10'),
	('24123456', 'Linh', 'Tran', '2000-10-20', 'Female', '333444555', 'linh.tran@example.com', 'ICE', 'password11'),
    ('24234567', 'Minh', 'Vo', '2001-12-25', 'Male', '666777888', 'minh.vo@example.com', 'AC', 'password12'),
    ('25123456', 'Nam', 'Pham', '2003-02-01', 'Male', '888999000', 'nam.pham@example.com', 'HELP', 'password13'),
    ('25234567', 'Oanh', 'Nguyen', '2004-04-07', 'Female', '444555666', 'oanh.nguyen@example.com', 'BEL', 'password14'),
    ('26123456', 'Phuc', 'Le', '2005-06-12', 'Male', '111222333', 'phuc.le@example.com', 'KEUKA', 'password15'),
    ('26234567', 'Quyen', 'Tran', '1999-09-17', 'Female', '999000111', 'quyen.tran@example.com', 'BDA', 'password16'),
    ('27123456', 'Rong', 'Vo', '2000-11-22', 'Male', '333444555', 'rong.vo@example.com', 'MIS', 'password17'),
    ('27234567', 'Son', 'Tran', '2002-01-27', 'Male', '666777888', 'son.tran@example.com', 'ICE', 'password18'),
    ('28123456', 'Thao', 'Do', '2003-03-03', 'Female', '888999000', 'thao.do@example.com', 'AC', 'password19'),
    ('28234567', 'Uyen', 'Nguyen', '2004-05-08', 'Female', '444555666', 'uyen.nguyen@example.com', 'HELP', 'password20'),
    ('29123456', 'Van', 'Le', '2005-07-13', 'Male', '111222333', 'van.le@example.com', 'BEL', 'password21'),
    ('29234567', 'Xuan', 'Pham', '1999-09-18', 'Female', '999000111', 'xuan.pham@example.com', 'KEUKA', 'password22'),
	 ('30234567', 'Zoe', 'Vo', '2002-01-28', 'Female', '666777888', 'zoe.vo@example.com', 'MIS', 'password24'),
    ('31123456', 'Andy', 'Do', '2003-03-04', 'Male', '888999000', 'andy.do@example.com', 'ICE', 'password25'),
    ('31234567', 'Bob', 'Nguyen', '2004-05-09', 'Male', '444555666', 'bob.nguyen@example.com', 'AC', 'password26'),
    ('32123456', 'Cathy', 'Le', '2005-07-14', 'Female', '111222333', 'cathy.le@example.com', 'HELP', 'password27'),
    ('32234567', 'David', 'Tran', '1999-09-19', 'Male', '999000111', 'david.tran@example.com', 'BEL', 'password28'),
    ('33123456', 'Eve', 'Vo', '2000-11-24', 'Female', '333444555', 'eve.vo@example.com', 'KEUKA', 'password29'),
    ('33234567', 'Frank', 'Pham', '2002-01-29', 'Male', '666777888', 'frank.pham@example.com', 'BDA', 'password30'),
    ('34123456', 'Grace', 'Tran', '2003-03-05', 'Female', '888999000', 'grace.tran@example.com', 'MIS', 'password31'),
    ('34234567', 'Harry', 'Do', '2004-05-10', 'Male', '444555666', 'harry.do@example.com', 'ICE', 'password32'),
    ('35123456', 'Iris', 'Nguyen', '2005-07-15', 'Female', '111222333', 'iris.nguyen@example.com', 'AC', 'password33')

-- Review table: 
select * from Student;

-- Insert records into Room table

INSERT INTO Room (room_id, location, room_status)
VALUES
    ('101', 'Xuan Thuy', 'Available'),
    ('102', 'Xuan Thuy', 'Unavailable'),
    ('103', 'Xuan Thuy', 'Available'),
    ('104', 'Xuan Thuy', 'Unavailable'),
    ('105', 'Xuan Thuy', 'Available'),
    ('106', 'Xuan Thuy', 'Unavailable'),

    ('201', 'Trinh Van Bo', 'Available'),
    ('202', 'Trinh Van Bo', 'Unavailable'),
    ('203', 'Trinh Van Bo', 'Available'),
    ('204', 'Trinh Van Bo', 'Unavailable'),
    ('205', 'Trinh Van Bo', 'Available'),
    ('206', 'Trinh Van Bo', 'Unavailable'),

    ('301', 'Hacinco', 'Available'),
    ('302', 'Hacinco', 'Unavailable'),
    ('303', 'Hacinco', 'Available'),
    ('304', 'Hacinco', 'Unavailable'),
    ('305', 'Hacinco', 'Available'),
    ('306', 'Hacinco', 'Unavailable'),

    ('401', 'Xuan Thuy', 'Available'),
    ('402', 'Xuan Thuy', 'Unavailable'),
    ('403', 'Xuan Thuy', 'Available'),
    ('404', 'Xuan Thuy', 'Unavailable'),
    ('405', 'Xuan Thuy', 'Available'),
    ('406', 'Xuan Thuy', 'Unavailable'),

    ('501', 'Trinh Van Bo', 'Available'),
    ('502', 'Trinh Van Bo', 'Unavailable'),
    ('503', 'Trinh Van Bo', 'Available'),
    ('504', 'Trinh Van Bo', 'Unavailable'),
    ('505', 'Trinh Van Bo', 'Available'),
    ('506', 'Trinh Van Bo', 'Unavailable'),
    ('601', 'Hacinco', 'Available'),
    ('602', 'Hacinco', 'Unavailable');

-- Review table: 
select * from Room;

-- Insert records into Employee table: 
INSERT INTO Employee (employee_id, first_name, last_name, dob, gender, email, phone_number, password)
VALUES
    ('2001', 'Anh', 'Nguyen', '1985-02-10', 'Male', 'anh.nguyen@example.com', '123456789', 'employee_password1'),
    ('2002', 'Huong', 'Tran', '1990-07-15', 'Female', 'huong.tran@example.com', '987654321', 'employee_password2'),
    ('2003', 'Minh', 'Le', '1988-09-22', 'Male', 'minh.le@example.com', '555111333', 'employee_password3'),
    ('2004', 'Linh', 'Pham', '1987-04-18', 'Female', 'linh.pham@example.com', '555666777', 'employee_password4'),
    ('2005', 'Cuong', 'Do', '1992-01-30', 'Male', 'cuong.do@example.com', '222333444', 'employee_password5'),
    ('2006', 'Mai', 'Vo', '1989-11-12', 'Female', 'mai.vo@example.com', '999000111', 'employee_password6'),
    ('2007', 'Tuan', 'Tran', '1986-05-25', 'Male', 'tuan.tran@example.com', '777888999', 'employee_password7'),
    ('2008', 'Hang', 'Harris', '1991-03-20', 'Female', 'hang.harris@example.com', '444555666', 'employee_password8'),
    ('2031', 'Thang', 'Clark', '1993-08-14', 'Male', 'thang.clark@example.com', '666777888', 'employee_password31'),
    ('2032', 'Nga', 'Wright', '1984-12-27', 'Female', 'nga.wright@example.com', '888999000', 'employee_password32'),
    ('2033', 'Quyen', 'Nguyen', '1985-06-10', 'Female', 'quyen.nguyen@example.com', '123456789', 'employee_password33'),
    ('2034', 'Long', 'Tran', '1990-09-15', 'Male', 'long.tran@example.com', '987654321', 'employee_password34'),
    ('2035', 'Hien', 'Le', '1988-12-20', 'Female', 'hien.le@example.com', '555111333', 'employee_password35'),
    ('2036', 'Dat', 'Pham', '1987-02-25', 'Male', 'dat.pham@example.com', '555666777', 'employee_password36'),
    ('2037', 'Thao', 'Do', '1992-04-01', 'Female', 'thao.do@example.com', '222333444', 'employee_password37'),
    ('2038', 'Hai', 'Vo', '1989-06-06', 'Male', 'hai.vo@example.com', '999000111', 'employee_password38'),
    ('2039', 'Huong', 'Tran', '1986-08-11', 'Female', 'huong.tran@example.com', '777888999', 'employee_password39'),
    ('2040', 'Cuong', 'Harris', '1991-10-16', 'Male', 'cuong.harris@example.com', '444555666', 'employee_password40'),
    ('2061', 'Minh', 'Clark', '1993-12-21', 'Male', 'minh.clark@example.com', '666777888', 'employee_password41'),
    ('2062', 'Hoa', 'Wright', '1985-02-26', 'Female', 'hoa.wright@example.com', '888999000', 'employee_password42'),
    ('2063', 'Hieu', 'Nguyen', '1990-05-01', 'Male', 'hieu.nguyen@example.com', '123456789', 'employee_password43'),
    ('2064', 'Linh', 'Tran', '1988-07-06', 'Female', 'linh.tran@example.com', '987654321', 'employee_password44'),
    ('2065', 'Quang', 'Le', '1987-09-11', 'Male', 'quang.le@example.com', '555111333', 'employee_password45'),
    ('2066', 'Hang', 'Pham', '1992-11-16', 'Female', 'hang.pham@example.com', '555666777', 'employee_password46'),
    ('2067', 'Tung', 'Do', '1990-01-21', 'Male', 'tung.do@example.com', '222333444', 'employee_password47'),
    ('2068', 'My', 'Vo', '1986-03-26', 'Female', 'my.vo@example.com', '999000111', 'employee_password48'),
    ('2069', 'Duc', 'Tran', '1989-05-01', 'Male', 'duc.tran@example.com', '777888999', 'employee_password49'),
    ('2070', 'Hang', 'Nguyen', '1987-07-06', 'Female', 'hang.nguyen@example.com', '444555666', 'employee_password50'),
    ('2071', 'Quang', 'Do', '1992-09-11', 'Male', 'quang.do@example.com', '111222333', 'employee_password51'),
    ('2072', 'My', 'Le', '1990-11-16', 'Female', 'my.le@example.com', '222333444', 'employee_password52'),
    ('2073', 'Hieu', 'Pham', '1986-01-21', 'Male', 'hieu.pham@example.com', '333444555', 'employee_password53'),
    ('2074', 'Linh', 'Vo', '1985-03-26', 'Female', 'linh.vo@example.com', '666777888', 'employee_password54');

select * from Employee;

-- Insert records into Booking table: 
INSERT INTO Booking (booking_id, student_id, room_id, booking_date, check_in_time, check_out_time, num_adults, confirmation_status, pic_id)
VALUES

    (1, 19123456, 101, '2023-01-15', '2023-02-01 12:00:00', '2023-02-01 18:00:00', 16, 'Requested', 2001),
    (2, 19234567, 102, '2023-03-20', '2023-04-01 14:00:00', '2023-04-01 20:00:00', 20, 'Approved', 2002),
    (3, 20123456, 103, '2023-05-25', '2023-06-01 10:00:00', '2023-06-01 16:00:00', 18, 'Rejected', 2003),
    (4, 20234567, 104, '2023-07-12', '2023-08-01 16:00:00', '2023-08-01 22:00:00', 17, 'Requested', 2004),
    (5, 21123456, 105, '2023-09-18', '2023-10-01 18:00:00', '2023-10-01 23:00:00', 19, 'Approved', 2005),
    (6, 21234567, 106, '2023-11-22', '2023-12-01 20:00:00', '2023-12-02 02:00:00', 22, 'Requested', 2006),
    (7, 22123456, 201, '2024-01-30', '2024-02-01 12:00:00', '2024-02-01 18:00:00', 16, 'Approved', 2007),
    (8, 22234567, 202, '2024-04-05', '2024-05-01 14:00:00', '2024-05-01 20:00:00', 20, 'Requested', 2008),
    (9, 23123456, 203, '2024-06-10', '2024-07-01 10:00:00', '2024-07-01 16:00:00', 18, 'Rejected', 2031),
    (10, 23234567, 204, '2024-08-15', '2024-09-01 16:00:00', '2024-09-01 22:00:00', 17, 'Requested', 2032),
    (24, 30234567, 506, '2024-09-19', '2024-10-01 20:00:00', '2024-10-02 02:00:00', 22, 'Requested', 2064),
    (25, 31123456, 601, '2024-11-24', '2024-12-01 12:00:00', '2024-12-01 18:00:00', 16, 'Approved', 2065),
    (26, 31234567, 602, '2024-01-29', '2025-02-01 14:00:00', '2025-02-01 20:00:00', 20, 'Requested', 2066),
    (27, 32123456, 301, '2024-03-05', '2025-04-01 16:00:00', '2025-04-01 22:00:00', 18, 'Rejected', 2067),
    (28, 32234567, 302, '2024-05-10', '2025-06-01 18:00:00', '2025-06-01 23:00:00', 19, 'Approved', 2068),
    (29, 33123456, 303, '2024-07-15', '2025-08-01 20:00:00', '2025-08-02 02:00:00', 22, 'Requested', 2069),
    (30, 33234567, 304, '2024-09-18', '2025-10-01 10:00:00', '2025-10-01 16:00:00', 16, 'Approved', 2070);

select booking_id, room_id from Booking;
-- Move data from Booking to booking_room:  
INSERT INTO booking_room (booking_id, room_id)
SELECT booking_id, room_id
FROM Booking;
select * from booking_room;

-- Checking update cascade and delete cascade: 
update Booking set booking_id = '24' where room_id = '601';   -- Successful update automatically to table Booking_room;

select * from Booking;

-- Update the Booking table with reasons
UPDATE Booking
SET reason = 
    CASE 
        WHEN booking_id BETWEEN 1 AND 3 THEN 'Study Session'
        WHEN booking_id BETWEEN 4 AND 6 THEN 'Group Project'
        WHEN booking_id BETWEEN 7 AND 9 THEN 'Exam Preparation'
        WHEN booking_id BETWEEN 9 AND 11 THEN 'Club Meeting'
        WHEN booking_id BETWEEN 12 AND 14 THEN 'Workshop'
        WHEN booking_id= 15 THEN 'Seminar'
        WHEN booking_id= 16 THEN 'Training Session'
        ELSE 'Other'
    END;
select * from Booking;

-- Count all the booking 
SELECT COUNT(*) AS TotalBookings FROM Booking;
-- Find the student having student_ID = 19123456
SELECT * FROM Student WHERE student_id = '19123456';
-- Student table: 
-- How many male and female students are there in the Student dataset? 
select * from Student
select gender, count(*) as number_of_female_and_male from Student group by gender;
-- What is the distribution of students across different majors?   (YES) 

select major, count(*) as student_count from Student group by major; 

/* where-> group by -> having -> order by*/

--Can you identify the oldest and youngest students based on their date of birth (dob)?   (YES) 

Select TOP 1 student_id, first_name, last_name, dob from Student order by dob; -- (ASC)
Select TOP 1 student_id, first_name, last_name, dob from Student order by dob DESC;

-- What is the most common password used by students?
select TOP 1 password, count(*) as password_count from Student group by password order by password_count ASC;
-- Room table: 
-- Which location has the highest number of rooms AVAILABLE?  (YES) 
select top 1 location, count(*) as highest_number_of_rooms_available from Room 
where room_status= 'Available' 
group by location 
order by highest_number_of_rooms_available DESC;

-- What is the current status (available or unavailable) of each room? (YES) 
select * from Room;
select room_status, count(*) as number_of_rooms from Room 
where location = 'Trinh Van Bo' 
group by room_status;
-- What is the average number of adults in booking round the results 2 decimal places? (Yes)
--Way 1: 
select * from Booking;
update Booking set num_adults= 107.45337 where booking_id = 3;
alter table booking
alter column num_adults float;

select round (AVG(num_adults), 3) as average_number_of_adults from Booking;

-- Way 2: 
select round(SUM(num_adults)/ count(*), 2) as average_number_of_adults from Booking;
-- How many bookings have been confirmed, and how many are still pending?
select confirmation_status, count(*) as number from Booking group by confirmation_status;
-- Can you identify the name of employee (pic_id) associated with each booking?  (Yes)
select * from Booking;
select * from Employee;
select e.first_name as name_of_employee, e.employee_id, b.booking_id, b.student_id 
from Employee e
inner join Booking b
on e.employee_id= b.pic_id;


-- Can you determine the average number of bookings per student?  (Yes or No)
select * from booking;
select AVG(booking_count) 
from 
(select student_id, count(booking_id) as booking_count from Booking group by student_id) as student_booking_counts;

-- Identify students who have made the most bookings and those who have not made any bookings. (YES) 
select * from student;
-- Those who not made any bookings: 
select s.student_id, s.first_name, s.last_name from Student s 
where s.student_id not in (select distinct student_id from Booking);

-- Student who have made the most bookings: 
select * from Booking;
insert into Booking values(31, 19123456, 101, 2024-1-15,'2024-1-15 19:00:00', '2024-1-15 23:00:00', 18, 'Workshop', 'Approved', 2004);

select top 1 s.first_name, s.last_name, s.student_id, count(b.booking_id) as booking_counts
from Student s
left join Booking b
on s.student_id = b. student_id
group by s.student_id, s.first_name, s.last_name
order by booking_counts DESC;
-- Analyze the distribution of confirmation statuses across different rooms.
-- Identify employees who have been associated with the most bookings.
-- Determine the average number of bookings per employee.
-- Identify rooms that have been booked by students majoring in the same field.
-- Identify students who have made more than 5 bookings.
select student_id from Booking group by student_id having count(booking_id)> 1;

---- Create a view to show room status for each location in "Trinh Van Bo" tower
CREATE VIEW TrinhVanBo_room_status 
as select room_id, location, room_status from Room where location = 'Trinh Van Bo';

SELECT * FROM TrinhVanBo_room_status;

-- When a student wants to check which teacher determines the room borrowing status and when the decision is made
-- use a view to create a table. 
-- The table that student can see includes the full name of the teacher, teacher's email, phone number, Check_out_time, and Confirmation_status. 
-- Use the view to create the table to prevent students from accessing the main table and altering the data in it arbitrarily.

CREATE VIEW student_checking_results 
AS 
SELECT 
    s.first_name AS student_first_name,
    b.booking_id,
    r.room_id,
    b.booking_date,
    b.check_in_time,
    b.check_out_time,
    b.confirmation_status,
    e.first_name AS employee_first_name,
    e.last_name,
    e.gender,
    e.email,
    e.phone_number 
FROM 
    Booking b
    INNER JOIN Room r ON b.room_id = r.room_id
    LEFT JOIN Student s ON s.student_id = b.student_id
    INNER JOIN Employee e ON b.pic_id = e.employee_id;


SELECT * FROM student_checking_results;


-- Create a stored procedure
CREATE PROCEDURE STATUS
AS 
SELECT * FROM Booking

EXEC STATUS

DROP PROCEDURE STATUS

-- Create a stored procedure to update the room status when a booking is confirmed.

CREATE PROCEDURE Update_Room_Status
AS
BEGIN
     UPDATE Room
	 SET room_status= 'Unavailable'
	 from Room r
	 inner join Booking b on b.room_id = r.room_id
	 where b.confirmation_status = 'Approved';
END;

/* Create procedure to update the confirmation status of a booking based on some conditions.
If the conditions are met, we'll set the confirmation status to 'Approved'; otherwise, we'll set it to 'Rejected'.*/
CREATE PROCEDURE Update_confirmation_status
AS
BEGIN
     UPDATE Booking
     SET confirmation_status = 
        CASE
           WHEN num_adults > 15 AND DATEDIFF(HOUR, check_out_time, check_out_time) <= 6 THEN 'Approved'
           ELSE 'Rejected'
           END;
END;
-- Cheking procedure: 
select * from Booking;
select * from Room;
EXEC Update_Room_Status
select * from Booking
-- Design a transaction to update, rollback data: 
begin transaction 
	update Booking set confirmation_status= 'Approved' where num_adults > 15
	update Booking set num_adults = 45 where room_id = 101
select * from Booking;
rollback transaction
commit transaction
print 'transaction commited'

-- SQL trigger usages: Log table modifications, Enforce complex integrity of data    ((YES)

CREATE TABLE booking_changes (
    booking_id INT,
    changed_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    old_num_adults INT,
    new_num_adults INT,
    PRIMARY KEY (booking_id, changed_at)
);

CREATE TRIGGER before_update_num_adults  
ON Booking  --Specifies that the trigger is associated with the Booking table.
AFTER UPDATE   -- Indicates that the trigger should fire after an UPDATE operation on the specified table.
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO booking_changes (booking_id, old_num_adults, new_num_adults)
    SELECT 
        i.booking_id,
        d.num_adults AS old_num_adults,
        i.num_adults AS new_num_adults
    FROM
        inserted i
    JOIN
        deleted d ON i.booking_id = d.booking_id
    WHERE
        i.num_adults <> d.num_adults;
END;

select * from Booking;
update Booking set num_adults = 23 where booking_id = 7;

select * from booking_changes;


-- How can we ensure that the number of adults in a booking is always greater than 5?
alter table Booking add constraint Check_num_adults CHECK(num_adults > 5) 

ALTER TABLE Booking
DROP CONSTRAINT Check_num_adults;
-- Checking: 
INSERT INTO Booking (booking_id, student_id, room_id, booking_date, check_in_time, check_out_time, num_adults, reason, confirmation_status, pic_id)
VALUES (108, 19123456, 101, '2023-12-24', '2023-12-24 13:00:00', '2023-12-24 18:00:00', 4, 'Workshop', 'Rejected', 2005);
/* The INSERT statement conflicted with the CHECK constraint "Check_num_adults". 
The conflict occurred in database "final", table "dbo.Booking", column 'num_adults'.*/ 

-- MINUS (EXCEPT) Question: List the students who have booked a room but have not made any bookings in the year 2023.
SELECT * FROM Booking 
except 
SELECT * FROM Booking WHERE YEAR(booking_date) = 2023;  --NOT IN

-- INTERSECT Question:

-- Which students have booked both room 101 and room 102?
INSERT INTO Booking (booking_id, student_id, room_id, booking_date, check_in_time, check_out_time, num_adults, reason, confirmation_status, pic_id)
VALUES (109, 19123456, 102, '2023-12-24', '2023-12-25 16:00:00', '2023-12-25 18:00:00', 9, 'Workshop', 'Approved', 2005);
SELECT student_id FROM Booking WHERE room_id = 101 INTERSECT SELECT student_id FROM Booking WHERE room_id = 102;  --IN

-- What is the current status (available or unavailable) of each room? (YES)
use final;
select room_status, count(*) as status from Room group by room_status;

-- What is the average number of adults in booking round the results 2 decimal places? (Yes)
select round(AVG(num_adults),2) from Booking;
-- Can you identify the name of employee (pic_id) associated with each booking?  (Yes)
select * from employee
select * from booking
select b.booking_id, b.pic_id, b.confirmation_status, e.first_name, e.last_name 
from employee e
inner join booking b 
on e.employee_id = b.pic_id
-- Identify students who have made the most bookings and those who have not made any bookings. (YES)
select * from student;
-- Indentify students who have made the most bookings
select TOP 1 s.first_name, s.last_name, s.student_id, count(b.student_id) as number_of_bookings 
from Student s
inner join Booking b
on s.student_id= b.student_id
group by s.student_id,s.first_name, s.last_name
order by number_of_bookings DESC

-- Those who have not made any bookings: 
select student_id from Student where student_id not in (select distinct student_id from Booking) 

-- When a student wants to check which teacher determines the room borrowing status and when the decision is made
-- use a view to create a table. 
-- The table that student can see includes the full name of the teacher, teacher's email, phone number, Check_out_time, and Confirmation_status. 
-- Use the view to create the table to prevent students from accessing the main table and altering the data in it arbitrarily.
-- Create a stored procedure to update the room status when a booking is confirmed.

Create view student_checking_results_demo 
as select s.student_id, s.first_name, s.last_name,
b.check_out_time, b.check_in_time, b.booking_id, b.room_id,
e.employee_id, e.first_name as first_name_of_employee, e.last_name as last_name_of_employee, e.email, e.phone_number
from Booking b
inner join Student s on s.student_id = b.student_id
inner join Employee e on b.pic_id= e.employee_id;

-- Watch this view: 
select * from student_checking_results_demo;
/* Create procedure to update the confirmation status of a booking based on some conditions.
If the conditions are met, we'll set the confirmation status to 'Approved'; otherwise, we'll set it to 'Rejected'.*/

create procedure update_confirmation_status_demo 
as
begin
     Update Booking
	 set confirmation_status= 
	 Case 
	 when num_adults> 15 and DATEDIFF(hour,check_in_time, check_out_time) <6 then 'Approved'
	 else 'rejected'
	 end;
end;
-- Design a transaction to update, rollback data:
-- How can we ensure that the number of adults in a booking is always greater than 5?
-- MINUS (EXCEPT) Question: List the students who have booked a room but have not made any bookings in the year 2023.
-- Which students have booked both room 101 and room 102?


CREATE TRIGGER before_update_num_adults_demo 
ON Booking  --Specifies that the trigger is associated with the Booking table.
AFTER UPDATE   -- Indicates that the trigger should fire after an UPDATE operation on the specified table.
AS
BEGIN
    INSERT INTO booking_changes (booking_id, old_num_adults, new_num_adults)
    SELECT 
        i.booking_id,     -- holds copies of the affected rows
        d.num_adults AS old_num_adults, -- deleted
        i.num_adults AS new_num_adults    -- insert num_adults
    FROM
        inserted i
    JOIN
        deleted d ON i.booking_id = d.booking_id
    WHERE
        i.num_adults <> d.num_adults;
END;

drop trigger before_update_num_adults_demo 

create trigger before_update_demo2
on Booking
after update
as
begin 
     SET NOCOUNT ON;  
	 /* This setting prevents the message indicating the number of rows 
	 affected by a T-SQL statement from being returned. It can improve performance in certain scenarios.*/
     insert into booking_changes(booking_id, old_num_adults, new_num_adults)
	 select i.booking_id,
	 d.num_adults as old_num_adults,
	 i.num_adults as new_num_adults
	 from inserted i
	 join deleted d on i.booking_id= d.booking_id
	 where
	 i.num_adults <> d.num_adults
End;

DROP TRIGGER before_update_demo2