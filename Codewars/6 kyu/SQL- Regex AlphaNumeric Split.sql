SELECT
  project,
  REGEXP_REPLACE(address,'[[:digit:]]','','g') AS letters,
  REGEXP_REPLACE(address,'[[:alpha:]]','','g') AS numbers
FROM repositories;
