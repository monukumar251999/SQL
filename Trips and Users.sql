Table: Trips

+-------------+----------+
| Column Name | Type     |
+-------------+----------+
| id          | int      |
| client_id   | int      |
| driver_id   | int      |
| city_id     | int      |
| status      | enum     |
| request_at  | varchar  |     
+-------------+----------+
id is the primary key (column with unique values) for this table.
The table holds all taxi trips. Each trip has a unique id, while client_id and driver_id are foreign keys to the users_id at the Users table.
Status is an ENUM (category) type of ('completed', 'cancelled_by_driver', 'cancelled_by_client').
 

Table: Users

+-------------+----------+
| Column Name | Type     |
+-------------+----------+
| users_id    | int      |
| banned      | enum     |
| role        | enum     |
+-------------+----------+
users_id is the primary key (column with unique values) for this table.
The table holds all users. Each user has a unique users_id, and role is an ENUM type of ('client', 'driver', 'partner').
banned is an ENUM (category) type of ('Yes', 'No').
 

The cancellation rate is computed by dividing the number of canceled (by client or driver) requests with unbanned users by the total number of requests with unbanned users on that day.

Write a solution to find the cancellation rate of requests with unbanned users (both client and driver must not be banned) each day between "2013-10-01" and "2013-10-03" with at least one trip. Round Cancellation Rate to two decimal points.

Return the result table in any order.

Solution:
# Write your MySQL query statement below
select 
    request_at as "Day",
    round(
        (sum(case when status = "cancelled_by_driver" or status = "cancelled_by_client" then 1 else 0 end) / count(status)), 2
    ) as "Cancellation Rate"
from
    Trips
where 
    client_id not in (select users_id from Users where role = 'client' and banned ='Yes') 
and 
    driver_id not in (select users_id from Users where role = 'driver' and banned ='Yes') 
 
and 
    request_at >= "2013-10-01" and request_at <= "2013-10-03"
group by 
    request_at

Solution 2:

 select * from Trips;
select * from Users;


with trips_data as(
select  request_at, sum(case when status in('cancelled_by_driver','cancelled_by_client') then 1 else 0 end) 
as cancelled_trips, count(1) as total_trips from Trips
where driver_id not in(select users_id from Users where banned='Yes') and client_id not in(select users_id from Users where banned='Yes')
group by request_at
)
select request_at,round((cancelled_trips * 1.0/total_trips)*100 ,2) as cancellation_rate from trips_data
