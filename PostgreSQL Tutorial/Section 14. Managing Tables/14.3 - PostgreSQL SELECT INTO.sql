--PostgreSQL SELECT INTO examples
select film_id,
       title,
       rental_rate
into table film_r
from film
where rating = 'R'
  and rental_duration = 5
order by title;


select *
from film_r;


select film_id,
       title,
       length
into temp table short_film
from film
where length < 60
order by title;


select *
from short_film;