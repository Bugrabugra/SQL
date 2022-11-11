-- select neighborhoods containing the vehicles
SELECT
  neighborhoods.id, neighborhoods.adi, neighborhoods.ilceadi, neighborhoods.iladi
FROM
  neighborhoods
WHERE
  st_intersects(
      neighborhoods.geom,
      st_collect(
  ARRAY(SELECT
     ST_SetSRID(st_makepoint(st_x(vehicles.geom), st_y(vehicles.geom)), 4326) as coordinates
   FROM
     vehicles
   WHERE
     id IN (200, 400, 600, 800, 1000, 1200, 1400))));

--select vehicles inside a neighborhood
SELECT id
FROM
  vehicles
WHERE
  st_contains(
      (SELECT geom
       FROM
         neighborhoods
       WHERE
         iladi = 'İstanbul' AND
         ilceadi = 'Maltepe' AND
         adi = 'İdealtepe'),
      vehicles.geom
    );

--select vehicles inside a district
SELECT id
FROM
  vehicles
WHERE
  st_contains(
      (SELECT geom
       FROM
         districts
       WHERE
         districts.iladi = 'İstanbul' AND
         districts.ilceadi = 'Maltepe'),
      vehicles.geom
    );

--select vehicles inside a city
SELECT id
FROM
  vehicles
WHERE
  st_contains(
      (SELECT geom
       FROM
         cities
       WHERE
         cities.iladi = 'İstanbul'),
      vehicles.geom
    );

SELECT id
FROM
  vehicles
WHERE
  id % 2 = 0;

select *
from neighborhoods
where st_intersects(
    geom,
    st_collect(
        ST_SetSRID(st_makepoint(33.1064,38.7650),4326),
        ST_SetSRID(st_makepoint(28.98843,41.12492),4326)
      )
  );

