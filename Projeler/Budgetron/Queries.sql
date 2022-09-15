-- year
SELECT *
FROM
  FinancialStatus
WHERE
  STRFTIME('%Y', date) = '2022';

-- year, month
SELECT *
FROM
  FinancialStatus
WHERE
  STRFTIME('%Y-%m', date) = '2022-08';

-- year, month, day
SELECT *
FROM
  FinancialStatus
WHERE
  STRFTIME('%Y-%m-%d', date) = '2022-09-04';

-- group by
SELECT
    (SELECT '2022-09')       AS date,
  (SELECT SUM(value)
   FROM
     FinancialStatus
   WHERE
     STRFTIME('%Y-%m', date) = '2022-09' AND
     value_type = 'income')  AS 'income',
  (SELECT SUM(value)
   FROM
     FinancialStatus
   WHERE
     STRFTIME('%Y-%m', date) = '2022-09' AND
     value_type = 'expense') AS 'expense'
FROM
  FinancialStatus
WHERE
  STRFTIME('%Y-%m', date) = '2022-09'
GROUP BY
  STRFTIME('%Y-%m', date)
;

-- select specific
SELECT *
FROM
  FinancialStatus
WHERE
  STRFTIME('%Y-%m-%d', date) = '2022-07-04';

-- select detailed
SELECT
    (SELECT d.dates)         AS date,
  (SELECT SUM(value)
   FROM
     FinancialStatus
   WHERE
     STRFTIME('%Y-%m-%d', date) = d.dates AND
     value_type = 'income')  AS 'income',
  (SELECT SUM(value)
   FROM
     FinancialStatus
   WHERE
     STRFTIME('%Y-%m-%d', date) = d.dates AND
     value_type = 'expense') AS 'expense'

FROM
  FinancialStatus AS fs,
  (SELECT DISTINCT
     STRFTIME('%Y-%m-%d', date) AS dates
   FROM
     FinancialStatus
   WHERE
     STRFTIME('%Y-%m', date) = ?)
    AS d
WHERE
  STRFTIME('%Y-%m-%d', date) = d.dates
GROUP BY
  STRFTIME('%Y-%m-%d', date)


