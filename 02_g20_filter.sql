SELECT country, year, co2, gdp, co2_per_capita,
       co2_per_gdp, coal_co2, oil_co2, gas_co2, population
FROM emissions
WHERE country IN ('Australia', 'Brazil', 'Canada', 'China',
  'France', 'Germany', 'India', 'Indonesia',
  'Italy', 'Japan', 'Mexico', 'Russia',
  'Saudi Arabia', 'South Africa', 'South Korea',
  'Turkey', 'United Kingdom', 'United States'
)
AND year BETWEEN 2000 AND 2022
AND co2 IS NOT NULL 
AND gdp IS NOT NULL 
ORDER BY country, year; 
