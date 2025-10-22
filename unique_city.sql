-- create table business_city (
-- business_date date,
-- city_id int
-- );
-- delete from business_city;
-- insert into business_city
-- values(cast('2020-01-02' as date),3),(cast('2020-07-01' as date),7),(cast('2021-01-01' as date),3),(cast('2021-02-03' as date),19)
-- ,(cast('2022-12-01' as date),3),(cast('2022-12-15' as date),3),(cast('2022-02-28' as date),12);


with cte1 as (
select year(business_date) as year,city_id  from business_city
)

select t1.year,count(distinct case when t2.city_id is null then t1.city_id end) from cte1 t1 left join cte1 t2 on t1.city_id = t2.city_id and t1.year > t2.year
group by t1.year
