SELECT n1.a AS prime
  FROM generate_series(2, 100) AS n1(a)
  WHERE NOT EXISTS (
    SELECT n2.a
    FROM generate_series(2, n1.a-1) AS n2(a)
    WHERE n1.a % n2.a = 0
    ); 
