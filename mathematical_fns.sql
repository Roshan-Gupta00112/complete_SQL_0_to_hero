use test;

set sql_safe_updates = 0;
-- This command to disable safe update mode




SELECT @@autocommit;
-- If it returns 1, changes are saved automatically.
-- If 0, you must run COMMIT manually.


-- COMMIT;


SHOW TABLE STATUS WHERE Name = 'deduplicated';
-- retrieves metadata about the deduplicated table from the MySQL database.
-- Look at the Engine column:
-- If InnoDB, COMMIT might be required.
-- If MyISAM, no need to commit.




select * from deduplicated;



update deduplicated
set dob = 
	case id
		when 1 then cast('1998-02-23' as date)
		when 2 then cast('1998-03-31' as date)
		else cast('1900-01-01' as date)
	end;




alter table deduplicated
drop column `annual_package(in lpa)`;

alter table deduplicated
add column annual_package varchar(35);

alter table deduplicated
modify column annual_package int;





alter table deduplicated
add column `annual_package(in lpa)` float;


alter table deduplicated
add column company varchar(25);


update deduplicated
set company = 
	case id
		when 1 then 'infinx'
        when 2 then 'fintech'
        when 3 then 'e-commerce'
        when 4 then 'cloud'
        when 5 then 'tech-innovation'
        when 6 then 'Apple'
        else 'xyz'
	end;
    
    
update deduplicated
set `annual_package(in lpa)` = 
	case company
		when 'infinx' then 8.35
		when 'fintech' then 17.86
		when 'e-commerce' then 32.52
		when 'cloud' then 45.45
		when 'tech-innovation' then 57.38
		when 'Apple' then 75.32
		else 150
	end;



alter table deduplicated
add column `lag(in yrs)` int;


update deduplicated
set `lag(in yrs)` =
	case id
		when 1 then -5
        when 2 then -3
        when 3 then -2
        when 4 then -1
        else 0
	end;
    
    
desc deduplicated;


-- ABS ()
select id, `lag(in yrs)`, abs(`lag(in yrs)`) from deduplicated;


-- ROUND()
select id, `annual_package(in lpa)`, round(`annual_package(in lpa)`, 1) from deduplicated;


-- TO change Data Type 
alter table deduplicated
modify column `annual_package(in lpa)` numeric(10, 2);




-- FLOOR()
select id, `annual_package(in lpa)`, floor(`annual_package(in lpa)`)
from deduplicated;



-- CEIL()
select  id, `annual_package(in lpa)`, CEIL(`annual_package(in lpa)`)
from deduplicated;



-- POWER(), SQRT() 
select id, power(id, 2), sqrt(id)
from deduplicated;

        