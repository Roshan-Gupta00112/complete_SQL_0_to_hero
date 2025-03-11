select * from deduplicated
order by id


alter table deduplicated
add column "annual_package(in lpa)" int


alter table deduplicated
drop column "annual_package(in lpa)"


alter table deduplicated
alter column "annual_package(in lpa)" set data type float;
-- Modify will not work in PostgreSQL

update deduplicated
set "annual_package(in lpa)" = 
	case id
		when 1 then 8.35
		when 2 then 17.86
		when 3 then 32.76
		when 4 then 45.45
		when 5 then 57.32
		when 6 then 75.36
		else 150
	end;


alter table deduplicated
add column "lag(in yrs)" int;

alter table deduplicated


-- update deduplicated
-- set "lag(in yrs)" = 2
-- where id = 3;

-- update deduplicated
-- set "lag(in yrs)" = 1
-- where id = 4

update deduplicated
set "lag(in yrs)" = 
	case id
		when 1 then -5
		when 2 then -3
		when 3 then -2
		when 4 then -1
		else 0
	end;


-- To get the Data Type
select pg_typeof("annual_package(in lpa)") from deduplicated


-- To change the Data type
alter table deduplicated
alter column "annual_package(in lpa)" set data type Numeric;



-- ABS()
select id, "lag(in yrs)", abs("lag(in yrs)") from deduplicated
order by id




-- ROUND()
select id, "annual_package(in lpa)", round("annual_package(in lpa)", 1)
from deduplicated
order by id



-- FLOOR()
select id, "annual_package(in lpa)", floor("annual_package(in lpa)")
from deduplicated
order by id



-- CEIL()
select id, "annual_package(in lpa)", CEIL("annual_package(in lpa)")
from deduplicated
order by id




-- POWER(), SQRT()
select id, POWER(id, 2), SQRT(id)
from deduplicated
order by id