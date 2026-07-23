# Write your MySQL query statement below
with trail as (
    select user_id,round(avg(case when activity_type = "free_trial"then activity_duration end ),2) as trial_avg_duration
from UserActivity
group by user_id
),
paid as (
    select user_id,round(avg(case when activity_type = "paid"then activity_duration end ),2) as paid_avg_duration
from UserActivity
group by user_id
)
select t.user_id,t.trial_avg_duration,l.paid_avg_duration
from trail t
join paid l
on t.user_id = l.user_id
where t.trial_avg_duration is not null and l.paid_avg_duration is not null