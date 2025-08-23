def heating_details(mysql, state):
    cursor = mysql.connection.cursor()
    query = 'SELECT  es.sourcename, ROUND(MIN(w.tanksize)) AS min_tank_size, ROUND(AVG(w.tanksize)) AS avg_tank_size,ROUND(MAX(w.tanksize)) AS max_tank_size, MIN(w.temperature) AS min_temperature_setting, ROUND(AVG(w.temperature), 1) AS avg_temperature_setting, MAX(w.temperature) AS max_temperature_setting FROM energysource es JOIN waterheater w ON  w.SourceID = es.SourceID JOIN appliances a ON a.HouseholdApplianceNum = w.HouseholdApplianceNum and a.email = w.email JOIN household h ON a.email = h.email JOIN postalcode p ON h.postalcode = p.postalcode WHERE p.statename = %s GROUP BY es.sourcename ORDER BY es.sourcename ASC';
    cursor.execute(query, (state,))
    data = cursor.fetchall()
    cursor.close()
    return data