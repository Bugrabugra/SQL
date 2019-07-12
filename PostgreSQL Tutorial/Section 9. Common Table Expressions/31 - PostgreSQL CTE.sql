--A simple PostgreSQL CTE example
with cte_film as (
    select film_id,
           title,
           (case
                when length < 30
                    then 'Short'
                when length >= 30 and length < 90
                    then 'Medium'
                when length > 90
                    then 'Long'
               end) as length
    from film
)
select film_id,
       title,
       length
from cte_film
where length = 'Long'
order by title;


--Joining a CTE with a table example
with cte_rental as (
    select staff_id,
           count(rental_id) as rental_count
    from rental
    group by staff_id
)
select s.staff_id,
       first_name,
       last_name,
       rental_count
from staff s
inner join cte_rental
using (staff_id);


--Using CTE with a window function example
with cte_film as (
    select film_id,
           title,
           rating,
           length,
           rank() over (
               partition by rating
               order by length desc)
               as length_rank
    from film
)
select *
from cte_film
where length_rank = 1;