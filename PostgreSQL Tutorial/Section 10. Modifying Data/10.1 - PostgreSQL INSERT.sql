create table link
    (id serial primary key,
     url varchar(255)  not null,
     name varchar(255) not null,
     description varchar(255),
     rel varchar(50));


--PostgreSQL insert one-row examples
insert into link
    (url, name)
values
    ('http://www.postgresqltutorial.com', 'PostgreSQL Tutorial');


select *
from link;


insert into link
    (url, name)
values
    ('http://www.oreilly.com', 'O''Reilly Media');


--PostgreSQL insert multiple rows example
insert into link
    (url, name)
values
    ('http://www.google.com', 'Google'),
    ('http://www.yahoo.com', 'Yahoo'),
    ('http://www.bing.com', 'Bing');


--PostgreSQL insert date example
alter table link
    add column last_update date;
alter table link
    alter column last_update set default current_date;


insert into link
    (url, name, last_update)
values
    ('http://www.facebook.com', 'Facebook', '2013-06-01');


insert into link
    (url, name, last_update)
values
    ('https://www.tumblr.com/', 'Tumblr', DEFAULT);


--PostgreSQL insert data from another table example
create table link_tmp (
    like link
);


insert into link_tmp
select *
from link
where link.last_update is not null;


select *
from link_tmp;


--Get the last insert id
insert into link
    (url, name, last_update)
values
    ('http://www.postgresql.org', 'PostgreSQL', DEFAULT) returning name;