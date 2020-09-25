SELECT city.name
FROM city
INNER JOIN country
ON city.countrycode = country.code
WHERE continent = 'Africa';
