select customer_id, sum(amount)
from payment
group by customer_id;


select customer_id, sum(amount)
from payment
group by customer_id
    having sum(amount) > 200;


select store_id, count(customer_id)
from customer
group by store_id;


select store_id, count(customer_id)
from customer
group by store_id
    having count(customer_id) > 300;