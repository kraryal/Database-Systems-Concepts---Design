def get_average_radiusdata(mysql, postal_code, given_longitude, given_latitude, given_radius):
    cursor = mysql.connection.cursor()
    cursor.execute('SET @given_latitude = %s;', (given_latitude,))
    cursor.execute('SET @given_longitude = %s;', (given_longitude,))
    cursor.execute('SET @given_radius = %s;', (given_radius,))
    cursor.execute('SET @given_postal_code = %s;', (postal_code,))
    cursor.execute('''SELECT
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
             SIN((longitude-@given_longitude) * PI()/180/2) * SIN((longitude-@given_longitude) * PI()/180/2)))<= @given_radius order by distance;''')
    data = cursor.fetchall()
    cursor.close()
    return data