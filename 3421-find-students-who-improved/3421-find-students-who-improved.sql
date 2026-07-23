# Write your MySQL query statement below

with cte as(
    select * ,row_number() over(partition by student_id,subject
    order by exam_date) as rn_f,
    row_number() over(partition by student_id,subject
    order by exam_date desc ) as rn_l
    from Scores

),
first as (
    select student_id, subject,score as first_score
    from cte
    where rn_f = 1
    
),
last as (
    select student_id, subject, score as last_score
    from cte
    where rn_l = 1
)
select f.student_id,f.subject,f.first_score,l.last_score as latest_score
from first f
join last l
on  f.student_id= l.student_id
and f.subject = l.subject
where l.last_score>f.first_score
order by f.student_id, f.subject

