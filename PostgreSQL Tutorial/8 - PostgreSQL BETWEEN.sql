select customer_id,
       payment_id,
       amount
from payment
where amount between 8 and 9;


select customer_id,
       payment_id,
       amount
from payment
where amount not between 8 and 9;


select customer_id,
       payment_id,
       amount,
       payment_date
from payment
where payment_date between '2007-02-07' and '2007-02-15';