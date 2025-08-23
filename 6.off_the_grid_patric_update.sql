-- 1
SELECT p.StateName, COUNT(*) 
FROM Household AS h, PostalCode AS p 
WHERE h.Heating_Temperature IS NULL AND h.Cooling_Temperature IS NULL 
GROUP BY p.StateName;

-- 2 
SELECT Round(AVG(BatteryStorage_kWh), 0) 
FROM PowerGenerator p 
JOIN Household h 
ON h.email = p.email 
WHERE h.Heating_Temperature IS NULL AND h.Cooling_Temperature IS NULL;

-- 3
SELECT GenerationType, (Count(GenerationType) / SUM(GenerationType))*100 AS Generator_percentage 
FROM Household h, PowerGenerator p 
WHERE h.cooling_Temperature IS NULL AND h.heating_Temperature IS NULL 
GROUP BY GenerationType;

-- 4
SELECT Household_Type, 
(COUNT(CASE WHEN (Cooling_Temperature IS NULL AND Heating_Temperature IS NULL) THEN 1 END) / COUNT(*) * 100) AS Off_grid_percentage FROM Household
GROUP BY Household_Type;

-- 5
SELECT h.Household_Type, ROUND(AVG(TankSize),1) 
FROM WaterHeater JOIN Household h 
WHERE (h.cooling_Temperature IS NOT NULL) OR (h.heating_Temperature IS NOT NULL) 
GROUP BY h.Household_Type;

-- 6
SELECT a.Appliance_Type, 
COALESCE(ROUND(MIN(BTUrating), 0), 0), 
COALESCE(ROUND(AVG(BTUrating),0), 0), 
COALESCE(ROUND(MAX(BTUrating),0), 0) 
FROM Appliances a 
JOIN Household h 
WHERE h.Cooling_Temperature IS NULL AND h.Heating_Temperature IS NULL 
GROUP BY a.Appliance_Type;