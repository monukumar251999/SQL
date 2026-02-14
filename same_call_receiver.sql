-- create table phonelog(
--     Callerid int, 
--     Recipientid int,
--     Datecalled datetime
-- );

-- insert into phonelog(Callerid, Recipientid, Datecalled)
-- values(1, 2, '2019-01-01 09:00:00.000'),
--        (1, 3, '2019-01-01 17:00:00.000'),
--        (1, 4, '2019-01-01 23:00:00.000'),
--        (2, 5, '2019-07-05 09:00:00.000'),
--        (2, 3, '2019-07-05 17:00:00.000'),
--        (2, 3, '2019-07-05 17:20:00.000'),
--        (2, 5, '2019-07-05 23:00:00.000'),
--        (2, 3, '2019-08-01 09:00:00.000'),
--        (2, 3, '2019-08-01 17:00:00.000'),
--        (2, 5, '2019-08-01 19:30:00.000'),
--        (2, 4, '2019-08-02 09:00:00.000'),
--        (2, 5, '2019-08-02 10:00:00.000'),
--        (2, 5, '2019-08-02 10:45:00.000'),
--        (2, 4, '2019-08-02 11:00:00.000');

with call_details as (
select *,first_value(Recipientid) over(partition by Callerid,date(datecalled) order by datecalled ) as first_call
,first_value(Recipientid) over(partition by Callerid,date(datecalled) order by datecalled desc ) as last_call
from phonelog 
)
select distinct Callerid ,DATE (Datecalled ) as Datecalled,first_call  as Recipient from call_details where first_call= last_call 

--second solution:

with call_details as (
select Callerid ,DATE(Datecalled ) as Datecalled,MIN(Datecalled ) as first_call,MAX(Datecalled ) as last_call from phonelog 
group by Callerid ,DATE(Datecalled )
)

select p.callerid,date(p.datecalled),p2.Recipientid  from call_details p 
join phonelog p2 on p.Callerid = p2.Callerid and p2.Datecalled = p.first_call
join phonelog p3 on p.Callerid = p3.Callerid and p3.Datecalled = p.last_call
where p2.Recipientid=p3.Recipientid
