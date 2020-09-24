SELECT c.hacker_id, h.name, count(c.hacker_id) as c_count
FROM hackers as h
    INNER JOIN challenges AS c
    ON h.hacker_id = c.hacker_id
GROUP BY c.hacker_id, h.name
HAVING
    c_count =
        (SELECT MAX(temp1.cnt)
        FROM (SELECT COUNT(hacker_id) AS cnt
             FROM challenges
             GROUP BY hacker_id
             ORDER BY hacker_id) temp1)
    OR c_count IN
        (SELECT t.cnt
        FROM (SELECT count(*) AS cnt
                FROM challenges
                GROUP BY hacker_id) t
        GROUP BY t.cnt
        having count(t.cnt) = 1)

ORDER BY c_count DESC, c.hacker_id;
