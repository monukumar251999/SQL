-- Total sales by year
/*
create table sales (
product_id int,
period_start date,
period_end date,
average_daily_sales int
);

insert into sales values(1,'2019-01-25','2019-02-28',100),(2,'2018-12-01','2020-01-01',10),(3,'2019-12-01','2020-01-31',1);
*/

-- Solution:
with cte as(
select min(period_start) as start_date,max(period_end) as end_date from sales
union all
select DATEADD(day,1,start_date),end_date from cte 
where start_date < end_date
)
select product_id, YEAR(start_date) as reporting_year,sum(average_daily_sales)  as total_sales from cte e 
inner join sales s on start_date between period_start and period_end
group by product_id, YEAR(start_date)
order by product_id, YEAR(start_date)
option (MAXRECURSION 1000)
