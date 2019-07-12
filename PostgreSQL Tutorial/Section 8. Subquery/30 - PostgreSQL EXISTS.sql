--A) Find customers who have at least one payment whose amount is greater than 11.
select first_name,
       last_name
from customer c
where exists(
              select 1
              from payment p
              where p.customer_id = c.customer_id
                and amount > 11)
order by first_name,
         last_name;


--B) NOT EXISTS example
select first_name,
       last_name
from customer c
where not exists(
        select 1
        from payment p
        where p.customer_id = c.customer_id
          and amount > 11)
order by first_name,
         last_name;


--C) EXISTS and NULL
select first_name,
       last_name
from customer
where exists(
              select null)
order by first_name,
         last_name;

