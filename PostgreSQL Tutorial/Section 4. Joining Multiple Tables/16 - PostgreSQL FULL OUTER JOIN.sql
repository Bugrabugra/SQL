create table if not exists departments (
    department_id serial primary key,
    department_name varchar(255) not null
);


create table if not exists employees (
    employee_id serial primary key,
    employee_name varchar(255),
    departmant_id integer
);


insert into departments
    (department_name)
values
    ('Sales'),
    ('Marketing'),
    ('HR'),
    ('IT'),
    ('Production');


insert into employees
    (employee_name,
     departmant_id)
values
    ('Bette Nicholson', 1),
    ('Christian Gable', 1),
    ('Joe Swank', 2),
    ('Fred Costner', 3),
    ('Sandra Kilmer', 4),
    ('Julia Mcqueen', NULL);


select *
from departments;


select *
from employees;


select employee_name,
       department_name
from employees e
full outer join departments d
on d.department_id = e.departmant_id;


select employee_name,
       department_name
from employees e
full outer join departments d
on d.department_id = e.departmant_id
where employee_name is null;


select employee_name,
       department_name
from employees e
full outer join departments d
on d.department_id = e.departmant_id
where department_name is null;