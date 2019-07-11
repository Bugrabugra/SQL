select film_id,
       title
from film
order by title;


select distinct inventory.film_id, title
from inventory
inner join film f
on inventory.film_id = f.film_id
order by title;


select film_id, title
from film
    except (select distinct inventory.film_id, title
            from inventory
            inner join film
            on film.film_id = inventory.film_id)
order by title;