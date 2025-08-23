

USE CS6400_PROJECT;


INSERT INTO Household VALUES ('patrick1@email.com', 100, 50, 70, 'htype1',20906);
INSERT INTO Household VALUES ('patrick2@email.com', 200, 51, 71, 'htype2',20906);
INSERT INTO Household VALUES ('patrick3@email.com', 300, 52, 72, 'htype3', 20906);
INSERT INTO Household VALUES ('patrick4@email.com', 400, 53, 73, 'htype4', 20906);
INSERT INTO Household VALUES ('patrick5@email.com', 500, 54, 74, 'htype5', 20906);
INSERT INTO Household VALUES ('patrick6@email.com', 600, 55, 75, 'htype6', 20906);
INSERT INTO Household VALUES ('patrick7@email.com', 700, 56, 76, 'htype7', 20906);
INSERT INTO Household VALUES ('patrick8@email.com', 800, 57, 77, 'htype8', 20906);
INSERT INTO Household VALUES ('patrick9@email.com', 900, 58, 78, 'htype9', 20906);
INSERT INTO Household VALUES ('patrick10@email.com', 1000, 59, 79,'htype10', 20906);

INSERT INTO Household_utilities VALUES ('Electric','patrick1@email.com');
INSERT INTO Household_utilities VALUES ('Gas','patrick2@email.com');
INSERT INTO Household_utilities VALUES ('Liquid fuel','patrick3@email.com');
INSERT INTO Household_utilities VALUES ('Steam','patrick4@email.com');
INSERT INTO Household_utilities VALUES ('Electric','patrick5@email.com');
INSERT INTO Household_utilities VALUES ('Gas','patrick6@email.com' );
INSERT INTO Household_utilities VALUES ('Liquid fuel','patrick7@email.com' );
INSERT INTO Household_utilities VALUES ('Steam','patrick8@email.com');
INSERT INTO Household_utilities VALUES ('Electric','patrick9@email.com');
INSERT INTO Household_utilities VALUES ('Gas','patrick10@email.com');
-- 4.Manufacturer

INSERT INTO Manufacturer VALUES ('manufacturer1',1);
INSERT INTO Manufacturer VALUES ('manufacturer2',2);
INSERT INTO Manufacturer VALUES ('manufacturer3',3);
INSERT INTO Manufacturer VALUES ('manufacturer4',4);
INSERT INTO Manufacturer VALUES ('manufacturer5',5);
INSERT INTO Manufacturer VALUES ('manufacturer6',6);
INSERT INTO Manufacturer VALUES ('manufacturer7',7);
INSERT INTO Manufacturer VALUES ('manufacturer8',8);
INSERT INTO Manufacturer VALUES ('manufacturer9',9);
INSERT INTO Manufacturer VALUES ('manufacturer10',10);



INSERT INTO Appliances  VALUES('patrick1@email.com', 	71,   1, 'Air Handler',  	1, 'model1');
INSERT INTO Appliances  VALUES('patrick2@email.com', 	72,   2, 'Water Heater',  	2, 'model2');
INSERT INTO Appliances  VALUES('patrick3@email.com', 	73,   3, 'Air Handler',  	3, 'model3');
INSERT INTO Appliances  VALUES('patrick4@email.com', 	74,   3, 'Water Heater',  	4, 'model4');
INSERT INTO Appliances  VALUES('patrick5@email.com', 	75,   4, 'Air Handler',  	5, 'model5');
INSERT INTO Appliances  VALUES('patrick6@email.com', 	76,   1, 'Water Heater',  	6, 'model6');
INSERT INTO Appliances  VALUES('patrick7@email.com', 	77,   6, 'Air Handler',  	7, 'model7');
INSERT INTO Appliances  VALUES('patrick8@email.com', 	78,   7, 'Water Heater',  	8, 'model8');
INSERT INTO Appliances  VALUES('patrick9@email.com', 	79,   8, 'Air Handler', 	9, 'model9');
INSERT INTO Appliances  VALUES('patrick10@email.com', 	80,   4, 'Water Heater', 	10, 'model10');


INSERT INTO EnergySource VALUES (1,      'Electric');
INSERT INTO EnergySource VALUES (2,      'Gas');
INSERT INTO EnergySource VALUES (3,      'Fuel Oil');
INSERT INTO EnergySource VALUES (4,      'Heat Pump');
INSERT INTO EnergySource VALUES (5,      'Electric');
INSERT INTO EnergySource VALUES (6,      'Gas');
INSERT INTO EnergySource VALUES (7,      'Fuel Oil');
INSERT INTO EnergySource VALUES (8,      'Heat Pump');
INSERT INTO EnergySource VALUES (9,      'Electric');
INSERT INTO EnergySource VALUES (10,    'Gas');


INSERT INTO WaterHeater VALUES (1, 500.8, 38, 'patrick1@email.com', 71);
INSERT INTO WaterHeater VALUES (2, 505.8, 48, 'patrick2@email.com', 72);
INSERT INTO WaterHeater VALUES (3, 509.8, 58, 'patrick3@email.com', 73);
INSERT INTO WaterHeater VALUES (4, 504.8, 68, 'patrick4@email.com', 74);
INSERT INTO WaterHeater VALUES (5, 502.8, 78, 'patrick5@email.com', 75);
INSERT INTO WaterHeater VALUES (6, 500.8, 88, 'patrick6@email.com', 76);
INSERT INTO WaterHeater VALUES (7, 501.8, 98, 'patrick7@email.com', 77);
INSERT INTO WaterHeater VALUES (8, 506.8, 28, 'patrick8@email.com', 78);
INSERT INTO WaterHeater VALUES (9, 503.8, 18, 'patrick9@email.com', 79);
INSERT INTO WaterHeater VALUES (10, 520.8, 38,'patrick10@email.com',80);


 
INSERT INTO HeatPump VALUES(1,	'patrick1@email.com',	71, 111.4, 100.1);
INSERT INTO HeatPump VALUES(2,	'patrick2@email.com',	72, 222.5, 200.1);
INSERT INTO HeatPump VALUES(3,	'patrick3@email.com',	73, 333.6, 300.1);
INSERT INTO HeatPump VALUES(4,	'patrick4@email.com',	74, 444.7, 400.1);
INSERT INTO HeatPump VALUES(5,	'patrick5@email.com',	75, 555.8, 500.1);
INSERT INTO HeatPump VALUES(6,	'patrick6@email.com',	76, 666.9, 600.2);
INSERT INTO HeatPump VALUES(7,	'patrick7@email.com',	77, 777.1, 700.3);
INSERT INTO HeatPump VALUES(8,	'patrick8@email.com',	78, 888.2, 800);
INSERT INTO HeatPump VALUES(9,	'patrick9@email.com',	79, 999.4, 900.9);
INSERT INTO HeatPump VALUES(10,	'patrick10@email.com',	80, 1000.4, 1000.1);



INSERT INTO Airhandler  VALUES( 'patrick1@email.com', 	71, 10);
INSERT INTO Airhandler  VALUES( 'patrick2@email.com',	72, 11);
INSERT INTO Airhandler  VALUES( 'patrick3@email.com',	73, 12);
INSERT INTO Airhandler  VALUES( 'patrick4@email.com',	74, 13);
INSERT INTO Airhandler  VALUES( 'patrick5@email.com',	75, 14);
INSERT INTO Airhandler  VALUES( 'patrick6@email.com',	76, 15);
INSERT INTO Airhandler  VALUES( 'patrick7@email.com',	77, 16);
INSERT INTO Airhandler  VALUES( 'patrick8@email.com',	78, 17);
INSERT INTO Airhandler  VALUES( 'patrick9@email.com',	79, 18);
INSERT INTO Airhandler  VALUES( 'patrick10@email.com',	80, 19);




INSERT INTO Heater  VALUES(  1, 'patrick1@email.com',	71);
INSERT INTO Heater  VALUES(  2, 'patrick2@email.com', 	72);
INSERT INTO Heater  VALUES(  3, 'patrick3@email.com',	73);
INSERT INTO Heater  VALUES(  4, 'patrick4@email.com',	74);
INSERT INTO Heater  VALUES(  5, 'patrick5@email.com',	75);
INSERT INTO Heater  VALUES(  6, 'patrick6@email.com',	76);
INSERT INTO Heater  VALUES(  7, 'patrick7@email.com',	77);
INSERT INTO Heater  VALUES(  8, 'patrick8@email.com',	78);
INSERT INTO Heater  VALUES(  9, 'patrick9@email.com',	79);
INSERT INTO Heater  VALUES(  10, 'patrick10@email.com',	80);

INSERT INTO AirConditioner VALUES(1,	'patrick1@email.com', 71, 111.4);
INSERT INTO AirConditioner VALUES(2,	'patrick2@email.com', 72, 222.5);
INSERT INTO AirConditioner VALUES(3,	'patrick3@email.com', 73, 333.6);
INSERT INTO AirConditioner VALUES(4,	'patrick4@email.com', 74, 444.7);
INSERT INTO AirConditioner VALUES(5,	'patrick5@email.com', 75, 555.8);
INSERT INTO AirConditioner VALUES(6,	'patrick6@email.com', 76, 666.9);
INSERT INTO AirConditioner VALUES(7,	'patrick7@email.com', 77, 777.1);
INSERT INTO AirConditioner VALUES(8,	'patrick8@email.com', 78, 888.2);
INSERT INTO AirConditioner VALUES(9,	'patrick9@email.com', 79, 999.4);
INSERT INTO AirConditioner VALUES(10,	'patrick10@email.com', 80, 1000.4);

SELECT h.household_type, COUNT(*) AS COUNT_AIRCONDITIONER, AVG(BTURating), ROUND(AVG(FanRotationsPerminute),2), ROUND(AVG(EER),2) FROM Household h JOIN Appliances a ON a.email = h.email JOIN AirConditioner c ON a.email = c.email JOIN AirHandler l ON a.email = l.email Group by h.Household_Type ORDER BY h.Household_Type;
SELECT  p.StateName, ROUND(AVG(Tanksize), 1),AVG(BTURating),AVG(Temperature)p
                FROM PostalCode p 
                JOIN Household h
                ON p.PostalCode = h.PostalCode
                JOIN Appliances a
                ON a.email = h.email
                JOIN Waterheater w
                ON w.email = a.email
                GROUP BY p.StateName;
                
                select * from Heatpump;
                
	SET @given_postal_code = 20906;
    
    SET @given_radius = 1; 
    SET @given_latitude = (SELECT latitude FROM PostalCode WHERE PostalCode = @given_postal_code);
    SET @given_longitude = (SELECT longitude FROM PostalCode WHERE PostalCode = @given_postal_code);

SELECT
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
  PostalCode <> @given_postal_code
  AND 3958.75 * 2 * ASIN(
    SQRT(
      POWER(SIN((RADIANS(@given_latitude) - RADIANS(latitude)) / 2), 2) +
      COS(RADIANS(@given_latitude)) * COS(RADIANS(latitude)) *
      POWER(SIN((RADIANS(@given_longitude) - RADIANS(longitude)) / 2), 2)
    )
  ) >= @given_radius;
  
  SELECT APPLIANCES.appliance_type, count(*) FROM APPLIANCES INNER JOIN manufacturer ON manufacturer.manufacturerid = APPLIANCES.manufacturerid WHERE manufacturer.manufacturername group by APPLIANCES.appliance_type= '55';
  
  select sum(case when appliance_type like '%Air Handler%' THEN 1 ELSE 0 END) AS AirHandler,
  sum(case when appliance_type like '%Water Heater%' THEN 1 ELSE 0 END) AS WaterHeater
  from Appliances where email like '%dntongwe%';
  
  select appliance_type, count(appliance_type) from appliances group by appliance_type;
  
SELECT all_types.appliance_type, COUNT(appliances.appliance_type) AS count
FROM (
  SELECT DISTINCT appliance_type
  FROM appliances
) AS all_types
CROSS JOIN manufacturer
LEFT JOIN appliances ON all_types.appliance_type = appliances.appliance_type
  AND manufacturer.manufacturerid = appliances.manufacturerid WHERE manufacturername = "manu2"
GROUP BY all_types.appliance_type, manufacturer.manufacturername;
  
  
 select * from postalcode;
 set @given_radius = 20;
  set @given_longitude = 29;
  set @given_latitude = 299;
  set @postal_code = 20906;
  
  SELECT
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
  ) >= @given_radius;
  
  
  -- Second part: Drilldown report for a specific state (e.g., CA)
SELECT 
    es.sourcename,
    ROUND(MIN(w.tanksize)) AS min_tank_size,
    ROUND(AVG(w.tanksize)) AS avg_tank_size,
    ROUND(MAX(w.tanksize)) AS max_tank_size,
    MIN(w.temperature) AS min_temperature_setting,
    ROUND(AVG(w.temperature), 1) AS avg_temperature_setting,
    MAX(w.temperature) AS max_temperature_setting
FROM energysource es
JOIN waterheater w ON  w.SourceID = es.SourceID
JOIN appliances a ON a.HouseholdApplianceNum = w.HouseholdApplianceNum and a.email = w.email
JOIN household h ON a.email = h.email
JOIN postalcode p ON h.postalcode = p.postalcode
WHERE p.statename = 'ON' 
GROUP BY es.sourcename
ORDER BY es.sourcename ASC;

select * from waterheater;
select * from energysource;