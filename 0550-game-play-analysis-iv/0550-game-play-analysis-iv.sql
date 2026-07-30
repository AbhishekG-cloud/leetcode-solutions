with cte as (
    select player_id,event_date,
    lead(event_date) over(partition by player_id order by event_date ) as next_login,
    row_number() over (partition by player_id order by event_date )
    as rn
    from Activity

)

select round(
    avg(
        case
            when datediff(next_login,event_date) = 1 then 1 else 0 end

        
    ),2
) as fraction
from cte

where rn =1