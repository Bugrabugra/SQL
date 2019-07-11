select film.film_id,
       film.title,
       inventory_id
from film
left join inventory i
on film.film_id = i.film_id;


select film.film_id,
       film.title,
       inventory_id
from film
left join inventory i
on film.film_id = i.film_id
where i.film_id is null;