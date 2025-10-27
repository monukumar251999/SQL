-- create table candidates (
-- emp_id int,
-- experience varchar(20),
-- salary int
-- );
-- delete from candidates;
-- insert into candidates values
-- (1,'Junior',10000),(2,'Junior',15000),(3,'Junior',40000),(4,'Senior',16000),(5,'Senior',20000),(6,'Senior',50000);

with candicate_data as (
select *,sum(salary) over(partition by experience order by salary asc) as running_salary from candidates 
),
senior as (
SELECT  * from candicate_data where running_salary  <= 70000 and experience  = 'Senior'
)
select * from candicate_data where experience ='Junior' and running_salary  <= (select sum(salary) from senior )
union 
select * from senior 
