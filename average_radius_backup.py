def get_average_radiusdata(mysql, postal_code, given_longitude, given_latitude, given_radius):
    cursor = mysql.connection.cursor()
    cursor.execute('SET @given_latitude = %s;', (given_latitude,))
    cursor.execute('SET @given_longitude = %s;', (given_longitude,))
    cursor.execute('SET @given_radius = %s;', (given_radius,))
    cursor.execute('SET @postal_code = %s;', (postal_code,))
    cursor.execute('''SELECT
  PostalCode,
  City,
  StateName,
  latitude,
  longitude,
  3958.75 * 2 * ASIN(
    SQRT(
      POWER(SIN((RADIANS(@given_latitude) - RADIANS(latitude)) / 2), 2) +
      COS(RADIANS(@given_latitude)) * COS(RADIANS(latitude)) *
      POWER(SIN((RADIANS(@given_longitude) - RADIANS(longitude)) / 2), 2)
    )
  ) AS distance
FROM
  PostalCode
WHERE
  PostalCode <> @postal_code
  AND 3958.75 * 2 * ASIN(
    SQRT(
      POWER(SIN((RADIANS(@given_latitude) - RADIANS(latitude)) / 2), 2) +
      COS(RADIANS(@given_latitude)) * COS(RADIANS(latitude)) *
      POWER(SIN((RADIANS(@given_longitude) - RADIANS(longitude)) / 2), 2)
    )
  ) <= @given_radius;''')
    data = cursor.fetchall()
    cursor.close()
    return data