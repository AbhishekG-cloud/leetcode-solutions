# Write your MySQL query statement below

select stock_name,sum(final) as capital_gain_loss
from (select *, 
    case
        when  operation = "Buy" then price*-1
        else price 
        end as final
from Stocks)t
group by stock_name
