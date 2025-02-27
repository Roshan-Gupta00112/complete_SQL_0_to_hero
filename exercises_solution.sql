-- 1
select * from cd.facilities



-- 2
select name, membercost from cd.facilities


-- 3
select name, membercost from cd.facilities where membercost > 0



-- 4
select 
	facid, name as "facility name", membercost as "member cost",
	monthlymaintenance as "monthly maintenance"
from cd.facilities
where membercost > 0 and membercost < monthlymaintenance / 50



-- 5
select * from cd.facilities where name Ilike '%Tennis%'




-- 6
select * from cd.facilities where facid = 1 or facid = 5

select * from cd.facilities where facid in (1, 5)




-- 7
select memid, surname, firstname, joindate
from cd.members where joindate >= '2012-09-01'




-- 8 (Guest is not coming at the end)
select distinct surname from cd.members order by surname limit 10

select distinct surname 
from cd.members 
order by surname limit 10

select distinct surname 
from cd.members 
limit 10



-- 9
select joindate from cd.members order by joindate desc limit 1
-- "2012-09-26 18:08:45"

select max(joindate) from cd.members
-- "2012-09-26 18:08:45"




-- 10
select count(facid) from cd.facilities where guestcost >= 10




-- 11
select facid, sum(slots) as total_slots
from cd.bookings
where to_char(starttime, 'Month yyyy') = 'September 2012'
group by facid
order by sum(slots)


select facid, sum(slots) as total_slots
from cd.bookings
where  extract(month from starttime) = '9' and
extract(year from starttime) = '2012'
group by facid
order by sum(slots)






-- 12
select facid, sum(slots) as "total slots"
from cd.bookings
group by facid
having sum(slots) > 1000
order by facid





-- 13
select starttime, name
from cd.bookings
join cd.facilities
on cd.bookings.facid = cd.facilities.facid
where name ilike '%Tennis Court%' 
	and to_char(starttime, 'yyyy-mm-dd') = '2012-09-21'
order by starttime

select starttime, name
from cd.bookings
join cd.facilities
on cd.bookings.facid = cd.facilities.facid
where name ilike '%Tennis Court%' 
and starttime >= '2012-09-21' and starttime < '2012-09-22'
order by starttime


-- 14
select starttime from cd.bookings
join cd.members
on cd.bookings.memid = cd.members.memid
where firstname = 'David' and surname = 'Farrell' 


