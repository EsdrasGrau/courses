SELECT concat(NAME,concat("(",LEFT(occupation,1),")"))
FROM OCCUPATIONS
ORDER BY NAME ASC;

SELECT "There are a total of", count(OCCUPATION), concat(lower(occupation),"s.")
FROM OCCUPATIONS
GROUP BY OCCUPATION
ORDER BY count(OCCUPATION) ASC;
