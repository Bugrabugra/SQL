--1) Querying hierarchy data example

create table employee (
    employee_id int primary key,
    first_name varchar(255) not null,
    last_name varchar(255)  not null,
    manager_id int,
    foreign key (manager_id)
        references employee (employee_id)
        on delete cascade
);


insert into employee
    (employee_id,
     first_name,
     last_name,
     manager_id)
values
    (1, 'Windy', 'Hays', NULL),
    (2, 'Ava', 'Christensen', 1),
    (3, 'Hassan', 'Conner', 1),
    (4, 'Anna', 'Reeves', 2),
    (5, 'Sau', 'Norman', 2),
    (6, 'Kelsie', 'Hays', 3),
    (7, 'Tory', 'Goff', 3),
    (8, 'Salley', 'Lester', 3);


select e.first_name || ' ' || e.last_name as employee,
       m.first_name || ' ' || m.last_name as manager
from employee e
inner join employee m
on m.employee_id = e.manager_id
order by manager;


select e.first_name || ' ' || e.last_name as employee,
       m.first_name || ' ' || m.last_name as manager
from employee e
left join employee m
on m.employee_id = e.manager_id
order by manager;


--2) Comparing the rows with the same table
select f1.title,
       f2.title,
       f1.length
from film f1
inner join film f2
on f1.film_id <> f2.film_id
    and f1.length = f2.length;