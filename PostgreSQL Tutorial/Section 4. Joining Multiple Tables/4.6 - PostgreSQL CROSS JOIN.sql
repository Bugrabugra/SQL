create table T1
    (label char(1) primary key);


create table T2
    (score int primary key);


insert into T1
    (label)
values
    ('A'),
    ('B');


insert into T2
    (score)
values
    (1),
    (2),
    (3);


select *
from t1
cross join t2;