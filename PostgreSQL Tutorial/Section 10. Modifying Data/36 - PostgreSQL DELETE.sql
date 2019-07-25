select *
from link;


--PostgreSQL DELETE with WHERE clause example
delete
from link
where id = 8;


--PostgreSQL DELETE USING statement example
select *
from link_tmp;


delete
from link using link_tmp
where link.id = link_tmp.id;


--PostgreSQL deletes all rows from a table
delete
from link;


delete
from link_tmp returning *;