-- -- 1️⃣ Create the table
-- CREATE TABLE purchase_history (
--     userid INT,
--     productid INT,
--     purchasedate DATE
-- );


-- INSERT INTO purchase_history (userid, productid, purchasedate) VALUES
-- (1, 1, '2012-01-23'),
-- (1, 2, '2012-01-23'),
-- (1, 3, '2012-01-25'),
-- (2, 1, '2012-01-23'),
-- (2, 2, '2012-01-23'),
-- (2, 2, '2012-01-25'),
-- (2, 4, '2012-01-25'),
-- (3, 4, '2012-01-23'),
-- (3, 1, '2012-01-23'),
-- (4, 1, '2012-01-23'),
-- (4, 2, '2012-01-25');

select userid from purchase_history 
group by userid 
having count(distinct purchasedate) >1 and count(productid) = count(distinct productid)
