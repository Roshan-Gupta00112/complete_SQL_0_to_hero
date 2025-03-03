SELECT rolname, rolpassword FROM pg_authid


SELECT * from payment order by payment_id ASC limit 10 

SELECT * from payment




select customer_id, sum(amount) as "Total Expenditure", 
	case 
		when sum(amount) >= 200 then 'Super Premium'
		when sum(amount) >= 150 then 'Premium'
		else 'General'
	end as "customer status"
from payment
group by customer_id
order by sum(amount) desc
limit 30


select customer_id, sum(amount) as "Total Expenditure", 
	case 
		when sum(amount) between 200 and 500 then 'Super Premium'
		when sum(amount) between 150 and 199 then 'Premium'
		else 'General'
	end as "customer status"
from payment
group by customer_id
order by sum(amount) desc
limit 30




select 
	first_name, last_name, customer.customer_id, sum(amount) as "Total Expenditure", 
	case 
		when sum(amount) >= 200 then 'Super Premium'
		when sum(amount) >= 150 then 'Premium'
		else 'General'
	end as "customer status"
from customer
join payment
on customer.customer_id = payment.customer_id
group by first_name, last_name, customer.customer_id
order by sum(amount) desc
limit 30

