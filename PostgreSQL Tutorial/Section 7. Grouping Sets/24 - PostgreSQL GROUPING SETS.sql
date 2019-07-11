create table sales (
    brand varchar   not null,
    segment varchar not null,
    quantity int    not null,
    primary key (brand, segment)
);


insert into sales
    (brand, segment, quantity)
values
    ('ABC', 'Premium', 100),
    ('ABC', 'Basic', 200),
    ('XYZ', 'Premium', 100),
    ('XYZ', 'Basic', 300);


select brand,
       segment,
       sum(quantity)
from sales
group by brand, segment;


select brand, sum(quantity)
from sales
group by brand;


select segment, sum(quantity)
from sales
group by segment;


select sum(quantity)
from sales;


select brand, segment, sum(quantity)
from sales
group by brand, segment
    union all
    select brand, NULL, sum(quantity)
    from sales
    group by brand
    union all
    select null, segment, sum(quantity)
    from sales
    group by segment
    union all
    select null, null, sum(quantity)
    from sales;


select brand, segment, sum(quantity)
from sales
group by grouping sets ((brand, segment),
                        (brand),
                        (segment),
    ());


select grouping(brand) as grouping_brand,
       grouping(segment) as grouping_segment,
       brand,
       segment,
       sum(quantity)
from sales
group by grouping sets ( (brand, segment),
                         (brand),
                         (segment),
    ()
    )
    order by brand, segment;