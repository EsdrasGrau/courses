# Chapter 1
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

# Chapter 2
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
