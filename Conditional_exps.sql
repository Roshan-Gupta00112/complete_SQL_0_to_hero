select * from customer


 -- General case statement

select customer_id, 
	case when (customer_id between 1 and 50) then 'Super Premium'
		when (customer_id between 51 and 100) then 'Premium'
		when (customer_id between 101 and 150) then 'Plus'
		else 'General'
	END  as "Customer Class"
from customer
order by customer_id
limit 200



select customer_id, 
	case when (customer_id between 1 and 50) then 'Super Premium'
		when (customer_id between 51 and 100) then 'Premium'
		when (customer_id between 101 and 150) then 'Plus'
		else 'General'
	END  as "Customer Class"
from customer
order by customer_id
limit 200





-- CASE EXPRESSION SYNTAX
select customer_id,
	case customer_id
		when 1 then 'Winner'
		when 2 then 'Runner UP'
		when 3 then 'Second Runner Up'
		Else 'Normal'
	END as "Winning Status"
from customer
order by customer_id
limit 5





select distinct rental_rate from film
-- 2.99
-- 4.99
-- 0.99


select count(rental_rate) as "Low budget movie"
from film
where rental_rate = 0.99
group by rental_rate
-- 341

select count(rental_rate) as "Regular budget movie"
from film
where rental_rate = 2.99
group by rental_rate
-- 323

select count(rental_rate) as "Premium budget movie"
from film
where rental_rate = 4.99
group by rental_rate
-- 336


select
	sum(case rental_rate 
			when 0.99 then 1
			else 0
		end
		) as "Low Budget Movie",
	sum(case rental_rate
			when 2.99 then 1
			else 0
		end
		) as "Regular Budget Movie",
	sum(case rental_rate
			when 4.99 then 1
			else 0
		end
		) as "Premium Budget Movie"
from film
-- 341	323	336
-- 64 msec


select 
	count(*) filter (where rental_rate = 0.99) as "Low Budget Movie",
	count(*) filter (where rental_rate = 2.99) as "Regular Budget Movie",
	count(*) filter (where rental_rate = 4.99) as "Premium Budget Movie"
from film
-- 341	323	336
-- 75 msec.


select 
	count(1) filter (where rental_rate = 0.99) as "Low Budget Movie",
	count(1) filter (where rental_rate = 2.99) as "Regular Budget Movie",
	count(1) filter (where rental_rate = 4.99) as "Premium Budget Movie"
from film
-- 341	323	336
-- 70 msec



select distinct rating from film
-- "PG-13"
-- "PG"
-- "R"

select 
	sum(case rating
			when 'R' then 1
			else 0
		end
		) as r,
	sum (case rating
			when 'PG' then 1
			else 0
		end
		) as pg,
	sum (case rating
			when 'PG-13' then 1
			else 0
		end
		) as pg13
from film
-- 195	194	223


select 
	count(*) filter (where rating = 'R') as r,
	count(*) filter (where rating = 'PG') as pg,
	count(*) filter (where rating = 'PG-13') as pg13
from film
-- 195	194	223



select '5'

select cast('5' as integer) as new_int

select '5':: integer


select pg_typeof('5')

select pg_typeof(5)


SELECT column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'film';


SELECT * FROM pg_catalog.pg_tables;




select inventory_id, length(cast(inventory_id as text)) from inventory

select inventory_id, char_length(cast(inventory_id as text)) from inventory



select inventory_id, length(cast(inventory_id as varchar)) from inventory

select inventory_id, char_length(cast(inventory_id as varchar)) from inventory

select 
	inventory_id, cast(inventory_id as varchar) as new_inventory_id,
	length(cast(inventory_id as varchar)) 
from inventory





create view customer_info as
select first_name, last_name, address
from customer
join address
on public.customer.address_id = public.address.address_id


select * from public.customer_info


create or replace view customer_info as
	select first_name, last_name, address, phone
	from customer
	join address
	on customer.address_id = address.address_id
