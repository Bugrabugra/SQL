create sequence sde."UNI_SEQUENCE"
    minvalue 1
    maxvalue 9999999999
    increment by 1
    start WITH 29800
    cache 20;

create or replace function sde.UNI_TRIG_PROJELER_FUNC(
                                                     )
    returns trigger as
$$
begin
    new.mekansal_id = nextval('sde."UNI_SEQUENCE"');
    return new;
end;
$$ language 'plpgsql' volatile;


create trigger UNI_TRIG_PROJELER
    before insert
    on sde.inegol_projeler
    for each row
execute procedure sde.UNI_TRIG_PROJELER_FUNC();

