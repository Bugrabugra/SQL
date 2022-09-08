-- year
SELECT *
FROM FinancialStatus
WHERE strftime('%Y', date) = '2022';

-- year, month
SELECT *
FROM FinancialStatus
WHERE strftime('%Y-%m', date) = '2022-08';

-- year, month, day
SELECT *
FROM FinancialStatus
WHERE strftime('%Y-%m-%d', date) = '2022-09-04';

-- year
SELECT strftime('%Y-%m', date), SUM(value), value_type
FROM FinancialStatus
WHERE strftime('%Y', date) = '2022'
GROUP BY strftime('%Y-%m', date), value_type
;




