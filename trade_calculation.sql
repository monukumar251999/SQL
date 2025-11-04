-- Create Table Trade_tbl(
-- TRADE_ID varchar(20),
-- Trade_Timestamp time,
-- Trade_Stock varchar(20),
-- Quantity int,
-- Price Float
-- )

-- Insert into Trade_tbl Values('TRADE1','10:01:05','ITJunction4All',100,20)
-- Insert into Trade_tbl Values('TRADE2','10:01:06','ITJunction4All',20,15)
-- Insert into Trade_tbl Values('TRADE3','10:01:08','ITJunction4All',150,30)
-- Insert into Trade_tbl Values('TRADE4','10:01:09','ITJunction4All',300,32)
-- Insert into Trade_tbl Values('TRADE5','10:10:00','ITJunction4All',-100,19)
-- Insert into Trade_tbl Values('TRADE6','10:10:01','ITJunction4All',-300,19)
-- Insert into Trade_tbl Values('TRADE1','10:01:05','Infosys',100,20)
-- Insert into Trade_tbl Values('TRADE2','10:01:06','Infosys',20,15)

select * from Trade_tbl



select t1.Trade_Stock,t1.TRADE_ID,t2.TRADE_ID,t1.Trade_Timestamp ,t2.Trade_Timestamp ,t1.Price ,t2.Price   from Trade_tbl t1 join Trade_tbl t2 on t1.Trade_Stock = t2.Trade_Stock
where t1.Trade_Timestamp < t2.Trade_Timestamp and TIMESTAMPDIFF(SECOND,t1.Trade_Timestamp,t2.Trade_Timestamp ) < 10 and abs((t1.Price -t2.Price ) * 1.0/t1.Price ) * 100 >20
