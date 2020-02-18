--PostgreSQL SERIAL example
create table fruits
    (id serial primary key,
     name varchar not null);


insert into fruits
    (name)
values
    ('Orange');


insert into fruits
    (id, name)
values
    (default, 'Apple');


select *
from fruits;


select currval(pg_get_serial_sequence('fruits', 'id'));


insert into fruits
    (name)
values
    ('Banana') returning id;