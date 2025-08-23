USE CS6400_PROJECT;
SET @given_postal_code = '44240';-- (SELECT PostalCode FROM AverageRadius WHERE PostalCode = ( SELECT MAX(PostalCode) FROM PostalCode));
SET @given_radius = 100; -- (SELECT Radius FROM AverageRadius); -- Search radius in miles
SET @given_latitude = (SELECT latitude FROM PostalCode WHERE PostalCode = @given_postal_code);
SET @given_longitude = (SELECT longitude FROM PostalCode WHERE PostalCode = @given_postal_code);

SELECT
  PostalCode,
  City,
  StateName,
  latitude,
  longitude,
  3958.75 * 2 * ATAN2(SQRT(SIN((latitude-@given_latitude) * PI()/180/2) * SIN((latitude-@given_latitude) * PI()/180/2) +
         COS(@given_latitude * PI()/180) * COS(latitude * PI()/180) *
         SIN((longitude-@given_longitude) * PI()/180/2) * SIN((longitude-@given_longitude) * PI()/180/2)), SQRT(1-SIN((latitude-@given_latitude) * PI()/180/2) * SIN((latitude-@given_latitude) * PI()/180/2) +
         COS(@given_latitude * PI()/180) * COS(latitude * PI()/180) *
         SIN((longitude-@given_longitude) * PI()/180/2) * SIN((longitude-@given_longitude) * PI()/180/2))) AS distance
FROM
  PostalCode
WHERE
  PostalCode <> @given_postal_code
  AND 3958.75 * 2 * ATAN2(SQRT(SIN((latitude-@given_latitude) * PI()/180/2) * SIN((latitude-@given_latitude) * PI()/180/2) +
         COS(@given_latitude * PI()/180) * COS(latitude * PI()/180) *
         SIN((longitude-@given_longitude) * PI()/180/2) * SIN((longitude-@given_longitude) * PI()/180/2)), SQRT(1-SIN((latitude-@given_latitude) * PI()/180/2) * SIN((latitude-@given_latitude) * PI()/180/2) +
         COS(@given_latitude * PI()/180) * COS(latitude * PI()/180) *
         SIN((longitude-@given_longitude) * PI()/180/2) * SIN((longitude-@given_longitude) * PI()/180/2)))<= @given_radius;
         
         
-- CREATE VIEW AverageDistanceByRadius AS
-- SELECT p.PostalCode, p.City, p.StateName,  p.Latitude,p.Longitude,
--        3958.75 * 2 * ATAN2(SQRT(SIN((latitude-@given_latitude) * PI()/180/2) * SIN((latitude-@given_latitude) * PI()/180/2) +
--          COS(@given_latitude * PI()/180) * COS(latitude * PI()/180) *
--          SIN((longitude-@given_longitude) * PI()/180/2) * SIN((longitude-@given_longitude) * PI()/180/2)), SQRT(1-SIN((latitude-@given_latitude) * PI()/180/2) * SIN((latitude-@given_latitude) * PI()/180/2) +
--          COS(@given_latitude * PI()/180) * COS(latitude * PI()/180) *
--          SIN((longitude-@given_longitude) * PI()/180/2) * SIN((longitude-@given_longitude) * PI()/180/2))) AS Distance
-- FROM PostalCode p
-- WHERE PostalCode <> @given_postal_code AND 
-- -- JOIN AverageRadius ar ON p.PostalCode = @given_postal_code -- ar.PostalCode WHERE
-- 3958.75 * 2 * ATAN2(SQRT(SIN((latitude-@given_latitude) * PI()/180/2) * SIN((latitude-@given_latitude) * PI()/180/2) +
--          COS(@given_latitude * PI()/180) * COS(latitude * PI()/180) *
--          SIN((longitude-@given_longitude) * PI()/180/2) * SIN((longitude-@given_longitude) * PI()/180/2)), SQRT(1-SIN((latitude-@given_latitude) * PI()/180/2) * SIN((latitude-@given_latitude) * PI()/180/2) +
--          COS(@given_latitude * PI()/180) * COS(latitude * PI()/180) *
--          SIN((longitude-@given_longitude) * PI()/180/2) * SIN((longitude-@given_longitude) * PI()/180/2))) <= @given_radius; -- ar.Radius;
