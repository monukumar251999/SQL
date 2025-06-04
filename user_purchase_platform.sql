/*
User purchase paltform:
the table logs, spending history of users that make purchase from an online shopping website which has a desktop and a mobile application.
write an SQl query, to find the total number of user and the total amount spent using mobile only, desktop only and both mobile and desktop together for each date.

*/



-- Solution:

with all_data as (
select spend_date,user_id,max(PLATFORM) as platform,SUM(amount) as amount from spending
group by spend_date,user_id 
having count(distinct platform)=1
union all 
select spend_date,user_id,'both' as platform,SUM(amount) as amount from spending
group by spend_date,user_id 
having count(distinct platform)=2
union all 
select distinct spend_date,null as user_id,'both' as platform,0 as amount from spending
group by spend_date,user_id 
)
select spend_date,platform,sum(amount) as total_amount, count(distinct user_id) from all_data
group by spend_date,platform
order by spend_date,platform
