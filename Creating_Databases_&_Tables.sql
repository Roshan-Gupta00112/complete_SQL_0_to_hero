CREATE TABLE account (
	user_id SERIAL PRIMARY KEY, 
	user_name VARCHAR(50) UNIQUE NOT NULL,
	password varchar(25) not null,
	email varchar(50) unique not null,
	created_on TIMESTAMP not null,
	last_login TIMESTAMP not null
)


CREATE TABLE job(
	job_id SERIAL PRIMARY KEY,
	job_name VARCHAR(200) UNIQUE NOT NULL
)


CREATE TABLE account_job(
	user_id INTEGER REFERENCES account(user_id),
	job_id INTEGER REFERENCES job(job_id),
	hire_date TIMESTAMP
)









select * from account


insert into account(user_name, password, email, created_on, last_login)
values
('jose', 'password', 'jose@mail.com', current_timestamp, now())


update account
set last_login = now()
where user_id = 2


update account
set last_login = now()
where user_id = 2
Returning user_id, last_login


update account
set last_login = created_on








select * from job 


insert into job(job_name)
values
('Astronaut')


insert into job(job_name)
values
('President')


insert into job(job_name)
values
('Cowboy')


delete from job
where job_id = 3


insert into job(job_name)
values
('Cowboy')


delete from job
where job_name = 'Cowboy'
returning job_id, job_name

delete from job
where job_name = 'Cowboy'
returning *







select * from account_job


insert into account_job(user_id, job_id, hire_date)
values
(2, 1, now())


update account_job
set hire_date = account.created_on
from account
where account_job.user_id = account.user_id







Create table information(
info_id SERIAl primary key,
title varchar(100) not null,
person varchar(30) not null unique
)

select * from information

alter table information
rename to new_info

select * from new_info

alter table new_info
rename column person to people

alter table new_info
alter column people
drop not null

insert into new_info(title)
values
('some new title')







alter table new_info
drop column people









create table employees(
emp_id serial primary key,
first_name varchar(35) not null,
last_name varchar(35) not null,
birthdate date check (birthdate > '1900-01-01'),
hire_date date check (hire_date > birthdate),
salary integer check (salary > 0)
)



insert into employees(
	first_name, last_name, birthdate, hire_date, salary
)
values
('roshan', 'gupta', '1998-02-23', '2023-07-01', 3500001)


select * from employees



create database School
