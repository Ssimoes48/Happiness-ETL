--Querying happiness score by government
SELECT h.country, AVG(h.happiness_score), g.govt_type
FROM happiness_index h
INNER JOIN countries_by_government g
ON (h.country=g.country)
GROUP BY h.country, g.govt_type
ORDER BY AVG(h.happiness_score) DESC;

--Querying all tables and columns
SELECT c.country, c.continent, c.region, g.govt_type, g.head_of_state, g.head_of_government, AVG(h.happiness_score), AVG(h.gdp_per_capita), AVG(h.social_support), AVG(h.healthy_life_expectancy), AVG(h.choice_freedom), AVG(h.generosity), AVG(h.perceptions_of_corruption), AVG(h.year), p.population, p.area, p.density, p.population_growth_rate, p.world_percentage
FROM countries c
INNER JOIN countries_by_government g ON c.country=g.country
INNER JOIN happiness_index h ON g.country=h.country
INNER JOIN population p ON h.country=p.country
GROUP BY c.country, c.continent, c.region, g.govt_type, g.head_of_state, g.head_of_government, p.population, p.area, p.density, p.population_growth_rate, p.world_percentage
ORDER BY region DESC;

--Querying all tables and columns for a specific country
SELECT c.country, c.continent, c.region, g.govt_type, g.head_of_state, g.head_of_government, AVG(h.happiness_score), AVG(h.gdp_per_capita), AVG(h.social_support), AVG(h.healthy_life_expectancy), AVG(h.choice_freedom), AVG(h.generosity), AVG(h.perceptions_of_corruption), AVG(h.year), p.population, p.area, p.density, p.population_growth_rate, p.world_percentage
FROM countries c
INNER JOIN countries_by_government g ON c.country=g.country
INNER JOIN happiness_index h ON g.country=h.country
INNER JOIN population p ON h.country=p.country
WHERE c.country = 'United Kingdom'
GROUP BY c.country, c.continent, c.region, g.govt_type, g.head_of_state, g.head_of_government, p.population, p.area, p.density, p.population_growth_rate, p.world_percentage;