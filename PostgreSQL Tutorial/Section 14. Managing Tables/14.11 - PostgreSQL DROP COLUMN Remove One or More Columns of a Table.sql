--PostgreSQL DROP COLUMN examples
create table publishers
    (publisher_id serial primary key,
     name varchar not null);


create table categories2
    (category_id serial primary key,
     name varchar not null);


create table books
    (book_id serial primary key,
     title varchar       not null,
     isbn varchar        not null,
     published_date date not null,
     description varchar,
     category_id int     not null,
     publisher_id int    not null,
     foreign key (publisher_id)
         references publishers (publisher_id),
     foreign key (category_id)
         references categories2 (category_id));


create view book_info as
select book_id,
       title,
       isbn,
       published_date,
       name
from books b
inner join publishers p
on b.publisher_id = p.publisher_id
order by title;


alter table books
    drop column category_id;


alter table books
    drop column publisher_id;


alter table books
    drop column publisher_id cascade;


alter table books
    drop column isbn,
    drop column description;