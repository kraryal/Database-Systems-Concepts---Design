query1 = '''
                SELECT p.StateName, COUNT(*)
                FROM Household AS h, PostalCode AS p
                WHERE h.Heating_Temperature IS NULL AND h.Cooling_Temperature IS
                NULL
                GROUP BY p.StateName;
            '''

query2 = '''
                SELECT  c.StateName, ROUND(AVG(BatteryStorage_kWh), 0)
                FROM PowerGenerator p
                JOIN Household h
                ON h.email = p.email
                JOIN PostalCode c
                ON h.PostalCode = c.postalcode
                GROUP BY c.StateName;
            '''

query3 = '''
                SELECT p.StateName, COUNT(*)
                FROM Household AS h, PostalCode AS p
                WHERE h.Heating_Temperature IS  NULL AND h.Cooling_Temperature IS
                 NULL
                GROUP BY p.StateName;
            '''

query4 = '''
                SELECT GenerationType, (Count(GenerationType) / SUM(GenerationType))*100
                AS Generator_percentage
                FROM Household h, PowerGenerator p
                WHERE h.cooling_Temperature IS NULL AND h.heating_Temperature IS NULL
                GROUP BY GenerationType;
            '''

query5 = '''
                SELECT h.Household_Type, ROUND(AVG(Temperature),1)
                FROM WaterHeater JOIN Household h
                WHERE h.cooling_Temperature IS NOT NULL AND h.heating_Temperature IS
                NOT NULL
                GROUP BY h.Household_Type;
            '''

query6 = '''
                SELECT h.Household_Type, ROUND(AVG(TankSize),1)
                FROM WaterHeater JOIN Household h
                WHERE h.cooling_Temperature IS NULL OR h.heating_Temperature IS NULL
                GROUP BY h.Household_Type;
            '''

query7 = '''
                    SELECT h.Household_Type, ROUND(AVG(TankSize),1)
                    FROM WaterHeater JOIN Household h
                    WHERE (h.cooling_Temperature IS NOT NULL) OR (h.heating_Temperature IS NOT NULL)
                    GROUP BY h.Household_Type;
                '''

query8 = '''
                SELECT a.Appliance_Type, ROUND(MIN(BTUrating), 0), ROUND(AVG(BTUrating),0), ROUND(MAX(BTUrating),0)
                FROM Appliances a JOIN Household h
                WHERE h.Cooling_Temperature IS NULL AND h.Heating_Temperature IS NULL
                GROUP BY a.Appliance_Type;
            '''