# Write your MySQL query statement below
with borrws as (select book_id,count(*) as num
from borrowing_records
where return_date is null
group by book_id) 
select l.book_id ,l.title  
,l.author,l.genre,l.publication_year,b.num as current_borrowers
from library_books l
join borrws b
on l.book_id = b.book_id
where l.total_copies = b.num
order by b.num desc,l.title 

