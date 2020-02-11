--PostgreSQL SELECT DISTINCT examples
create table color1
    (id serial not null primary key,
     bcolor varchar,
     fcolor varchar);

insert into color1
    (bcolor, fcolor)
values
    ('red', 'red'),
    ('red', 'red'),
    ('red', null),
    (null, 'red'),
    ('red', 'green'),
    ('red', 'blue'),
    ('green', 'red'),
    ('green', 'blue'),
    ('green', 'green'),
    ('blue', 'red'),
    ('blue', 'green'),
    ('blue', 'blue');

select id,
       bcolor,
       fcolor
from color1;


--PostgreSQL DISTINCT on one column example
select distinct bcolor
from color1
order by bcolor;


--PostgreSQL DISTINCT on multiple columns
select distinct bcolor,
                fcolor
from color1
order by bcolor,
         fcolor;


--PostgreSQL DISTINCT ON example
select distinct on (bcolor) bcolor,
                            fcolor
from color1
order by bcolor,
         fcolor;