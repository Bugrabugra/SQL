SELECT name || ', ' || country
FROM cities;

SELECT CONCAT(name, ', ', country)
FROM cities;

SELECT CONCAT(upper(name), ', ', UPPER(country))
FROM cities;

SELECT UPPER(CONCAT(name, ', ', country))
FROM cities;