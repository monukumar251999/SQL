-- create table tbl_orders (
-- order_id integer,
-- order_date date
-- );

-- create table tbl_orders_copy (
-- order_id integer,
-- order_date date
-- );

-- insert into tbl_orders
-- values (1,'2022-10-21'),(2,'2022-10-22'),
-- (3,'2022-10-25'),(4,'2022-10-25');

-- insert into tbl_orders_copy
-- values (1,'2022-10-21')

-- select * into tbl_orders_copy from  tbl_orders;

-- select * from tbl_orders_copy

-- select * from tbl_orders;
-- insert into tbl_orders
-- values (5,'2022-10-26'),(6,'2022-10-26');
-- delete from tbl_orders where order_id=1;



-- Records only in tbl_orders
SELECT c.*, 'I' as flag
FROM tbl_orders c
LEFT JOIN tbl_orders_copy d
ON c.order_id = d.order_id
WHERE d.order_id IS NULL

UNION ALL

-- Records only in tbl_orders_copy
SELECT  d.*,'D' as flag
FROM tbl_orders_copy d
LEFT JOIN tbl_orders c
ON c.order_id = d.order_id
WHERE c.order_id IS NULL;


