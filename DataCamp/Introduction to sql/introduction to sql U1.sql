-- Chapter 1
SELECT name FROM people;

SELECT title, release_year, country
FROM films;

SELECT *
FROM films;

SELECT DISTINCT country
FROM films;

SELECT DISTINCT certification
FROM films;

SELECT DISTINCT role
FROM roles;

SELECT COUNT (*)
FROM reviews;

SELECT COUNT(*)
FROM people;

SELECT COUNT(birthdate)
FROM people;

SELECT COUNT(DISTINCT birthdate)
FROM people;

SELECT COUNT (DISTINCT language)
FROM films;

SELECT COUNT (DISTINCT country)
FROM films;

-- Chapter 2
SELECT *
FROM films
WHERE release_year = 2016;

SELECT COUNT(title)
FROM films
WHERE release_year < 2000;

SELECT title, release_year
FROM films
WHERE release_year > 2000;

SELECT *
FROM films
WHERE language = 'French';

SELECT name, birthdate
FROM people
WHERE birthdate = '1974-11-11'

SELECT COUNT(title)
FROM films
WHERE language = 'Hindi';

SELECT *
FROM films
WHERE certification = 'R';

SELECT title, release_year
FROM films
WHERE language = 'Spanish' AND release_year < 2000;

SELECT *
FROM films
WHERE language = 'Spanish' AND release_year > 2000;

SELECT *
FROM films
WHERE language = 'Spanish' AND release_year > 2000
AND release_year < 2010;

SELECT title, release_year
FROM films
WHERE (release_year >= 1990 AND release_year < 2000)
AND (language = 'French' OR language = 'Spanish')
AND (gross > 2000000);


SELECT title, release_year
FROM films
WHERE release_year BETWEEN 1990 AND 2000
AND (language = 'Spanish' OR language = 'French')
AND budget >100000000;

SELECT title, release_year
FROM films
WHERE release_year IN (1990,2000)
AND duration > 120;

SELECT title, language
FROM films
WHERE language IN ('English', 'Spanish', 'French');

SELECT title, certification
FROM films
WHERE certification IN ('NC-17','R');

SELECT name
FROM people
WHERE deathdate IS NULL;

SELECT title
FROM films
WHERE budget IS NULL;

SELECT COUNT(title)
FROM films
WHERE language IS NULL;

SELECT name
FROM people
WHERE name LIKE 'B%';

SELECT name
FROM people
WHERE name LIKE '_r%';

SELECT name
FROM people
WHERE name NOT LIKE 'A%';

-- Chapter 3
SELECT AVG(duration)
FROM films;

SELECT MAX(duration)
FROM films;

SELECT SUM(gross)
FROM films;

SELECT SUM(gross)
FROM films
WHERE release_year >= 2000;

SELECT AVG(gross)
FROM films
WHERE title like 'A%';

SELECT MIN(gross)
FROM films
WHERE release_year = 1994;

SELECT MAX(gross)
FROM films
WHERE release_year BETWEEN 2000 AND 2012;

SELECT title, gross - budget AS net_profit
FROM films;

SELECT title, duration / 60.0 AS duration_hours
FROM films;

SELECT AVG(duration)/60.0 AS avg_duration_hours
FROM films;

SELECT (COUNT(deathdate) * 100.0) / COUNT(*) AS percentage_dead
FROM people;

SELECT MAX(release_year) - MIN(release_year) AS difference
FROM films;

SELECT (MAX(release_year) - MIN(release_year)) / 10 AS number_of_decades
FROM films;

-- Chapter 4
