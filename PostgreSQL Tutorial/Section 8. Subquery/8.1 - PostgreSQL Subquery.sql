--Introduction to PostgreSQL subquery
select avg(rental_rate)
from film;


select film_id,
       title,
       rental_rate
from film
where rental_rate > 2.98;


select film_id,
       title,
       rental_rate
from film
where rental_rate > (
    select avg(rental_rate)
    from film);


--PostgreSQL subquery with IN operator
select inventory.film_id
from rental
inner join inventory
on rental.inventory_id = inventory.inventory_id
where return_date between '2005-05-29' and '2005-05-30';


select film_id,
       title
from film
where film_id in (
    select inventory.film_id
    from rental
    inner join inventory
    on rental.inventory_id = inventory.inventory_id
    where return_date between '2005-05-29' and '2005-05-30');


--PostgreSQL subquery with EXISTS operator
select first_name,
       last_name
from customer
where exists(select 1
             from payment
             where payment.customer_id = customer.customer_id);