create database testdb2;
alter database testdb2 rename to testhrdb;

create role hr valid until 'infinity';

alter database testhrdb owner to hr;
