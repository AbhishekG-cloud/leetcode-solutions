# Write your MySQL query statement below

select round(sum(tiv_2016),2) as tiv_2016
from Insurance 
where pid in (
    select distinct  i1.pid 
from Insurance i1
join Insurance i2
on i1.tiv_2015 =i2.tiv_2015 
and i1.pid != i2.pid
where i1.pid not in (
    select distinct  i1.pid 
from Insurance i1
join Insurance i2
on i1.lat =i2.lat
and  i1.lon =i2.lon
and i1.pid != i2.pid
)
)
