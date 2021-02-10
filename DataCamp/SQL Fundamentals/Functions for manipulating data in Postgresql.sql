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

/* Convert rental_duration by multiplying it with a 1 day INTERVAL
Subtract the rental_date from the return_date to calculate the number of days_rented.
Exclude rentals with a NULL value for return_date. */
-- The rental duration is a int but needs to be changed into an interval for calculations
SELECT
	f.title,
 	-- Convert the rental_duration to an interval
    interval '1' day * f.rental_duration,
 	-- Calculate the days rented as we did previously
    r.return_date - r.rental_date AS days_rented
FROM film AS f
    INNER JOIN inventory AS i ON f.film_id = i.film_id
    INNER JOIN rental AS r ON i.inventory_id = r.inventory_id
-- Filter the query to exclude outstanding rentals
WHERE r.return_date IS NOT NULL
ORDER BY f.title;

-- Convert rental_duration by multiplying it with a 1-day INTERVAL.
-- Add it to the rental date.

SELECT
    f.title,
	r.rental_date,
    f.rental_duration,
    -- Add the rental duration to the rental date
    INTERVAL '1' day * f.rental_duration + r.rental_date AS expected_return_date,
    r.return_date
FROM film AS f
    INNER JOIN inventory AS i ON f.film_id = i.film_id
    INNER JOIN rental AS r ON i.inventory_id = r.inventory_id
ORDER BY f.title;

-- 1 OF 2
-- Get the day of the week from the rental_date column.
SELECT
  -- Extract day of week from rental_date
  EXTRACT(DOW FROM rental_date) AS dayofweek
FROM rental
LIMIT 100;

-- 2 OF 2
-- Count the total number of rentals by day of the week.
-- Extract day of week from rental_date
SELECT
  EXTRACT(dow FROM rental_date) AS dayofweek,
  -- Count the number of rentals
  Count(rental_id) as rentals
FROM rental
GROUP BY 1;

-- 1 of 2
-- Extract the day of the week from the rental_date column using the alias dayofweek.
-- Use an INTERVAL in the WHERE clause to select records for the 90 day period starting on 5/1/2005
SELECT
  -- Extract the day of week date part from the rental_date
  EXTRACT(DOW FROM rental_date) AS dayofweek,
  AGE(return_date, rental_date) AS rental_days
FROM rental AS r
WHERE
  -- Use an INTERVAL for the upper bound of the rental_date
  rental_date BETWEEN CAST('2005-05-01' AS timestamp)
   AND CAST('2005-05-01' AS timestamp) + INTERVAL '90 day';

-- 2 of 2
-- Finally, use a CASE statement and DATE_TRUNC() to create a new column called
-- past_due which will be TRUE if the rental_days is greater than the rental_duration
-- therwise, it will be FALSE.
SELECT
  c.first_name || ' ' || c.last_name AS customer_name,
  f.title,
  r.rental_date,
  -- Extract the day of week date part from the rental_date
  EXTRACT(dow FROM r.rental_date) AS dayofweek,
  AGE(r.return_date, r.rental_date) AS rental_days,
  -- Use DATE_TRUNC to get days from the AGE function
  CASE WHEN DATE_TRUNC('day', AGE(r.return_date, r.rental_date)) >
  -- Calculate number of d
    f.rental_duration * INTERVAL '1' day
  THEN TRUE
  ELSE FALSE END AS past_due
FROM
  film AS f
  INNER JOIN inventory AS i
  	ON f.film_id = i.film_id
  INNER JOIN rental AS r
  	ON i.inventory_id = r.inventory_id
  INNER JOIN customer AS c
  	ON c.customer_id = r.customer_id
WHERE
  -- Use an INTERVAL for the upper bound of the rental_date
  r.rental_date BETWEEN CAST('2005-05-01' AS DATE)
  AND CAST('2005-05-01' AS DATE) + INTERVAL '90 day';

  -- CHAPTER 3

-- 1 of 2
-- Concatenate the first_name and last_name columns separated by a single space followed by email surrounded by < and >.
-- Concatenate the first_name and last_name and email
SELECT first_name || ' ' || last_name || ' <' || email || '>' AS full_email
FROM customer

-- 2 of 2
-- Concatenate the first_name and last_name and email
SELECT CONCAT(first_name, ' ', last_name,  ' <', email, '>') AS full_email FROM customer


-- Convert the film category name to uppercase.
-- Convert the first letter of each word in the film's title to upper case.
-- Concatenate the converted category name and film title separated by a colon.
-- Convert the description column to lowercase.

SELECT
  -- Concatenate the category name to coverted to uppercase
  -- to the film title converted to title case
  UPPER(c.name)  || ': ' || INITCAP(f.title) AS film_category,
  -- Convert the description column to lowercase
  LOWER(f.description) AS description
FROM
  film AS f
  INNER JOIN film_category AS fc
  	ON f.film_id = fc.film_id
  INNER JOIN category AS c
  	ON fc.category_id = c.category_id;

-- Replace all whitespace with an underscore.
SELECT
  -- Replace whitespace in the film title with an underscore
  REPLACE(title, ' ', '_') AS title
FROM film;

-- Select the title and description columns from the film table.
-- Find the number of characters in the description column with the alias desc_len.
SELECT
  -- Select the title and description columns
  title,
  description,
  -- Determine the length of the description column
  CHAR_LENGTH(description) AS desc_len
FROM film;

-- Select the first 50 characters of the description column with the alias short_desc
SELECT
  -- Select the first 50 characters of description
  LEFT(description, 50) AS short_desc
FROM
  film AS f;

-- Extract only the street address without the street number from the address column.
-- Use functions to determine the starting and ending position parameters.
SELECT
  -- Select only the street name from the address table
  SUBSTRING(address FROM POSITION(' ' IN address)+1 FOR CHAR_LENGTH(address))
FROM
  address;

--  Extract the characters to the left of the @ of the email column in the customer table and alias it as username.
--  Now use SUBSTRING to extract the characters after the @ of the email column and alias the new derived field as domain.
SELECT
  -- Extract the characters to the left of the '@'
  LEFT(email, POSITION('@' IN email)-1) AS username,
  -- Extract the characters to the right of the '@'
  SUBSTRING(email FROM POSITION('@' IN email)+1 FOR CHAR_LENGTH(email)) AS domain
FROM customer;
