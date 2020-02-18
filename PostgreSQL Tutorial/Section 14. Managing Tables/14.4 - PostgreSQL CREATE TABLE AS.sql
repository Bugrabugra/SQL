--PostgreSQL CREATE TABLE AS statement examples
create table action_film as
select film_id,
       title,
       release_year,
       length,
       rating
from film
inner join film_category
using (film_id)
where category_id = 1; --action


select *
from action_film
order by title;


create table if not exists film_rating (rating, film_account)
as
select rating,
       count(film_id)
from film
group by rating;


select *
from film_rating;
