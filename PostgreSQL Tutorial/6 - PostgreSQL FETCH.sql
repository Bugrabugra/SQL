select film_id,
       title
from film
order by title
fetch first row only;


select film_id,
       title
from film
order by title
fetch first 1 row only;


select film_id,
       title
from film
order by title
fetch first 5 row only;


select film_id,
       title
from film
order by title
offset 5 rows
fetch first 5 row only;