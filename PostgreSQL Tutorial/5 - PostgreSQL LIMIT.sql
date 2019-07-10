select film_id,
       title,
       release_year
from film
order by film_id
limit 4
offset 3;


select film_id,
       title,
       rental_rate
from film
order by rental_rate desc
limit 10;