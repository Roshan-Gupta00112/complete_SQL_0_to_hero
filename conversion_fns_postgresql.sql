select * from deduplicated;


-- CAST()
select cast(dob as text), cast("annual_package(in lpa)" as varchar),
cast("lag(in yrs)" as varchar) 
from deduplicated;