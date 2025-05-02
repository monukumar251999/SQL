Table: Logs

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| num         | varchar |
+-------------+---------+
In SQL, id is the primary key for this table.
id is an autoincrement column starting from 1.
 

Find all numbers that appear at least three times consecutively.

Return the result table in any order.

Solution:
# Write your MySQL query statement below
select distinct l1.num as ConsecutiveNums
from Logs l1, Logs l2, Logs l3
where (l1.num = l2.num and l2.num = l3.num) and ( l2.id = 1+l1.id and l3.id = 2+l1.id) ;

Solution 2:
select distinct num as ConsecutiveNums  from (
select id,lag(num,1) over(order by id) as previous,num,lead(num,1) over(order by id) as next from logs) a
where a.previous = a.num and a.num = a.next 
