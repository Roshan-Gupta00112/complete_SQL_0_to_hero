SET SQL_SAFE_UPDATES = 0;

use test;


create table deduplicated
(
	id int,
	first_name varchar(20),
	last_name varchar(25)
);


insert into deduplicated 
	(id, first_name, last_name) 
values
	(1, 'roshan', 'kumar'),
	(2, 'roshan', 'gupta'),
	(3, 'roshan kumar', 'gupta'),
	(4, 'roshan', 'ji'),
	(5, 'roshan', ''),
	(6, 'roshan', 'kumar'),
	(7, 'roshan', 'gupta'),
	(8, ' roshan', ' kumar'),
	(9, 'roshan ', 'gupta ')
    ;
    

delete from deduplicated;
    
select * from  deduplicated
order by id;


delete d1 from deduplicated d1,
deduplicated d2
where
d1.first_name = d2.first_name 
and d1.last_name = d2.last_name
and d1.id>d2.id;


delete d1 from deduplicated d1
join deduplicated d2
on d1.first_name = d2.first_name
and d1.last_name = d2.last_name
and d1.id > d2.id;


select * from deduplicated;

select UCASE(first_name) from deduplicated;

select UPPER(first_name) from deduplicated;

select LCASE(first_name) from deduplicated;

select LOWER(first_name) from deduplicated;

select first_name, length(first_name) from deduplicated;


select 
	concat(first_name, ' ', last_name) as full_name , 
	length(concat(first_name, last_name)) as full_name_length
from deduplicated;


select substring(first_name, 1, 3) from deduplicated;


select 
	id, 
	first_name, length(first_name),
	trim(first_name) as trimmed_first_name, length(trim(first_name)) as length_trimmed_first_name,
	last_name, length(last_name),
	trim(last_name) as trimmed_last_name, length(trim(last_name)) as length_trimmed_last_name
from deduplicated where id = 8 or id = 9;



select 
	replace(first_name, substr(first_name, 4, length(first_name)), substring(last_name, 1,3)) 
from deduplicated;



select now();

select current_date;

select current_time;

alter table deduplicated
add column dob date;

update deduplicated
set dob = 
	case id
		when 1 then cast('1998-02-23' as date)
		when 2 then cast('1998-03-31' as date)
		else cast('1900-01-01' as date)
	end;
    
    
select datediff(current_date, cast(dob as date)) from deduplicated;