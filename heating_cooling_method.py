def get_heating_cooling_method_data(mysql):
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT h.household_type, COUNT(*) AS COUNT_AIRCONDITIONER, AVG(BTURating), ROUND(AVG(FanRotationsPerminute),2), ROUND(AVG(EER),2) FROM Household h JOIN Appliances a ON a.email = h.email JOIN AirConditioner c ON a.email = c.email JOIN AirHandler l ON a.email = l.email Group by h.Household_Type ORDER BY h.Household_Type;")
    query1 = cursor.fetchall()

    cursor.execute("SELECT h.household_type, COUNT(*) AS Count_Heater,AVG(BTURating), ROUND(AVG(FanRotationsPerminute),2), SourceName FROM Household h JOIN Appliances a ON h.email = a.email JOIN Heater t ON a.email = t.email JOIN AirHandler l ON a.email = l.email JOIN EnergySource e ON e.SourceID = t.SourceID Group by h.Household_Type ORDER BY h.Household_Type;")
    query2 = cursor.fetchall()

    cursor.execute("SELECT h.household_type, COUNT(*) AS COUNT_Heat_pump, AVG(BTURating), ROUND(AVG(FanRotationsPerminute),2), ROUND(AVG(SEER),2), ROUND(AVG(HSPF),2) FROM Household h JOIN Appliances a ON h.email = a.email JOIN HeatPump p ON a.email = p.email JOIN AirHandler l ON a.email = l.email GROup by h.Household_Type ORDER BY h.Household_Type;")

    query3 = cursor.fetchall()
    cursor.close()

    return [query1, query2, query3]