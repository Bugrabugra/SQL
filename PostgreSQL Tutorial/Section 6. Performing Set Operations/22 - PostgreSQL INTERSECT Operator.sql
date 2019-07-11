create table employees (
    employee_id serial primary key,
    employee_name varchar(255) not null
);


create table keys (
    employee_id int primary key,
    effective_date date not null,
    foreign key (employee_id)
        references employees (employee_id)
);


create table hipos (
    employee_id int primary key,
    effective_date date not null,
    foreign key (employee_id)
        references employees (employee_id)
);


insert into employees
    (employee_name)
values
    ('Joyce Edwards'),
    ('Diane Collins'),
    ('Alice Stewart'),
    ('Julie Sanchez'),
    ('Heather Morris'),
    ('Teresa Rogers'),
    ('Doris Reed'),
    ('Gloria Cook'),
    ('Evelyn Morgan'),
    ('Jean Bell');


insert into keys
values
    (1, '2000-02-01'),
    (2, '2001-06-01'),
    (5, '2002-01-01'),
    (7, '2005-06-01');


insert into hipos
values
    (9, '2000-01-01'),
    (2, '2002-06-01'),
    (5, '2006-06-01'),
    (10, '2005-06-01');


select employee_id
from keys;


select employee_id
from hipos;


select employee_id
from keys
intersect
select employee_id
from hipos;


select employee_id
from keys
intersect
select employee_id
from hipos
order by employee_id;