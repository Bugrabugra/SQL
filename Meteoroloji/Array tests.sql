select *
from users
where 105 = any(poi_responsibilities);

update users
set poi_responsibilities = array [null]
where id = 39;

insert into warnings
    (source, event, message, is_screen, is_field, rules)
values
    ('test','test', 'test', true, true, array [ 105 ]);

update warnings set rules = array [] where id = 4;


insert into warnings
(source, event, message, is_screen, is_field, rules)
values ('test', 'test', 'test', true, false, '{1,2,3}');

select *
from warnings
where 6 = any(rules);

select * from rules;

select *
from users u
where
    112 = any(poi_responsibilities);

-- BU ÇALIŞIYOR --
select users.id, users.phone_number
from users
where ((select id
        from warnings
        where rules = any (
            select array_agg(id)
            from rules
            where (source = 'precipitation' and
                   (35 between min_value and max_value) and
                   is_present = false)
               or (source = 'precipitation' and
                   (45 between min_value and max_value) and
                   is_present = true)
        )) = any (warnings_to_receive)
    ) and
        112 = any(poi_responsibilities);

-- BU DENEME --
select users.phone_number, users.warnings_to_receive,
       users.poi_responsibilities,
       sub_warnings.warning_id, sub_warnings.message,
       sub_warnings.is_screen, sub_warnings.is_field
from users, (select id as warning_id, message, is_screen, is_field
             from warnings
             where uniq(sort(rules)) = uniq(sort((
                 select array_agg(id) as rule_id
                 from rules
                 where (source = 'precipitation' and
                        (42 between min_value and max_value) and
                        is_present = false)
                    or (source = 'precipitation' and
                        (54 between min_value and max_value) and
                        is_present = true)
             )))) as sub_warnings
where
        sub_warnings.warning_id = any (users.warnings_to_receive) and
    112 = any(users.poi_responsibilities);


select users.phone_number, users.warnings_to_receive,
       users.poi_responsibilities,
       sub_warnings.warning_id, sub_warnings.message,
       sub_warnings.is_screen, sub_warnings.is_field
from users, (select id as warning_id, message, is_screen, is_field
             from warnings
             where uniq(sort(rules)) = uniq(sort((
                 select array_agg(id) as rule_id
                 from rules
                 where (source = 'green storm polygon' and
                        (0 between min_value and max_value) and
                        is_present = true)
                    or (source = null and
                        (null between min_value and max_value) and
                        is_present = null)
             )))) as sub_warnings
where
        sub_warnings.warning_id = any (users.warnings_to_receive) and
        112 = any(users.poi_responsibilities);

-- SELECT x.*
-- from table road as r , x
-- where ST_Intersects(STBuffer(r.the_geom, 2000), x.the_geom) IS TRUE

update users set username = 'teneke4',
    email = 'yetkisiz@gmail.com', phone_number = '0535-7458963', name = 'teneke',
         surname = 'teneke2', is_admin = false,
         poi_responsibilities = array [105,106,107,108],
         warnings_to_receive = array [null] where id = 48 returning id;

insert into users
    (username, password, email, phone_number, name, surname, is_admin, poi_responsibilities, warnings_to_receive)
    values
    ('TEST', 'TESTTEST', 'TEST@gmail.com', 'TEST', 'TEST', 'TEST', false, '{1,2,3}', '{1,2,3}');

select * from users where username != 'admin';