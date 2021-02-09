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
