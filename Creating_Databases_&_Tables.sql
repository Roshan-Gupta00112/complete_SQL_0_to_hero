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