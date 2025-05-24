-- finding new and repeat customers

create table icc_world_cup
(
Team_1 Varchar(20),
Team_2 Varchar(20),
Winner Varchar(20)
);
INSERT INTO icc_world_cup values('India','SL','India');
INSERT INTO icc_world_cup values('SL','Aus','Aus');
INSERT INTO icc_world_cup values('SA','Eng','Eng');
INSERT INTO icc_world_cup values('Eng','NZ','NZ');
INSERT INTO icc_world_cup values('Aus','India','India');

select * from icc_world_cup;

with teams_data as (
select Team_1 as team,case when Team_1=Winner then 1 else 0 end as win from icc_world_cup
union all
select Team_2 as team,case when Team_2=Winner then 1 else 0 end as win from icc_world_cup
)

select team,count(*) as total_matches,SUM(win) as no_of_win,count(*)-SUM(win) as no_of_loss from teams_data
group by team ;
