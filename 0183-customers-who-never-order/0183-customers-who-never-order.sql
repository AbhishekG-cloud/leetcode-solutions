# Write your MySQL query statement below
select name Customers
from  Customers
where id not in (
    select o.customerId
    from Orders o
    join  Customers c
    on o.customerId = c.id
)