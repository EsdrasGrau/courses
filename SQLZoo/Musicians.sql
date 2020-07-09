-- Question 1

SELECT m_name
FROM concert
 JOIN musician
 ON musician.m_no =concert.concert_orgniser
WHERE concert_venue = "Assembly Rooms"AND con_date > 20 / 09 / 97;


-- Question 2

SELECT m_name, instrument, place_country
FROM musician AS m
  LEFT JOIN place AS p
  ON m.born_in = place_no
  LEFT JOIN performer as pe
  ON m.m_no = pe.perf_no
WHERE (instrument = 'guitar' OR instrument = 'violin') AND place_country = 'England';

-- Question 3
SELECT m_name, place_town ,con_date
FROM musician AS m
  JOIN concert AS c
  ON m.m_no = c.concert_orgniser
  JOIN place AS p
  ON p.place_no = c.concert_in
WHERE place_country = 'USA';

-- Question 4
SELECT COUNT(con_date) ,concert_venue,c_title
FROM musician AS m
  JOIN concert AS c
  ON m.m_no = c.concert_orgniser
  JOIN composition AS co
  ON co.c_in = c.concert_in
WHERE m_name = 'Andy Jones';

-- Question 5
SELECT instrument, count(m_no)/ ((select count(m_no) from musician))*100
FROM musician AS m
  JOIN performer AS p
  ON m.m_no = p.perf_is
GROUP BY instrument;
