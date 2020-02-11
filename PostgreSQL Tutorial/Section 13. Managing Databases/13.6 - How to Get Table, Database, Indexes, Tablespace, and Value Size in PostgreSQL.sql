--PostgreSQL table size
select pg_relation_size('actor');
select pg_size_pretty(pg_relation_size('actor'));
select pg_size_pretty(pg_total_relation_size('actor'));

select relname as "relation",
       pg_size_pretty(pg_total_relation_size(C.oid)) as "total_size"
from dvdrental.pg_catalog.pg_class C
left join dvdrental.pg_catalog.pg_namespace N
on (N.oid = C.relnamespace)
where nspname not in ('pg_catalog',
                      'information_schema')
  and C.relkind <> 'i'
  and nspname !~ '^pg_toast'
order by pg_total_relation_size(C.oid) desc
limit 5;


--PostgreSQL database size
select pg_size_pretty(pg_database_size('dvdrental'));

select pg_database.datname,
       pg_size_pretty(pg_database_size(pg_database.datname)) as size
from pg_database;


--PostgreSQL indexes size
select pg_size_pretty(pg_indexes_size('actor'));


--PostgreSQL tablespace size
select pg_size_pretty(pg_tablespace_size('pg_default'));

