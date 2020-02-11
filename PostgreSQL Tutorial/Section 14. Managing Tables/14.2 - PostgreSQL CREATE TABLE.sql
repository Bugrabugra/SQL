--PostgreSQL CREATE TABLE example
create table account
    (user_id serial primary key,
     username varchar(50) unique not null,
     password varchar(50)        not null,
     email varchar(355) unique   not null,
     created_on timestamp        not null,
     last_login timestamp);


create table role
    (role_id serial primary key,
     role_name varchar(255) unique not null);


create table account_role
    (user_id integer not null,
     role_id integer not null,
     grant_date timestamp without time zone,
     primary key (user_id, role_id),
     constraint account_role_role_id_fkey foreign key (role_id)
         references role (role_id) match simple
         on update no action
         on delete no action,
     constraint account_role_user_id_fkey foreign key (user_id)
         references account (user_id) match simple
         on update no action
         on delete no action);