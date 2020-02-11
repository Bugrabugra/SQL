--PostgreSQL LIKE examples
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


--PostgreSQL NOT LIKE examples
select first_name,
       last_name
from customer
where first_name not like 'Jen%';


--PostgreSQL’s extensions of LIKE operator
select first_name,
       last_name
from customer
where first_name ilike 'BAR%';
