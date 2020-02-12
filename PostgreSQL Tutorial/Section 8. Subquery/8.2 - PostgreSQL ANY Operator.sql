--PostgreSQL ANY examples
select max(length)
from film
inner join film_category
using (film_id)
group by category_id;


select title
from film
where length >= any (
    select max(length)
    from film
    inner join film_category
    using (film_id)
    group by category_id);


--ANY vs. IN
select title,
       category_id
from film
inner join film_category
using (film_id)
where category_id = any (
    select category_id
    from category
    where name = 'Action'
       or name = 'Drama');


select title,
       category_id
from film
inner join film_category
using (film_id)
where category_id in (
    select category_id
    from category
    where name = 'Action'
       or name = 'Drama');