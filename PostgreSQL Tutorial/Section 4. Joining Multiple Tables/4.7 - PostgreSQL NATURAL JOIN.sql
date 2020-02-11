create table categories
    (category_id serial primary key,
     category_name varchar(255) not null);


create table products
    (product_id serial primary key,
     product_name varchar(255) not null,
     category_id int           not null,
     foreign key (category_id)
         references categories (category_id));


insert into categories
    (category_name)
values
    ('Smart Phone'),
    ('Laptop'),
    ('Tablet');


insert into products
    (product_name, category_id)
values
    ('iPhone', 1),
    ('Samsung Galaxy', 1),
    ('HP Elite', 2),
    ('Lenovo Thinkpad', 2),
    ('iPad', 3),
    ('Kindle Fire', 3);


select *
from products
natural join categories;


select *
from products
inner join categories
using (category_id);


select *
from city
natural join country;

