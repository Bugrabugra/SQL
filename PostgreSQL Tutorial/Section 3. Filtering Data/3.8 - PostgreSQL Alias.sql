--Column alias examples
select first_name || ' ' || last_name
from customer
order by first_name || ' ' || last_name;


select first_name || ' ' || last_name as full_name
from customer
order by full_name;