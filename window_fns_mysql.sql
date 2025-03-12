select * from deduplicated;

alter table deduplicated
rename column company to curr_company;

alter table deduplicated
drop column annual_package;

update deduplicated
set `annual_package(in lpa)` = 200
where id = 9;


-- RANK()
select id, `annual_package(in lpa)`, 
rank() over (order by `annual_package(in lpa)` asc) as growth_rank
from deduplicated;



-- DENSE_RANK()
select id, `annual_package(in lpa)`,
dense_rank() over (order by `annual_package(in lpa)`) as growth_rank
from deduplicated;


select id, `annual_package(in lpa)`,
row_number() over (order by `annual_package(in lpa)` asc) as growth_number
from deduplicated;



-- LEAD()
select id, `annual_package(in lpa)`, 
lead(`annual_package(in lpa)`) over (order by `annual_package(in lpa)` asc) 
	as next_target_package
from deduplicated;


select id, `annual_package(in lpa)`, 
lead(`annual_package(in lpa)`) over (partition by id order by `annual_package(in lpa)` asc) 
	as next_target_package
from deduplicated;



-- LAG()
select curr_company, `annual_package(in lpa)`, 
lag(`annual_package(in lpa)`) over (order by `annual_package(in lpa)`) as prev_package
from deduplicated;



select  curr_company, `annual_package(in lpa)`,
lead(`annual_package(in lpa)`) over (order by `annual_package(in lpa)`) as 'Next Target Package',
lag(`annual_package(in lpa)`) over (order by `annual_package(in lpa)`) as 'Prev Package'
from deduplicated;