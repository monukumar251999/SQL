Table: Weather

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| recordDate    | date    |
| temperature   | int     |
+---------------+---------+
id is the column with unique values for this table.
There are no different rows with the same recordDate.
This table contains information about the temperature on a certain day.
 

Write a solution to find all dates' id with higher temperatures compared to its previous dates (yesterday).

Return the result table in any order.

Solution:
# Write your MySQL query statement below
select w.id from Weather w join Weather x 
on datediff(w.recordDate,x.recordDate)=1
where w.temperature > x.temperature  

Solution 2: 
select Id from ( 
select id,recordDate ,lag(recordDate,1) over(order by recordDate) as previous_date,temperature, lag(temperature,1) over(order by recordDate) as previous_temp from Weather

) a  where recordDate = DATE_ADD(previous_date, INTERVAL 1 DAY) and temperature >previous_temp 
