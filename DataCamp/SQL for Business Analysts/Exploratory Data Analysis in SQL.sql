SELECT count(*) - COUNT(ticker) AS missing
  FROM fortune500;


SELECT COUNT(*) - COUNT(profits_change) AS missing
FROM fortune500;


SELECT COUNT(*) - COUNT(industry) AS missing
FROM fortune500;


SELECT company.name
-- Table(s) to select from
  FROM company
       INNER JOIN fortune500
       ON company.ticker=fortune500.ticker;



-- Count the number of tags with each type
SELECT type, COUNT(type) AS count
  FROM tag_type
 -- To get the count for each type, what do you need to do?
 GROUP BY type
 -- Order the results with the most common
 -- tag types listed first
 ORDER BY count DESC;



 -- Select the 3 columns desired
SELECT company.name, tag_type.tag, tag_type.type
  FROM company
  	   -- Join to the tag_company table
       INNER JOIN tag_company
       ON company.id = tag_company.company_id
       -- Join to the tag_type table
       INNER JOIN tag_type
       ON tag_company.tag = tag_type.tag
  -- Filter to most common type
  WHERE type='cloud';



  -- Use coalesce
  SELECT COALESCE(industry, sector, 'Unknown') AS industry2,
         -- Don't forget to count!
         COUNT(*)
    FROM fortune500
  -- Group by what? (What are you counting by?)
   GROUP BY industry2
  -- Order results to see most common first
   ORDER BY count DESC
  -- Limit results to get just the one value you want
   LIMIT 1;




SELECT company_original.name, title, rank
  -- Start with original company information
  FROM company AS company_original
       -- Join to another copy of company with parent
       -- company information
	   LEFT JOIN company AS company_parent
       ON company_original.parent_id = company_parent.id
       -- Join to fortune500, only keep rows that match
       INNER JOIN fortune500
       -- Use parent ticker if there is one,
       -- otherwise original ticker
       ON coalesce(company_parent.ticker,
                   company_original.ticker) =
             fortune500.ticker
 -- For clarity, order by rank
 ORDER BY rank;



-- Select the original value
SELECT profits_change,
	   -- Cast profits_change
       CAST(profits_change AS integer) AS profits_change_int
  FROM fortune500;

  -- Divide 10 by 3
  SELECT 10/3,
         -- Cast 10 as numeric and divide by 3
         10::numeric/3;



SELECT '3.2'::numeric,
       '-123'::numeric,
       '1e3'::numeric,
       '1e-3'::numeric,
       '02314'::numeric,
       '0002'::numeric;




-- Select the count of each value of revenues_change
SELECT revenues_change, COUNT(*)
  FROM fortune500
 GROUP BY revenues_change
 -- order by the values of revenues_change
 ORDER BY revenues_change;



 -- Select the count of each revenues_change integer value
SELECT revenues_change::integer, COUNT(*)
  FROM fortune500
 GROUP BY revenues_change::integer
 -- order by the values of revenues_change
 ORDER BY revenues_change;



 -- Count rows
SELECT COUNT(*)
  FROM fortune500
 -- Where...
 WHERE revenues_change > 0;



 -- Select average revenue per employee by sector
SELECT sector,
       AVG(revenues/employees::numeric) AS avg_rev_employee
  FROM fortune500
 GROUP BY sector
 -- Use the column alias to order the results
 ORDER BY avg_rev_employee;


 -- Divide unanswered_count by question_count
SELECT unanswered_count/question_count::numeric AS computed_pct,
       -- What are you comparing the above quantity to?
       unanswered_pct
  FROM stackoverflow
 -- Select rows where question_count is not 0
 WHERE question_count > 0
 LIMIT 10;



 -- Select min, avg, max, and stddev of fortune500 profits
SELECT MIN(profits),
       AVG(profits),
       MAX(profits),
       STDDEV(profits)
  FROM fortune500;




-- Select sector and summary measures of fortune500 profits
SELECT
       sector,
       MIN(profits),
       AVG(profits),
       MAX(profits),
       STDDEV(profits)
  FROM fortune500
 -- What to group by?
 GROUP BY sector
 -- Order by the average profits
 ORDER BY AVG;
