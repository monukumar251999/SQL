-- create table students
-- (
-- student_id int,
-- student_name varchar(20)
-- );
-- insert into students values
-- (1,'Daniel'),(2,'Jade'),(3,'Stella'),(4,'Jonathan'),(5,'Will');

-- create table exams
-- (
-- exam_id int,
-- student_id int,
-- score int);

-- insert into exams values
-- (10,1,70),(10,2,80),(10,3,90),(20,1,80),(30,1,70),(30,3,80),(30,4,90),(40,1,60)
-- ,(40,2,70),(40,4,80);


with exam_cap as (
select exam_id ,MIN(score) as lowest,MAX(score) as highest from exams
group by exam_id 
)
select e.student_id ,s.student_name   from exams e 
join exam_cap ec on e.exam_id = ec.exam_id 
join students s on e.student_id  = s.student_id 
group by e.student_id,s.student_name 
having max(case when e.score = ec.lowest or e.score = ec.highest then 1 else 0 end) =0
