create table emp_mngr(
emp_id int,
emp_name varchar(20),
department_id int,
salary int,
manager_id int,
emp_age int);

insert into emp_mngr
values
(1, 'Ankit', 100,10000, 4, 39);
insert into emp_mngr
values (2, 'Mohit', 100, 15000, 5, 48);
insert into emp_mngr
values (3, 'Vikas', 100, 12000,4,37);
insert into emp_mngr
values (4, 'Rohit', 100, 14000, 2, 16);
insert into emp_mngr
values (5, 'Mudit', 200, 20000, 6,55);
insert into emp_mngr
values (6, 'Agam', 200, 12000,2, 14);
insert into emp_mngr
values (7, 'Sanjay', 200, 9000, 2,13);
insert into emp_mngr
values (8, 'Ashish', 200,5000,2,12);
insert into emp_mngr
values (9, 'Mukesh',300,6000,6,51);
insert into emp_mngr
values (10, 'Rakesh',500,7000,6,50);

select e.emp_id,e.emp_name,m.emp_name as manager_name,sm.emp_name as senior_manager_name from emp_mngr e
join emp_mngr m on e.manager_id = m.emp_id
join emp_mngr sm on m.manager_id = sm.emp_id
