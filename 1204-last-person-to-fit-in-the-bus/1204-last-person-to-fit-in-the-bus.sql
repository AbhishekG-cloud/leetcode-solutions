# Write your MySQL query statement below
select person_name
from (
    select * , sum(weight) over ( order by turn) as run_weights
    from Queue

) t

where run_weights <=1000
order by run_weights desc
limit 1