
--find the new and repeat customer 
with customer_data as(
select * ,
count(order_date) over(partition by customer_id order by customer_id) as total_count
from customer_orders)
select distinct customer_id,case when total_count >1 then 'repeat customer' else 'new customer' end as customer_type from customer_data;


with customer_data as (
select customer_id,min(order_date) as first_visit from customer_orders
group by customer_id)
select order_date,sum(case when order_date= first_visit then 1 else 0 end) as new_customer,sum(case when order_date!= first_visit then 1 else 0 end) as repeat_customer  from customer_orders c inner join customer_data cd on c.customer_id= cd.customer_id
group by order_date

