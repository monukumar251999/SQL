

create table table1(
id1 int
);


create table table2(
id2 int
);


insert into table1 values(3);

insert into table2 values(4);

select * from table1;
select * from table2;

--Inner join

select * from table1 inner join table2 on id1 = id2
select * from table1 inner join table2 on id1 = id2

--No of records
select 2 *3 + 1 

 -- Left join
 select * from table1 left join table2 on id1 = id2

 --No of records in left join

 select 2 *3 + 1+ 1 + 1

 -- Right Join

 select * from table1 right join table2 on id1 = id2

 -- No of records in Right join
  select 3 *2 + 1 + 1 + 1


  -- Outer join 
  select * from table1 full outer join table2 on id1 = id2

  -- No of records in Right join

  select 2 * 3 + 1 + 2 + 2


