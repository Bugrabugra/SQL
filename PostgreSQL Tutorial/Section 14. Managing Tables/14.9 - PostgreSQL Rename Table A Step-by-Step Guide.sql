--PostgreSQL rename table examples
create table vendors
    (id serial primary key,
     name varchar not null);


alter table vendors
    rename to suppliers;


create table supplier_groups
    (id serial primary key,
     name varchar not null);


alter table suppliers
    add column group_id int not null;


alter table suppliers
    add foreign key (group_id)
        references supplier_groups (id);

