--PostgreSQL SELECT examples
select first_name
from customer;


--Using SELECT statement to query data from multiple columns example
select first_name,
       last_name,
       email
from customer;


--Using SELECT statement to query data in all columns of a table example
select *
from customer;


--Using SELECT statement with expressions example
select first_name || ' ' || last_name as full_name,
       email
from customer;


--Using SELECT statement with  only expressions example
select 5 * 3 as result;