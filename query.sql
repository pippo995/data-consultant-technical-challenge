
SELECT * 
FROM `reservations`
WHERE (date BETWEEN PARSE_DATE('%m-%d-%Y',  '10-07-2022') AND PARSE_DATE('%m-%d-%Y',  '15-07-2022')
OR date BETWEEN PARSE_DATE('%m-%d-%Y',  '10-07-2022') AND PARSE_DATE('%m-%d-%Y',  '15-07-2022'))
AND deleted = 0


WITH
  t1 AS (
  SELECT *,
    ROW_NUMBER() OVER (PARTITION BY name, type ORDER BY date DESC) AS rn
  FROM `spots`)
SELECT *
FROM t1
WHERE rn = 1