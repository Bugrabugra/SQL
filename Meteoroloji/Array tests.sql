select *
from users
where 105 = any(poi_responsibilities);

update users
set poi_responsibilities = array [105,106,107,108]
where id = 48;

insert into users
    (username, password, email, phone_number, name, surname, admin, poi_responsibilities)
values
    ('test','test', 'test', 'test', 'test', 'test', false, array [105]);