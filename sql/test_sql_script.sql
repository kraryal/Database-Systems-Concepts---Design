show databases;

use cs6400_project;

show tables;

desc household;
desc postalcode;

select * from household_utilities;

INSERT INTO POSTALCODE VALUES("20906", "Silver Spring", 29, 29, "ON");
Insert into energysource values(1, "Electric");
Insert into energysource values(2, "Gas");
Insert into energysource values(3, "Fuel Oil");
Insert into energysource values(4, "Heat Pump");
Insert into energysource values(5, "Air Conditioner");
Insert into energysource values(6, "Heater");

select * from postalcode;
-- INSERT INTO MANUFACTURER VALUES("SIEMENS", 1);-- 
-- DELETE FROM  manufacturer where Manufacturerid = 1;
-- SELECT MAX(MANUFACTURERID) FROM MANUFACTURER;

select count(*) from household where Heating_temperature is NULL AND Cooling_temperature is NULL AND Email="dntongwe3ww@gatech.edu";

desc household_utilities;

select email from household_utilities;

select * from appliances;
select * from household;

select * from manufacturer;

SELECT * FROM HOUSEHOLD;

-- SELECT APPLIANCES.householdApplianceNum, APPLIANCES.appliance_type, manufacturer.manufacturername, APPLIANCES.model
-- FROM APPLIANCES INNER JOIN manufacturer ON manufacturer.manufacturerid = APPLIANCES.manufacturerid WHERE APPLIANCES.email = "m@tsr.com";
SELECT email, count(*) FROM APPLIANCES group by email;

select * from appliances;
select * from powergenerator;
select COUNT(*) from powergenerator where email="mesages@yahoo.com";

SELECT * FROM HOUSEHOLD WHERE EMAIL LIKE "%pATRIC%";

SELECT p.StateName, COUNT(*) FROM Household AS h, PostalCode AS p WHERE h.Heating_Temperature IS NULL AND h.Cooling_Temperature IS NULL GROUP BY p.StateName;
SELECT c.StateName, ROUND(AVG(BatteryStorage_kWh), 0) FROM PowerGenerator p JOIN Household h ON h.email = p.email JOIN PostalCode c ON h.PostalCode = c.postalcode GROUP BY c.StateName;
SELECT p.StateName, COUNT(*) FROM Household AS h, PostalCode AS p WHERE h.Heating_Temperature IS  NULL AND h.Cooling_Temperature IS NULL GROUP BY p.StateName;
SELECT GenerationType, (Count(GenerationType) / SUM(GenerationType))*100 AS Generator_percentage FROM Household h, PowerGenerator p WHERE h.cooling_Temperature IS NULL AND h.heating_Temperature IS NULL GROUP BY GenerationType;
			SELECT h.Household_Type, ROUND(AVG(Temperature),1)
                FROM WaterHeater JOIN Household h
                WHERE h.cooling_Temperature IS NOT NULL AND h.heating_Temperature IS
                NOT NULL
                GROUP BY h.Household_Type;

SELECT h.Household_Type, ROUND(AVG(TankSize),1)
                FROM WaterHeater JOIN Household h
                WHERE h.cooling_Temperature IS NULL OR h.heating_Temperature IS NULL
                GROUP BY h.Household_Type;
                
                SELECT a.Appliance_Type, ROUND(MIN(BTUrating), 0), ROUND(AVG(BTUrating),0), ROUND(MAX(BTUrating),0)
                FROM Appliances a JOIN Household h
                WHERE h.Cooling_Temperature IS NULL AND h.Heating_Temperature IS NULL
                GROUP BY a.Appliance_Type;
                
                select count(*) from household h WHERE h.Cooling_Temperature IS NULL AND h.Heating_Temperature IS NULL;
                
                SELECT COUNT(*) AS COUNT_AIRCONDITIONER, AVG(BTURating), ROUND(AVG(FanRotationsPerminute),2), ROUND(AVG(EER),2) FROM Household h JOIN Appliances a ON a.email = h.email JOIN AirConditioner c ON a.email = c.email JOIN AirHandler l ON a.email = l.email GROUP BY BTURating, FanRotationsPerminute, EER;