--Using PostgreSQL ORDER BY clause to sort rows by one column
select first_name,
       last_name
from customer
order by first_name asc;

select first_name,
       last_name
from customer
order by first_name;


--Using PostgreSQL ORDER BY clause to sort rows by one column
select first_name,
       last_name
from customer
order by last_name desc;


--Using PostgreSQL ORDER BY clause to sort rows by multiple columns
select first_name,
       last_name
from customer
order by first_name asc,
         last_name desc;


--Using PostgreSQL ORDER BY clause to sort rows by expressions
select first_name,
       length(first_name) as len
from customer
order by length(first_name) desc;