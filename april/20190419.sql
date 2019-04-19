  SELECT c.continent, c.name, t.Name, t.Population
  FROM country AS c
  INNER JOIN city AS t 		
  ON c.code = t.countrycode
  where c.continent = 'Europe'
  order by t.Population desc limit 10;