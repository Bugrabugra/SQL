--Using WHERE clause with the equal (=) operator example
select last_name,
       first_name
from customer
where first_name = 'Jamie';


--Using WHERE clause with the AND operator example
select last_name,
       first_name
from customer
where first_name = 'Jamie'
  and last_name = 'Rice';


--Using WHERE clause with the OR operator example
select first_name,
       last_name
from customer
where last_name = 'Rodriguez'
   or first_name = 'Adam';


--Using WHERE clause with the IN operator example
select first_name,
       last_name
from customer
where first_name in ('Ann', 'Anne', 'Annie');


--Using WHERE clause with the LIKE operator example
select first_name,
       last_name
from customer
where first_name like 'Ann%';


--Using WHERE clause with the BETWEEN operator example
select first_name,
       length(first_name) as name_length
from customer
where first_name like 'A%'
  and length(first_name) between 3 and 5
order by name_length;


--Using WHERE clause with the not equal operator (<>) example
select first_name,
       last_name
from customer
where first_name like 'Bra%'
  and last_name <> 'Motley';

