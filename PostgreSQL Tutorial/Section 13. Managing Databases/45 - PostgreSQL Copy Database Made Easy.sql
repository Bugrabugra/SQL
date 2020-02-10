create database dvdrental_test
    with template dvdrental;

select *
from pg_stat_activity
where datname = 'dvdrental';

select pg_terminate_backend(pg_stat_activity.pid)
from pg_stat_activity
where pg_stat_activity.datname = 'dvdrental';