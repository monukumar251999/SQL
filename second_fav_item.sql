/*
Market Analysis:
  write an sql query to find for each seller, whether the brand of the second (by date ) they sold is their favourate brand.
  If the seller sold less sold less than the two items report the answers for that seller  as no

  OP:
  seller_id   2nd_fav_item
   1            YES/NO
   2            YES/No

*/
  


create table users_brand (
user_id         int     ,
 join_date       date    ,
 favorite_brand  varchar(50));

 create table orders (
 order_id       int     ,
 order_date     date    ,
 item_id        int     ,
 buyer_id       int     ,
 seller_id      int 
 );

 create table items
 (
 item_id        int     ,
 item_brand     varchar(50)
 );


 insert into users_brand values (1,'2019-01-01','Lenovo'),(2,'2019-02-09','Samsung'),(3,'2019-01-19','LG'),(4,'2019-05-21','HP');

 insert into items values (1,'Samsung'),(2,'Lenovo'),(3,'LG'),(4,'HP');

 insert into orders values (1,'2019-08-01',4,1,2),(2,'2019-08-02',2,1,3),(3,'2019-08-03',3,2,3),(4,'2019-08-04',1,4,2)
 ,(5,'2019-08-04',1,3,4),(6,'2019-08-05',2,2,4);



 with order_data as (
select *
,ROW_NUMBER() over(partition by seller_id order by order_date asc) as rn
from orders
)
select ub.user_id as seller_id,case when i.item_brand = ub.favorite_brand then 'YES' else 'NO' end as fav_2nd_item from users_brand ub 
Left join order_data od on ub.user_id = od.seller_id and rn=2
left join items i on i.item_id = od.item_id


