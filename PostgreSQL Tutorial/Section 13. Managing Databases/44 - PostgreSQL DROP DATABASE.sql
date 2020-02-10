create database hrdb;
create database testdb1;

drop database hrdb;

select *
from pg_stat_activity
where datname = 'testdb1';

select pg_terminate_backend(pg_stat_activity.pid)
from pg_stat_activity
where pg_stat_activity.datname = 'testdb1';

drop database testdb1;

