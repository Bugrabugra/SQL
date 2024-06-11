--test
SELECT *
FROM
  pg_extension
WHERE
  extname = 'postgis';

CREATE USER test_user WITH ENCRYPTED PASSWORD 'test_user';
GRANT ALL PRIVILEGES ON DATABASE gis TO test_user;

SHOW hba_file;

ALTER USER bugraotken WITH PASSWORD 'buura6630';

SELECT PostGIS_Full_Version();

SELECT name_subcounty, name_state, name_state_short, zip_code, name_county AS county_name
FROM
  simplified_0_0002
WHERE
  ST_Contains(
      wkb_geometry,
      ST_GeomFromText('POINT(-84.55248203798119 38.93147168266376)', 4326)
  );