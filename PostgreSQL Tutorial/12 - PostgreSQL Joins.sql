create table basket_a (
    id int primary key,
    fruit varchar(100) not null
);


create table basket_b (
    id int primary key,
    fruit varchar(100) not null
);


insert into basket_a(id, fruit)
values
    (1, 'Apple'),
    (2, 'Orange'),
    (3, 'Banana'),
    (4, 'Cucumber');


insert into basket_b(id, fruit)
values
    (1, 'Orange'),
    (2, 'Apple'),
    (3, 'Watermelon'),
    (4, 'Pear');

--PostgreSQL inner join
select a.id as id_a,
       a.fruit as fruit_a,
       b.id as id_b,
       b.fruit as fruit_b
from basket_a a
inner join basket_b b
           on a.fruit = b.fruit;


--PostgreSQL left join
select a.id as id_a,
       a.fruit as fruit_a,
       b.id as id_b,
       b.fruit as fruit_b
from basket_a a
left join basket_b b
          on a.fruit = b.fruit;


select a.id as id_a,
       a.fruit as fruit_a,
       b.id as id_b,
       b.fruit as fruit_b
from basket_a a
left join basket_b b
          on a.fruit = b.fruit
where b.id is null;


--PostgreSQL right join
select a.id as id_a,
       a.fruit as fruit_a,
       b.id as id_b,
       b.fruit as fruit_b
from basket_a a
right join basket_b b
           on a.fruit = b.fruit;


select a.id as id_a,
       a.fruit as fruit_a,
       b.id as id_b,
       b.fruit as fruit_b
from basket_a a
right join basket_b b
           on a.fruit = b.fruit
where a.id is null;


--PostgreSQL full outer join
select a.id as id_a,
       a.fruit as fruit_a,
       b.id as id_b,
       b.fruit as fruit_b
from basket_a a
full outer join basket_b b
                on a.fruit = b.fruit;


select a.id as id_a,
       a.fruit as fruit_a,
       b.id as id_b,
       b.fruit as fruit_b
from basket_a a
full join basket_b b
          on a.fruit = b.fruit
where a.id is null
   or b.id is null;