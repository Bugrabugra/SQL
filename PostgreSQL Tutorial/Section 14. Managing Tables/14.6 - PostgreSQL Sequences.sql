--PostgreSQL CREATE SEQUENCE examples
--Creating an ascending sequence example
create sequence mysequence
    increment 5
    start 100;


select nextval('mysequence');


--Creating a descending sequence example
create sequence three
    increment -1
    minvalue 1
    maxvalue 3
    start 3
    cycle;


select nextval('three');


--Creating a sequence associated with a table column
create table order_details
    (order_id serial,
     item_id int       not null,
     item_text varchar not null,
     price dec(10, 2)  not null,
     primary key (order_id, item_id));


create sequence order_item_id
    start 10
    increment 10
    minvalue 10
    owned by order_details.item_id;


insert into order_details
    (order_id, item_id, item_text, price)
values
    (100, nextval('order_item_id'), 'DVD Player', 100),
    (100, nextval('order_item_id'), 'Android TV', 550),
    (100, nextval('order_item_id'), 'Speaker', 250);


select order_id,
       item_id,
       item_text,
       price
from order_details;


--Listing all sequences in a database
select *
from pg_class
where relkind = 'S';