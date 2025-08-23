
def get_off_grid_data(mysql):
    cursor = mysql.connection.cursor()

    cursor.execute("SELECT p.StateName, COUNT(*) FROM Household AS h, PostalCode AS p WHERE h.Heating_Temperature IS NULL AND h.Cooling_Temperature IS NULL GROUP BY p.StateName;")
    query = cursor.fetchall()

    cursor.execute("SELECT Round(AVG(BatteryStorage_kWh), 0) FROM PowerGenerator p JOIN Household h ON h.email = p.email WHERE h.Heating_Temperature IS NULL AND h.Cooling_Temperature IS NULL;")
    query1 = cursor.fetchall()

    cursor.execute("SELECT p.StateName, COUNT(*) FROM Household AS h, PostalCode AS p WHERE h.Heating_Temperature IS  NULL AND h.Cooling_Temperature IS NULL GROUP BY p.StateName;")
    query2 = cursor.fetchall()

    cursor.execute("SELECT GenerationType, (Count(GenerationType) / SUM(GenerationType))*100 AS Generator_percentage FROM Household h, PowerGenerator p WHERE h.cooling_Temperature IS NULL AND h.heating_Temperature IS NULL GROUP BY GenerationType;")
    query3 = cursor.fetchall()

    cursor.execute("SELECT h.Household_Type, ROUND(AVG(Temperature),1) FROM WaterHeater JOIN Household h WHERE h.cooling_Temperature IS NOT NULL AND h.heating_Temperature IS NOT NULL GROUP BY h.Household_Type;")
    query4 = cursor.fetchall()

    cursor.execute("SELECT h.Household_Type, ROUND(AVG(TankSize),1) FROM WaterHeater JOIN Household h WHERE h.cooling_Temperature IS NULL OR h.heating_Temperature IS NULL GROUP BY h.Household_Type;")
    query5 = cursor.fetchall()

    cursor.execute("SELECT h.Household_Type, ROUND(AVG(TankSize),1) FROM WaterHeater JOIN Household h WHERE (h.cooling_Temperature IS NOT NULL) OR (h.heating_Temperature IS NOT NULL) GROUP BY h.Household_Type;")
    query6 = cursor.fetchall()

    cursor.execute("SELECT a.Appliance_Type, ROUND(MIN(BTUrating), 0), ROUND(AVG(BTUrating),0), ROUND(MAX(BTUrating),0) FROM Appliances a JOIN Household h WHERE h.Cooling_Temperature IS NULL AND h.Heating_Temperature IS NULL GROUP BY a.Appliance_Type;")
    query7 = cursor.fetchall()
    mysql.connection.commit()
    cursor.close()
    return [query, query1, query2, query3, query4, query5, query6, query7]
