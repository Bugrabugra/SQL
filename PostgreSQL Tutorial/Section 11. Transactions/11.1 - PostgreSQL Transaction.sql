--Setting up a sample table
create table accounts (
    id int generated by default as identity,
    name varchar(100)  not null,
    balance dec(15, 2) not null,
    primary key (id)
);


--Beginning a transaction
insert into accounts
    (name, balance)
values
    ('Bob', 10000);


begin;
insert into accounts
    (name, balance)
values
    ('Alice', 10000);


select *
from accounts;


--Committing a transaction
commit;


--PostgreSQL COMMIT: Bank account transfer example
begin;
update accounts
set balance = balance - 1000
where id = 1;


update accounts
set balance = balance + 1000
where id = 2;
commit;


--Rolling back a transaction
insert into accounts
    (name, balance)
values
    ('Jack', 0);


begin;

update accounts
set balance = balance - 1500
where id = 1;


update accounts
set balance = balance + 1500
where id = 3;


rollback;