/* Note: Key: (Part of) Primary Key
Filled Diamond: NOT NULL
Not filled Diamond: NULL
Red colored: (Part of) Foreign key
Blue lined Diamond: Simple attribute (no key)*/

create database istech;
use istech;

-- Drop tables if they exist
DROP TABLE IF EXISTS booking_changes;
DROP TABLE IF EXISTS booking_room;
DROP TABLE IF EXISTS booking;
DROP TABLE IF EXISTS event_coordinators;
DROP TABLE IF EXISTS event_registration_list;
DROP TABLE IF EXISTS events;
DROP TABLE IF EXISTS audiences;
DROP TABLE IF EXISTS skillset;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS classes;
DROP TABLE IF EXISTS majors;
DROP TABLE IF EXISTS leaders;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS employee_department;
DROP TABLE IF EXISTS school_employee;
DROP TABLE IF EXISTS room;
DROP TABLE IF EXISTS member_skill_percentage;


CREATE TABLE departments (
id int,
department_code varchar(5) primary key,
department_name varchar(255) not null,
leader BOOLEAN,
constraint check_leader CHECK (leader in (0,1)) 
);  -- where 0 represents false and 1 represents true

CREATE TABLE leaders(
lead_account int,
foreign key (lead_account) references members(id),
lead_department varchar(5),
FOREIGN KEY (lead_department) REFERENCES departments(department_code)
);

CREATE TABLE majors(
major_code varchar(64) primary key,
major_group varchar(64) not null,   -- IT, Business, Language
major_name_en varchar(255) not null,
major_name_vi varchar(255) not null,
desc_en text,
desc_vi text);

CREATE TABLE classes(
class_code varchar(12) primary key,
class_major varchar(64),
foreign key(class_major) references majors(major_code),
total_students int,
graduated_status boolean);

CREATE TABLE members (
id INT auto_increment PRIMARY KEY,
first_name varchar(255) not null,
last_name varchar(255) not null,
dob DATE,
class varchar(64),
FOREIGN KEY (class) REFERENCES classes(class_code),
student_id int not null,
student_email varchar(64),
facebook_account TEXT,
email varchar(225) not null,
trello_account TEXT,
city_code varchar(64),
department_code varchar(5),
foreign key(department_code) references departments(department_code),
skillset int,
club_generation float not null,
created_at DATETIME,
created_by varchar(64),
active_at datetime,
joined_since date);

CREATE TABLE audiences(
id int primary key,
first_name varchar(255) not null,
last_name varchar(255) not null,
email varchar(255) not null,
student_id int not null,
student_class varchar(64),
foreign key (student_class) references classes(class_code),
total_event_registered int,
created_at DATETIME);

CREATE TABLE skills(
id int primary key auto_increment,
skill_name varchar(255) not null,
skill_type varchar(255)); 


CREATE TABLE skillset(
id int primary key,
member_account int,
audience_account int,
foreign key (member_account) references members(id),
foreign key(audience_account) references audiences(id),
event_id INT,
FOREIGN KEY (event_id) REFERENCES events(id),
primary_skill int,
foreign key (primary_skill) references skills(id),
second_skill int,
foreign key( second_skill) references skills(id),
CHECK( primary_skill<> second_skill),   -- Make sure the primary skill differs from second skill
skill_3 int,
skill_4 int
); 


CREATE TABLE events(
id int primary key auto_increment,
event_name varchar(500) not null,
event_target_audience varchar(225),
event_coordinators int,
date_hosted DATETIME,
event_registration_list int,
event_assets text,
description text, 
event_report int,
created_at DATETIME,
created_by varchar(64));

CREATE TABLE event_registration_list(
id int,
audience_id int,
foreign key (audience_id) references audiences(id), 
registered_at DATETIME,
event_id INT,
foreign key (event_id) references events(id)
);

CREATE TABLE event_coordinators (
event_id int,
foreign key (event_id) references events(id),
member_account int,
foreign key (member_account) references members(id),
role TEXT,
is_organizer boolean);


CREATE TABLE member_skill_percentage(
id int primary key auto_increment,
member_id int,
foreign key (member_id) references members(id),
primary_skill_id int,
foreign key (primary_skill_id) references skills(id), 
second_skill_id int,
foreign key (second_skill_id) references skills(id),
event_id int,
foreign key(event_id) references events(id),
primary_skill_count INT DEFAULT 0,
second_skill_count INT DEFAULT 0,
primary_skill_percentage DECIMAL(5,2),
second_skill_percentage DECIMAL(5,2)
);

DELIMITER //

CREATE TRIGGER update_member_skill_percentage AFTER INSERT ON skillset
FOR EACH ROW
BEGIN
    -- Update primary_skill_percentage
    UPDATE member_skill_percentage
    SET primary_skill_count = primary_skill_count + 1,
        primary_skill_percentage = (primary_skill_count / (primary_skill_count + second_skill_count + IF(NEW.skill_3 IS NOT NULL, 1, 0) + IF(NEW.skill_4 IS NOT NULL, 1, 0))) * 100
    WHERE member_id = NEW.member_account
    AND event_id = NEW.event_id
    AND primary_skill_id = NEW.primary_skill;
    
    -- Update second_skill_percentage
    UPDATE member_skill_percentage
    SET second_skill_count = second_skill_count + 1,
        second_skill_percentage = (second_skill_count / (primary_skill_count + second_skill_count + IF(NEW.skill_3 IS NOT NULL, 1, 0) + IF(NEW.skill_4 IS NOT NULL, 1, 0))) * 100
    WHERE member_id = NEW.member_account
    AND event_id = NEW.event_id
    AND second_skill_id = NEW.second_skill;
    
    -- Update skill_3_percentage
    IF NEW.skill_3 IS NOT NULL THEN
        UPDATE member_skill_percentage
        SET skill_3_count = skill_3_count + 1,
            skill_3_percentage = (skill_3_count / (primary_skill_count + second_skill_count + 1 + IF(NEW.skill_4 IS NOT NULL, 1, 0))) * 100
        WHERE member_id = NEW.member_account
        AND event_id = NEW.event_id
        AND skill_3_id = NEW.skill_3;
    END IF;

    -- Update skill_4_percentage
    IF NEW.skill_4 IS NOT NULL THEN
        UPDATE member_skill_percentage
        SET skill_4_count = skill_4_count + 1,
            skill_4_percentage = (skill_4_count / (primary_skill_count + second_skill_count + IF(NEW.skill_3 IS NOT NULL, 1, 0) + 1)) * 100
        WHERE member_id = NEW.member_account
        AND event_id = NEW.event_id
        AND skill_4_id = NEW.skill_4;
    END IF;
END //

DELIMITER ;

-- Booking Room:  

CREATE TABLE room (
    room_id INT PRIMARY KEY,
    location NVARCHAR(50),
    room_status NVARCHAR(50)
);

CREATE TABLE employee_department (
department_id int,
department_code varchar(5) primary key,
department_name varchar (255) not null);


CREATE TABLE school_employee (
    employee_id INT PRIMARY KEY,
    first_name NVARCHAR(50),
    last_name NVARCHAR(50),
    dob DATE,
    gender NVARCHAR(10),
    email NVARCHAR(100),
    phone_number NVARCHAR(15),
    employee_department varchar(5),
    foreign key (employee_department) references employee_department(department_code),
    created_at DATETIME,
    created_by VARCHAR(64),
    joined_since DATE
    );

CREATE TABLE booking(
    booking_id INT PRIMARY KEY auto_increment,
    member_id INT,
    foreign key(member_id) references members(id),
    event_id int not null,
    foreign key(event_id) references events(id),
    room_id INT,
	FOREIGN KEY (room_id) REFERENCES room(room_id),
    booking_date DATETIME,
    check_in_time DATETIME,
    check_out_time DATETIME,
    num_adults INT,
    reason NVARCHAR(255),
    booking_status BOOLEAN,
	pic_id INT,
    FOREIGN KEY(pic_id) references school_employee(employee_id)
);



CREATE TABLE booking_room (
    booking_id INT, 
    room_id INT, 
    PRIMARY KEY (booking_id, room_id), 
    FOREIGN KEY (booking_id) REFERENCES booking(booking_id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (room_id) REFERENCES room(room_id) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE booking_changes (
    change_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT,
    changed_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    old_member_id INT,
    new_member_id INT,
    old_event_id INT,
    new_event_id INT,
    old_room_id INT,
    new_room_id INT,
    old_booking_date DATETIME,
    new_booking_date DATETIME,
    old_check_in_time DATETIME,
    new_check_in_time DATETIME,
    old_check_out_time DATETIME,
    new_check_out_time DATETIME,
    old_num_adults INT,
    new_num_adults INT,
    old_reason NVARCHAR(255),
    new_reason NVARCHAR(255),
    old_booking_status BOOLEAN,
    new_booking_status BOOLEAN,
    old_pic_id INT,
    new_pic_id INT
);

DELIMITER //

CREATE TRIGGER before_booking_update
BEFORE UPDATE ON booking
FOR EACH ROW
BEGIN
    IF OLD.member_id != NEW.member_id OR OLD.event_id != NEW.event_id OR OLD.room_id != NEW.room_id OR
       OLD.booking_date != NEW.booking_date OR OLD.check_in_time != NEW.check_in_time OR OLD.check_out_time != NEW.check_out_time OR
       OLD.num_adults != NEW.num_adults OR OLD.reason != NEW.reason OR OLD.booking_status != NEW.booking_status OR
       OLD.pic_id != NEW.pic_id THEN
    
        INSERT INTO booking_changes (booking_id, old_member_id, new_member_id,
                                     old_event_id, new_event_id,
                                     old_room_id, new_room_id,
                                     old_booking_date, new_booking_date,
                                     old_check_in_time, new_check_in_time,
                                     old_check_out_time, new_check_out_time,
                                     old_num_adults, new_num_adults,
                                     old_reason, new_reason,
                                     old_booking_status, new_booking_status,
                                     old_pic_id, new_pic_id)
        VALUES (OLD.booking_id, OLD.member_id, NEW.member_id,
                OLD.event_id, NEW.event_id,
                OLD.room_id, NEW.room_id,
                OLD.booking_date, NEW.booking_date,
                OLD.check_in_time, NEW.check_in_time,
                OLD.check_out_time, NEW.check_out_time,
                OLD.num_adults, NEW.num_adults,
                OLD.reason, NEW.reason,
                OLD.booking_status, NEW.booking_status,
                OLD.pic_id, NEW.pic_id);
    END IF;
END//

DELIMITER ;
