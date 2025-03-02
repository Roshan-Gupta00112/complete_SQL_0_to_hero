create table students(
	student_id serial primary key, 
	first_name varchar(25) not null, 
	last_name varchar(20), 
	homeroom_number integer not null, 
	phone char(10) unique not null, 
	email varchar(50) unique not null, 
	graduation_year char(4)
)

alter table students
alter column last_name
set not null

alter table students
alter column phone
set data type char(12)

alter table students
alter column email
drop not null

select * from students


insert into students(
	first_name, last_name, homeroom_number, phone, email, graduation_year
)
values
('Mark', 'Watney',  5, '777-555-1234', NULL, 2035)


insert into students(
	first_name, last_name, homeroom_number, phone, graduation_year
)
values
('roshan', 'kumar',  7, '777-555-4444', 2035)



create table teachers(
	teacher_id serial primary key, 
	first_name varchar(30) not null, 
	last_name varchar(25),
	homeroom_number integer not null, 
	department varchar(15) not null, 
	email varchar(50) unique not null, 
	phone char(10) unique not null
)

alter table teachers
alter column last_name
set not null

alter table teachers
add constraint unique_homeroom_number unique(homeroom_number)

alter table teachers
alter column phone
set data type char(12)


select * from teachers

insert into teachers(
	first_name, last_name, homeroom_number, department, email, phone
)
values
('Jonas', 'Salk', 5, 'Biology', 'jsalk@school.org', '777-555-4321')