# Write your MySQL query statement below
select name as Employee
from Employee e1
where exists(
    select 1
    from Employee e2
    where e1.managerId = e2.id and e1.salary>e2.salary
)