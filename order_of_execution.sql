EXPLAIN ANALYZE SELECT * FROM customer WHERE customer_id = 100;


EXPLAIN SELECT * FROM customer WHERE customer_id = 100;


select * 
from customer
order by customer_id
limit 10
-- This will give output for customer_ids 1 to 10




select * 
from customer
order by customer_id
limit 10 offset 10
-- While this will give output for customer_ids from 11 to 20.
-- This is because offset will ignore the first 10 results