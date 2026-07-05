##Project: G20 carbon emissions decoupling analysis — which economies are growing while cutting CO₂?
-- How many rows and countries?
SELECT COUNT(*) AS total_rows, COUNT(DISTINCT country) AS countries
FROM emissions;
--
-- What year range do we have?
SELECT MIN(year), MAX(year) FROM emissions;

-- Check for nulls in key columns 
SELECT 
	COUNT(*) - COUNT(co2) AS missing_co2, 
	COUNT(*) - COUNT(gdp) AS missing_gdp, 
	COUNT(*) - COUNT(co2_per_capita) AS missing_per_capita
FROM emissions;
-- 21027	35160	23902


-- Top 10 emitters in 2022
SELECT country, ROUND(CAST(co2 AS REAL), 1) AS co2_mt
FROM emissions
WHERE year = 2022 
  AND co2 IS NOT NULL
  AND iso_code IS NOT NULL
  AND iso_code NOT LIKE 'OWID%'
ORDER BY CAST(co2 AS REAL) DESC
LIMIT 10;
-- China, United states, India , Russia, Japan, Iran, Indonesia, Germany, SAR, Korea


