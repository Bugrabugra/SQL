select *
from users
where 105 = any(poi_responsibilities);

update users
set poi_responsibilities = array [105,106,107,108]
where id = 48;

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
select users.id, users.name, users.phone_number, users.warnings_to_receive, users.poi_responsibilities, sub_warnings.id, sub_warnings.message
from users, (select id, message
             from warnings
             where rules = any (
                 select array_agg(id)
                 from rules
                 where (source = 'heat' and
                        (38 between min_value and max_value) and
                        is_present = false)
                    or (source is null and
                        (null between min_value and max_value) and
                        is_present = true)
             )) as sub_warnings
where
        sub_warnings.id = any (warnings_to_receive) and
    112 = any(poi_responsibilities);


select id, message
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
);

select array_agg(id)
from rules
where (source = 'precipitation' and
       (35 between min_value and max_value) and
       is_present = false)
   or (source = 'precipitation' and
       (45 between min_value and max_value) and
       is_present = true);

select id, message
from warnings
where 15 = any (rules);


select id, message
from warnings
where 14 = any (
    select array_agg(id)
    from rules
    where (source = 'precipitation' and
           (35 between min_value and max_value) and
           is_present = false)
       or (source = 'precipitation' and
           (40 between min_value and max_value) and
           is_present = true)
);




