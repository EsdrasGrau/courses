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

-- Question 6
SELECT m_name, born, instrument
FROM musician AS m
  JOIN performer AS p
  ON m.m_no = p.perf_is

WHERE instrument IN
   (SELECT instrument
    FROM musician
    JOIN performer
    ON m_no = perf_is
    WHERE m_name = 'Theo Mengel');

-- Question 7
SELECT band_name, COUNT(player) AS Total

FROM band AS b
  JOIN plays_in AS pi
  ON b.band_no = band_id
GROUP BY band_name
HAVING COUNT(player) > (SELECT COUNT(perf_is) / COUNT(DISTINCT band_id)
     FROM performer AS p
     JOIN plays_in AS pi
     ON p.perf_no = pi.player);



-- Question 8
SELECT m_name
FROM musician AS m
  JOIN place AS p
  ON m.living_in = p.place_no
  JOIN composer AS c
  on m.m_no = c.comp_is
  JOIN performance AS pe
  on m.m_no= pe.conducted_by

WHERE place_country IN ('England', 'Scotland')
GROUP BY m_name;

-- Question 8 Alternate
SELECT
    m_name, living_in, place_country
FROM
    musician m
        JOIN
    place p ON m.living_in = p.place_no
WHERE
    m_no IN (SELECT
            comp_is
        FROM
            composer)
        AND m_no IN (SELECT
            conducted_by
        FROM
            performance)
        AND place_country IN ('England' , 'Scotland');

-- Question 9
SELECT instrument, COUNT(m_no) AS Total
FROM performer AS p
  JOIN musician AS m
  ON p.perf_is = m.m_no
GROUP BY instrument
ORDER BY Total

-- Alternate
SELECT instrument, COUNT(m_no) AS Total
FROM performer AS p
  JOIN musician AS m
  ON p.perf_is = m.m_no
GROUP BY instrument
HAVING COUNT(Total) < 2;

-- Simple version
SELECT COUNT(perf_is) AS Total, instrument
FROM
  performer
GROUP BY instrument
HAVING COUNT(Total) < 2;

-- Question 10 (incomplete)
SELECT
    band_name
FROM
    band
WHERE
    band_no in (SELECT
            gave
        FROM
            performance
        WHERE
            performed in (SELECT
                    c_no
                FROM
                    composition
                WHERE
                    c_in in (SELECT
                            m_no
                        FROM
                            musician
                        WHERE
                            m_name = 'Sue Little')))
