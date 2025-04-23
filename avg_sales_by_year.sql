/*
recursive Cte
find the average sales by year
*/

create table sales (
product_id int,
period_start date,
period_end date,
average_daily_sales int
);

insert into sales values(1,'2019-01-25','2019-02-28',100),(2,'2018-12-01','2020-01-01',10),(3,'2019-12-01','2020-01-31',1);

with cte as (
select product_id,period_start,period_end,average_daily_sales
 from sales
union all
select product_id,dateadd(day,1,period_start) as period_start,period_end,average_daily_sales
from cte
where period_start <= period_end
)
select product_id,year(period_start),sum(average_daily_sales) as total_sales from cte
group by product_id,year(period_start)
order by product_id,year(period_start)
option (maxrecursion 1000)
