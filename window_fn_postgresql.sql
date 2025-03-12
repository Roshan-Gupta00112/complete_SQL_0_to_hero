select * from deduplicated
order by id

alter table deduplicated
add column current_company varchar(30);

update deduplicated
set current_company = 
	case id
		when 1 then 'infinx'
		when 2 then 'fintech'
		when 3 then 'e-commerce'
		when 4 then 'cloud'
		when 5 then 'tech-innovation'
		when 6 then 'intel'
		when 7 then 'Apple'
		else 'xyz'
	end;
	

update deduplicated
set "annual_package(in lpa)" = 
	case id
		when 1 then 8.35
		when 2 then 17.86
		when 3 then 32.52
		when 4 then 45.45
		when 5 then 57.38
		when 6 then 75.32
		when 7 then 150
		when 8 then 150
		when 9 then 200
	end;


			

-- RANK()
select id, "annual_package(in lpa)", 
	rank() over (order by "annual_package(in lpa)") as rank
from deduplicated




-- DENSE_RANK()
select id, "annual_package(in lpa)", 
	dense_rank() over (order by "annual_package(in lpa)") as rank
from deduplicated




-- ROW_NUMBER()
select id, "annual_package(in lpa)", 
	row_number() over (order by "annual_package(in lpa)") as rank
from deduplicated




-- LEAD()
select id, first_name, "annual_package(in lpa)", 
LEAD("annual_package(in lpa)") 
	over (partition by trim(first_name) order by "annual_package(in lpa)")
from deduplicated
order by id;


select id, first_name, "annual_package(in lpa)", 
LEAD("annual_package(in lpa)") 
	over (order by "annual_package(in lpa)")
from deduplicated
order by id;




-- LAG()
select id, first_name, "annual_package(in lpa)",
LEAD("annual_package(in lpa)") 
	over (partition by trim(first_name) order by "annual_package(in lpa)" desc)
	as next_row_value,
LAG("annual_package(in lpa)") 
	over (partition by trim(first_name) order by "annual_package(in lpa)")
	as previous_row_value
from deduplicated
order by id;