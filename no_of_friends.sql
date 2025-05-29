-- write a query to find person_id,name,no_of_friends, sum_of_friends_marks who has greater than equal to 100

select * from person;
select * from friends;

select f.person_id,q.name,count(friend_id) as total_friends ,sum(p.score) as friends_marks from friends  f 
join person p on f.friend_id = p.person_id
join person q on f.person_id = q.person_id
group by f.person_id,q.name
having sum(p.score) >= 100;
