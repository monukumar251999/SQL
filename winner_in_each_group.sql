--write an sql code to find winner in each group
--winner in each group is the player who scored maximum total points within the groups. in case of tie the lowest player_id wins.

create table players
(player_id int,
group_id int)

insert into players values (15,1);
insert into players values (25,1);
insert into players values (30,1);
insert into players values (45,1);
insert into players values (10,2);
insert into players values (35,2);
insert into players values (50,2);
insert into players values (20,3);
insert into players values (40,3);

create table matches
(
match_id int,
first_player int,
second_player int,
first_score int,
second_score int)

insert into matches values (1,15,45,3,0);
insert into matches values (2,30,25,1,2);
insert into matches values (3,30,15,2,0);
insert into matches values (4,40,20,5,2);
insert into matches values (5,35,50,1,1);

select * from players;

select * from matches;

with matches_details as (
select first_player as player_id,first_score as score from matches
union all
select second_player as player_id,second_score as score from matches
),
player_details as(
select p.group_id,m.player_id,SUM(score) as total_score from players p join matches_details m 
on p.player_id = m.player_id
group by p.group_id,m.player_id
)
,final as (
select *,DENSE_RANK() over(partition by group_id order by total_score desc,player_id) as rn from player_details
)
select group_id,player_id,total_score from final where rn=1
