--you are given a table tasks,you need to find the contiounous span of success and failure.

create table tasks (
date_value date,
state varchar(10)
);

insert into tasks  values ('2019-01-01','success'),('2019-01-02','success'),('2019-01-03','success'),('2019-01-04','fail')
,('2019-01-05','fail'),('2019-01-06','success')

--Solution:

with all_data as (
select *
,DATEADD(day,-1*ROW_NUMBER() over(partition by state order by date_value),date_value) as group_date
from tasks
)
select min(date_value) as span_start,max(date_value) as span_end,state from all_data
group by group_date,state
order by span_start
