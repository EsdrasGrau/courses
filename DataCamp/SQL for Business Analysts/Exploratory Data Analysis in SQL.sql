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
