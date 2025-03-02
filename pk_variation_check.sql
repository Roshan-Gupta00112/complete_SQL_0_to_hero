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
	('roshan15', 'kumar15',  15, 'Technology15', 'roshankumar15@school.org', 
	'777-555-1215')













create table depts(
first_name varchar(50),
department varchar(30)
)


insert into depts(
	first_name, department
)
values
('Roshan', 'A'),
('Kumar', 'A'),
('Gupta', 'B');


select * from depts

select 
	sum(case department when 'A' then 1 else 0 end)/
	sum(case department when 'B' then 1 else 0 end)
as department_ratio
from depts

select 
	count(*) filter (where department='A')/
	count(*) filter (where department = 'B')
as department_ratio
from depts


delete from depts where department = 'B'


select 
	SUM(case department when 'A' then 1 else 0 end)/
	nullif(sum(case department when 'B' then 1 else 0 end), 0)
as department_ratio
from depts


select 
	count(*) filter (where department = 'A')/
	nullif(count(*) filter (where department = 'B'), 0)
as department_ratio
from depts