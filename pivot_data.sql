-- create table players_location
-- (
-- name varchar(20),
-- city varchar(20)
-- );
-- delete from players_location;
-- insert into players_location
-- values ('Sachin','Mumbai'),('Virat','Delhi') , ('Rahul','Bangalore'),('Rohit','Mumbai'),('Mayank','Bangalore');

select max(case when city='Bangalore' then name end) as Bangalore,
 max(case when city='Mumbai' then name end) as Mumbai,
max(case when city='Delhi' then name end) as Delhi
from  
(
select *,row_number() OVER(partition by city order by name)  as player_group  from players_location
) A
group by A.player_group 
order by A.player_group 
