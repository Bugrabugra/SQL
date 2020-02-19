--PostgreSQL ALTER TABLE examples
create table links
    (link_id serial primary key,
     title varchar(512) not null,
     url varchar(1024)  not null unique);


alter table links
    add column active boolean;


alter table links
    drop column active;


alter table links
    rename column title to link_title;


alter table links
    add column target varchar(10);


alter table links
    alter column target
        set default '_blank';


insert into links
    (link_title, url)
values
    ('PostgreSQL Tutorial', 'https://www.postgresqltutorial.com/');


select *
from links;


alter table links
    add check (target in ('_self', '_blank', '_parent', '_top'));


insert into links
    (link_title, url, target)
values
    ('PostgreSQL', 'http://www.postgresql.org/', 'whatever');


alter table links
    rename to url;