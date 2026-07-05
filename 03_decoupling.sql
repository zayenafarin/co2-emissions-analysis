--03_DECOUPLING.SQL — THE CORE ANALYSIS 
-- Calculate GDP growth and CO2 growth between 2000 and 2022
-- Countries where GDP grew but CO2 fell = "decoupling"
WITH base_year AS (
  SELECT country, co2 AS co2_2000, gdp AS gdp_2000
  FROM emissions
  WHERE year = 2000
    AND co2 IS NOT NULL AND gdp IS NOT NULL
),
recent_year AS (
  SELECT country, co2 AS co2_2022, gdp AS gdp_2022
  FROM emissions
  WHERE year = 2022
    AND co2 IS NOT NULL AND gdp IS NOT NULL
)
SELECT
  b.country,
  ROUND((r.gdp_2022 - b.gdp_2000) / b.gdp_2000 * 100, 1) AS gdp_growth_pct,
  ROUND((r.co2_2022 - b.co2_2000) / b.co2_2000 * 100, 1) AS co2_growth_pct,
  CASE
    WHEN r.co2_2022 < b.co2_2000 THEN 'Decoupled!'
    WHEN r.co2_2022 / b.co2_2000 < r.gdp_2022 / b.gdp_2000 THEN 'Relative decoupling'
    ELSE 'Not decoupled'
  END AS decoupling_status
FROM base_year b
JOIN recent_year r ON b.country = r.country
WHERE b.country IN (
  'Australia','Brazil','Canada','China','France',
  'Germany','India','Japan','United Kingdom','United States'
)
ORDER BY co2_growth_pct;
