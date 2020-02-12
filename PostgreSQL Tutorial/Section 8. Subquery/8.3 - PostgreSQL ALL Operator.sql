--PostgreSQL ALL operator examples
select round(avg(length), 2) as avg_length
from film
group by rating
order by avg_length desc;


select film_id,
       title,
       length
from film
where length > all (select round(avg(length), 2)
                    from film
                    group by rating)
order by length;