query1 = """ SELECT AVG(BTURating), ROUND(AVG(FanRotationsPerminute),2), ROUND(AVG(EER),2)
                        FROM Household h
                        JOIN Appliances a
                        ON a.email = h.email
                        JOIN AirConditioner c
                        ON a.email = c.email
                        JOIN AirHandler l
                        ON a.email = l.email
                        GROUP BY BTURating, FanRotationsPerminute, EER ;
                        """

query2 = '''
                SELECT AVG(BTURating), ROUND(AVG(FanRotationsPerminute),2), SourceName
                FROM Household h
                JOIN Appliances a
                ON h.email = a.email
                JOIN Heater t
                ON a.email = t.email
                JOIN AirHandler l
				ON a.email = l.email
                JOIN EnergySource e
                ON e.SourceID = t.SourceID
                GROUP BY BTURating, FanRotationsPerminute, SourceName;
            '''

query3 = '''
                SELECT AVG(BTURating), ROUND(AVG(FanRotationsPerminute),2), ROUND(AVG(SEER),2), ROUND(AVG(HSPF),2)
                FROM Household h
                JOIN Appliances a
                ON h.email = a.email
                JOIN HeatPump p
                ON a.email = p.email
                JOIN AirHandler l
				ON a.email = l.email
                GROUP BY BTURating, FanRotationsPerminute, SEER, HSPF;
            '''

query4 = '''
                SELECT ROUND(AVG(TankSize),1), ROUND(AVG(BTUrating),0), SourceName
                FROM WaterHeater w
                JOIN EnergySource e
                ON w.SourceID = e.SourceID
                JOIN appliances a
                ON a.email = w.email
                GROUP BY SourceName;
            '''