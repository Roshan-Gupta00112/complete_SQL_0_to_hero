select * from deduplicated;

desc deduplicated;


select cast(first_name as char), cast(dob as char), cast(`lag(in yrs)` as char), 
cast(`annual_package(in lpa)` as char)
from deduplicated;


select convert(first_name, char), convert(dob, char), convert(`lag(in yrs)`, char), 
convert(`annual_package(in lpa)`, char)
from deduplicated;