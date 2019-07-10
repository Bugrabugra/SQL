select first_name,
       last_name
from customer
where first_name like 'Jen%';


select 'foo' like 'foo',
       'foo' like 'f%',
       'foo' like '_o_',
       'bar' like 'b_';


select first_name,
       last_name
from customer
where first_name like '%er%';


select first_name,
       last_name
from customer
where first_name like '_her%';


select first_name,
       last_name
from customer
where first_name not like 'Jen%';


select first_name,
       last_name
from customer
where first_name ilike 'BAR%';
