select *
from link;


--PostgreSQL update table partially example
update link
set last_update = default
where last_update is null;


--PostgreSQL update all rows in a table
update link
set rel = 'nofollow';


update link
set description = name;


--PostgreSQL update join example
update link_tmp
set rel         = link.rel,
    description = link.description,
    last_update = link.last_update
from link
where link_tmp.id = link.id;


select *
from link_tmp;


--PostgreSQL update with returning clause
update link
set description = 'Learn PostgreSQL fast and easy',
    rel         = 'follow'
where id = 25 returning
    id,
    description,
    rel;


select *
from link
where id = 25;