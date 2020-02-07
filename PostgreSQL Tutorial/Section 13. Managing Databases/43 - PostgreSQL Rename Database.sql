select *
from pg_stat_activity
where datname = 'testhrdb';

select pg_terminate_backend(19336)
from pg_stat_activity
where datname = 'testhrdb';

alter database testhrdb rename to newdb;

