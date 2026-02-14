-- create table drivers(id varchar(10), start_time time, end_time time, start_loc varchar(10), end_loc varchar(10));
-- insert into drivers values('dri_1', '09:00', '09:30', 'a','b'),('dri_1', '09:30', '10:30', 'b','c'),('dri_1','11:00','11:30', 'd','e');
-- insert into drivers values('dri_1', '12:00', '12:30', 'f','g'),('dri_1', '13:30', '14:30', 'c','h');
-- insert into drivers values('dri_2', '12:15', '12:30', 'f','g'),('dri_2', '13:30', '14:30', 'c','h');

WITH ride_data AS (
  SELECT 
    id,
    start_time,
    start_loc,
    end_loc,
    LAG(end_loc) OVER (PARTITION BY id ORDER BY start_time) AS prev_loc
  FROM drivers
)
SELECT 
  id,
  COUNT(*) AS total_rides
  ,sum(case when start_loc = prev_loc  then 1 else 0 end) as profit_rides
FROM ride_data
GROUP BY id
ORDER BY id;

