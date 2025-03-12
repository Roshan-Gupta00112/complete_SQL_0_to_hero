select * from deduplicated;



select user();
-- root@localhost


select current_user();
-- root@localhost



select session_user();
-- root@localhost



select database();
-- test


select version();
-- 8.3.0


-- To get columns & Theirs Data Type
select column_name, data_type
from information_schema.columns
where table_name = 'deduplicated';


-- To get the data type of a column 
SELECT DATA_TYPE 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'deduplicated' 
AND COLUMN_NAME = 'annual_package(in lpa)';
