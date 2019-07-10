select customer.customer_id,
       first_name,
       last_name,
       email,
       amount,
       payment_date
from customer
inner join payment payment
           on customer.customer_id = payment.customer_id
where customer.customer_id = 2
order by customer.customer_id;


select customer.customer_id,
       customer.first_name as customer_first_name,
       customer.last_name as customer_last_name,
       customer.email,
       staff.first_name as staff_first_name,
       staff.last_name as staff_last_name,
       amount,
       payment_date
from customer
inner join payment
           on customer.customer_id = payment.customer_id
inner join staff
           on payment.staff_id = staff.staff_id;


