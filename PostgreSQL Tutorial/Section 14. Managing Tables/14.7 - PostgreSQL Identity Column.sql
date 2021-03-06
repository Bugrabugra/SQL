--PostgreSQL identity column examples
--GENERATED ALWAYS example
create table color
    (color_id int generated always as identity,
     color_name varchar not null);


insert into color
    (color_name)
values
    ('Red');


select *
from color;


insert into color
    (color_id, color_name)
    overriding system value
values
    (2, 'Green');


--GENERATED BY DEFAULT AS IDENTITY example
drop table color;


create table color
    (color_id int generated by default as identity,
     color_name varchar not null);


insert into color
    (color_name)
values
    ('White');


insert into color
    (color_id, color_name)
values
    (2, 'Yellow');


--Sequence options example
drop table color;


create table color
    (color_id int generated by default as identity
        (start with 10 increment by 10),
     color_name varchar not null;


insert into color
    (color_name)
values
    ('Orange');


select *
from color;


insert into color
    (color_name)
values
    ('Purple');


--Adding an identity column to an existing table
create table shape
    (shape_id int       not null,
     shape_name varchar not null);


alter table shape
    alter column shape_id add generated always as identity;


alter table shape
    alter column shape_id set generated by default;


--Removing the GENERATED AS IDENTITY constraint
alter table shape
    alter column shape_id
        drop identity if exists;



