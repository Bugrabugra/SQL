select *
from neighborhoods
where st_intersects(
    geom,
    ST_SetSRID(st_makepoint(33.1064,38.7650),4326)
  );

--select vehicles inside a neighborhood
select id
from vehicles
where st_contains(
    (
      select geom
      from neighborhoods
      where
          iladi = 'İstanbul' and
          ilceadi = 'Maltepe' and
          adi = 'İdealtepe'
    ),
    vehicles.geom
  );

--select vehicles inside a district
select id
from vehicles
where st_contains(
    (
      select geom
      from districts
      where
          districts.iladi = 'İstanbul' and
          districts.ilceadi = 'Maltepe'
    ),
    vehicles.geom
  );

--select vehicles inside a city
select id
from vehicles
where st_contains(
    (
      select geom
      from cities
      where
          cities.iladi = 'İstanbul'
    ),
    vehicles.geom
  );