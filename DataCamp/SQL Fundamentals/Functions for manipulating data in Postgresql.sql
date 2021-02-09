-- CHAPTER 1
-- Select all columns from the INFORMATION_SCHEMA.TABLES system database.
-- Limit results that have a public table_schema.

-- Select all columns from the TABLES system database
SELECT *
FROM INFORMATION_SCHEMA.TABLES
-- Filter by schema
WHERE table_schema = 'public';

-- Select all columns from the INFORMATION_SCHEMA.COLUMNS system database.
-- Limit by table_name to actor
-- Select all columns from the COLUMNS system database
SELECT *
FROM information_schema.columns
WHERE table_name = 'actor';

-- Select the column name and data type from the INFORMATION_SCHEMA.COLUMNS system database.
-- Limit results to only include the customer table.
-- Get the column name and data type
SELECT
 	column_name,
    data_type
-- From the system database information schema
FROM INFORMATION_SCHEMA.COLUMNS
-- For the customer table
WHERE table_name = 'customer';

-- Select the rental date and return date from the rental table.
-- Add an INTERVAL of 3 days to the rental_date to calculate the expected return date`.

-- 1 of 3
-- Select the title and special features from the film table and compare the results between the two columns.
-- Select the title and special features column
SELECT
  title,
  special_features
FROM film;

-- 2 of 3
-- Select all films that have a special feature Trailers by filtering on the first index of the special_features ARRAY.
-- Select the title and special features column
SELECT
  title,
  special_features
FROM film
-- Use the array index of the special_features column
WHERE special_features[1] = 'Trailers';

-- 3 of 3
-- Now let's select all films that have Deleted Scenes in the second index of the special_features ARRAY.
-- Select the title and special features column
SELECT
  title,
  special_features
FROM film
-- Use the array index of the special_features column
WHERE special_features[2] = 'Deleted Scenes';

-- Match 'Trailers' in any index of the special_features ARRAY regardless of position.
SELECT
  title,
  special_features
FROM film
-- Modify the query to use the ANY function
WHERE 'Trailers' = ANY (special_features);

-- Use the contains operator to match the text Deleted Scenes in the special_features column.
SELECT
  title,
  special_features
FROM film
-- Filter where special_features contains 'Deleted Scenes'
WHERE special_features @> ARRAY['Deleted Scenes'];



-- CHAPTER 2
-- 1 of 2
-- Subtract the rental_date from the return_date to calculate the number of days_rented.

SELECT f.title, f.rental_duration,
    -- Calculate the number of days rented
    r.return_date - r.rental_date AS days_rented
FROM film AS f
     INNER JOIN inventory AS i ON f.film_id = i.film_id
     INNER JOIN rental AS r ON i.inventory_id = r.inventory_id
ORDER BY f.title;

-- 2 of 2
-- Now use the AGE() function to calculate the days_rented
SELECT f.title, f.rental_duration,
    -- Calculate the number of days rented
	AGE(r.return_date, r.rental_date) AS days_rented
FROM film AS f
	INNER JOIN inventory AS i ON f.film_id = i.film_id
	INNER JOIN rental AS r ON i.inventory_id = r.inventory_id
ORDER BY f.title;
