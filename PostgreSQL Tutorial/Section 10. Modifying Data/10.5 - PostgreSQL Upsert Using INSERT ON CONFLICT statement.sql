--PostgreSQL upsert examples
create table customers (
    customer_id serial primary key,
    name varchar unique,
    email varchar not null,
    active bool   not null default true
);


insert into customers
    (name, email)
values
    ('IBM', 'contact@ibm.com'),
    ('Microsoft', 'contact@microsoft.com'),
    ('Intel', 'contact@intel.com');


select *
from customers;


insert into customers
    (name, email)
values
    ('Microsoft', 'hotline@microsoft.com')
on conflict on constraint customers_name_key
    do nothing;


insert into customers
    (name, email)
values
    ('Microsoft', 'hotline@microsoft.com')
on conflict (name)
    do nothing;


insert into customers
    (name, email)
values
    ('Microsoft', 'hotline@microsoft.com')
on conflict (name)
    do update set email = excluded.email || ';' || customers.email;