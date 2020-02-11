select brand,
       segment,
       sum(quantity)
from sales
group by rollup (brand, segment)
order by brand,
         segment;


select segment,
       brand,
       sum(quantity)
from sales
group by rollup (brand, segment)
order by segment,
         brand;


select extract(year from rental_date) as y,
       extract(month from rental_date) as m,
       extract(day from rental_date) as d,
       count(rental_id)
from rental
group by rollup ( extract(year from rental_date),
                  extract(month from rental_date),
                  extract(day from rental_date));

