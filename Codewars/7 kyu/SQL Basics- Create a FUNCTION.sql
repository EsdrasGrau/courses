CREATE FUNCTION ageincrement (age integer)
RETURNS integer AS $$
BEGIN
  RETURN (SELECT id, name, age+1);
END;
 $$ LANGUAGE plpgsql;
