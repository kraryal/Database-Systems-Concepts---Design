def get_water_heater_stat(mysql):
    cursor = mysql.connection.cursor()
    cursor.execute('''SELECT  p.StateName, ROUND(AVG(Tanksize), 1), ROUND(AVG(BTURating),0),ROUND(AVG(Temperature), 1) p, count(CASE WHEN temperature IS NOT NULL THEN 1 END) AS households_with_temp_setting,COUNT(CASE WHEN temperature IS NULL THEN 1 END) AS households_no_temp_setting
                FROM PostalCode p 
                JOIN Household h
                ON p.PostalCode = h.PostalCode
                JOIN Appliances a
                ON a.email = h.email
                JOIN Waterheater w
                ON w.email = a.email
                GROUP BY p.StateName order by StateName;''')
    query = cursor.fetchall()
    mysql.connection.commit()
    cursor.close()
    return query