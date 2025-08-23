USE CS6400_PROJECT;
SET @given_postal_code = '44240';-- (SELECT PostalCode FROM AverageRadius WHERE PostalCode = ( SELECT MAX(PostalCode) FROM PostalCode));
SET @given_radius = 100; -- (SELECT Radius FROM AverageRadius); -- Search radius in miles
SET @given_latitude = (SELECT latitude FROM PostalCode WHERE PostalCode = @given_postal_code);
SET @given_longitude = (SELECT longitude FROM PostalCode WHERE PostalCode = @given_postal_code);

SELECT
  p.Postalcode,
  Round(3958.75 * 2 * ATAN2(SQRT(SIN((latitude-@given_latitude) * PI()/180/2) * SIN((latitude-@given_latitude) * PI()/180/2) +
         COS(@given_latitude * PI()/180) * COS(latitude * PI()/180) *
         SIN((longitude-@given_longitude) * PI()/180/2) * SIN((longitude-@given_longitude) * PI()/180/2)), SQRT(1-SIN((latitude-@given_latitude) * PI()/180/2) * SIN((latitude-@given_latitude) * PI()/180/2) +
         COS(@given_latitude * PI()/180) * COS(latitude * PI()/180) *
         SIN((longitude-@given_longitude) * PI()/180/2) * SIN((longitude-@given_longitude) * PI()/180/2))),1) AS distance,
h.Household_Type, COALESCE(Count(*),0) as cnt_household, Round(Avg(h.Heating_temperature),1),Round(Avg(h.Cooling_temperature),1), group_concat(utilityname, ', ') AS utilities
FROM
  PostalCode p
Join Household h
ON h.PostalCode = p.PostalCode
Join Household_utilities u
ON h.email =u.email
Join Powergenerator g
ON g.email = h.email
WHERE
  p.PostalCode <> @given_postal_code
  AND (3958.75 * 2 * ATAN2(SQRT(SIN((latitude-@given_latitude) * PI()/180/2) * SIN((latitude-@given_latitude) * PI()/180/2) +
         COS(@given_latitude * PI()/180) * COS(latitude * PI()/180) *
         SIN((longitude-@given_longitude) * PI()/180/2) * SIN((longitude-@given_longitude) * PI()/180/2)), SQRT(1-SIN((latitude-@given_latitude) * PI()/180/2) * SIN((latitude-@given_latitude) * PI()/180/2) +
         COS(@given_latitude * PI()/180) * COS(latitude * PI()/180) *
         SIN((longitude-@given_longitude) * PI()/180/2) * SIN((longitude-@given_longitude) * PI()/180/2)))>= @given_radius)
         Group by p.Postalcode,h.Household_Type;