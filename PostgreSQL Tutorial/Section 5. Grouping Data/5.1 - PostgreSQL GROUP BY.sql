--Using PostgreSQL GROUP BY without an aggregate function example
select customer_id
from payment
group by customer_id;


--Using PostgreSQL GROUP BY with SUM() function example
select customer_id,
       sum(amount)
from payment
group by customer_id;


select customer_id, sum(amount)
from payment
group by customer_id
    order by sum(amount) desc;


--Using PostgreSQL GROUP BY with COUNT() function example
select staff_id, count(payment_id)
from payment
group by staff_id;