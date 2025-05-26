-- a company allows only once to visited floor but if a person has different id the can enter as many times as wants. find the name, total visit, most visited floorand resources used.

-- create table entries ( 
-- name varchar(20),
-- address varchar(20),
-- email varchar(20),
-- floor int,
-- resources varchar(10));

-- insert into entries 
-- values ('A','Bangalore','A@gmail.com',1,'CPU'),('A','Bangalore','A1@gmail.com',1,'CPU'),('A','Bangalore','A2@gmail.com',2,'DESKTOP')
-- ,('B','Bangalore','B@gmail.com',2,'DESKTOP'),('B','Bangalore','B1@gmail.com',2,'DESKTOP'),('B','Bangalore','B2@gmail.com',1,'MONITOR')

--Solution:
with floor_data as (
select name,floor as most_visited_floor
,RANK() over(partition by name order by count(*) desc) as rn 
from entries
group by name,floor
),
floor as(select name,most_visited_floor from floor_data where rn=1),

distinct_resources as(select distinct name,resources from entries),

resource_agg as (select name,STRING_AGG(resources,',') as resources_used from distinct_resources group by name)

select e.name,COUNT(floor) as total_floor_visited,f.most_visited_floor,ra.resources_used from entries e
join floor f on e.name = f.name
join resource_agg ra on ra.name = e.name
group by e.name,f.most_visited_floor,ra.resources_used

