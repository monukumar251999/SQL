Table: Employee

+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| salary      | int  |
+-------------+------+
id is the primary key (column with unique values) for this table.
Each row of this table contains information about the salary of an employee.
 

Write a solution to find the second highest distinct salary from the Employee table. If there is no second highest salary, return null (return None in Pandas).

The result format is in the following example.

 Solution 1:
select salary as SecondHighestSalary from (
select salary,row_number() over(order by salary desc) as rn  from Employee
) a
where rn=2

Solution 2:
# Write your MySQL query statement below
select distinct salary as SecondHighestSalary from employee order by salary desc
limit 1
offset 1

