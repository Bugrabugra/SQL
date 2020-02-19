--PostgreSQL ADD COLUMN examples
create table customers2
    (id serial primary key,
     customer_name varchar not null);


alter table customers2
    add column phone varchar;


alter table customers2
    add column fax varchar,
    add column email varchar;


--Add a column with NOT NULL constraint to a table that has data
insert into customers2
    (customer_name)
values
    ('Apple'),
    ('Samsung'),
    ('Sony');


alter table customers2
    add column contact_name varchar not null;


alter table customers2
    add column contact_name varchar;


update customers2
set contact_name = 'John Doe'
where id = 1;


update customers2
set contact_name = 'Mary Doe'
where id = 2;


update customers2
set contact_name = 'Lily Bush'
where id = 3;


alter table customers2
    alter column contact_name set not null;
