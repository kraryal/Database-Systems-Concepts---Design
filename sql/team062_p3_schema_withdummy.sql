USE CS6400_PROJECT;

Insert into energysource values(1, "Electric");
Insert into energysource values(2, "Gas");
Insert into energysource values(3, "Fuel Oil");
Insert into energysource values(4, "Heat Pump");
Insert into energysource values(5, "Air Conditioner");
Insert into energysource values(6, "Heater");

INSERT INTO Household VALUES ('dntongwe3@email.com', 100, 50, 70, 'townhouse',77381);
INSERT INTO Household VALUES ('dntongwe31@email.com', 200, 51, 71, 'Condominium',77382);
INSERT INTO Household VALUES ('dntongwe32@email.com', 300, 52, 72, 'Apartment', 77383);
INSERT INTO Household VALUES ('patrick4@email.com', 400, 53, 73, 'Tiny House', 77384);
INSERT INTO Household VALUES ('patrick5@email.com', 500, 54, 74, 'Condominium', 77385);
INSERT INTO Household VALUES ('dntongwe33@email.com', 600, 55, 75, 'Apartment', 77386);
INSERT INTO Household VALUES ('dntongwe34@email.com', 700, 56, 76, 'townhouse', 77387);
INSERT INTO Household VALUES ('dntongwe35@email.com', 800, 57, 77, 'Apartment', 77388);
INSERT INTO Household VALUES ('patrick9dntongwe3email.com', 900, 58, 78, 'Condominium', 77389);
INSERT INTO Household VALUES ('dntongwe355@email.com', 1000, 59, 79,'townhouse', 77371);

-- 3. Household_utilities
-- drop table household_utilities;


-- drop table Manufacturer;
-- drop table Appliances;


INSERT INTO Manufacturer (ManufacturerName) VALUES ('manufacturer1');
INSERT INTO Manufacturer (ManufacturerName) VALUES ('manufacturer2');
INSERT INTO Manufacturer (ManufacturerName) VALUES ('manufacturer3');
INSERT INTO Manufacturer (ManufacturerName) VALUES ('manufacturer4');
INSERT INTO Manufacturer (ManufacturerName) VALUES ('manufacturer5');
INSERT INTO Manufacturer (ManufacturerName) VALUES ('manufacturer5');
INSERT INTO Manufacturer (ManufacturerName) VALUES ('manufacturer6');
INSERT INTO Manufacturer (ManufacturerName) VALUES ('manufacturer 7');
INSERT INTO Manufacturer (ManufacturerName) VALUES ('manufacturer 8');


--
--  -- checking code for airconditioner. As airconditioner is airhandler it has rpm as well
--  SELECT AVG(BTURating), ROUND(AVG(FanRotationsPerminute),2), ROUND(AVG(EER),2)
--                         FROM Household h
--                         JOIN Appliances a
--                         ON a.email = h.email
--                         JOIN AirConditioner c
--                         ON a.email = c.email
--                         JOIN AirHandler l
--                         ON a.email = l.email
--                         GROUP BY BTURating, FanRotationsPerminute, EER;
--
-- -- for heat pump
-- SELECT AVG(BTURating), ROUND(AVG(FanRotationsPerminute),2), ROUND(AVG(SEER),2), ROUND(AVG(HSPF),2)
--                 FROM Household h
--                 JOIN Appliances a
--                 ON h.email = a.email
--                 JOIN HeatPump p
--                 ON a.email = p.email
--                 JOIN AirHandler l
-- 				ON a.email = l.email
--                 GROUP BY BTURating, FanRotationsPerminute, SEER, HSPF;
--
-- 	-- FOR HEATER
--     SELECT AVG(BTURating), ROUND(AVG(FanRotationsPerminute),2), SourceName
--                 FROM Household h
--                 JOIN Appliances a
--                 ON h.email = a.email
--                 JOIN Heater t
--                 ON a.email = t.email
--                 JOIN AirHandler l
-- 				ON a.email = l.email
--                 JOIN EnergySource e
--                 ON e.SourceID = t.SourceID
--                 GROUP BY BTURating, FanRotationsPerminute, SourceName;
-- -- water heater
-- SELECT ROUND(AVG(TankSize),1), ROUND(AVG(BTUrating),0), SourceName
--                 FROM WaterHeater w
--                 JOIN EnergySource e
--                 ON w.SourceID = e.SourceID
--                 JOIN appliances a
--                 ON a.email = w.email
--                 GROUP BY SourceName;
--
--
-- -- off -the grid household
-- SELECT p.StateName, COUNT(*)
--                 FROM Household AS h, PostalCode AS p
--                 WHERE h.Heating_Temperature IS NULL AND h.Cooling_Temperature IS
--                 NULL
--                 GROUP BY p.StateName;
--
-- -- average battery
-- SELECT  c.StateName, ROUND(AVG(BatteryStorage_kWh), 0)
--                 FROM PowerGenerator p
--                 JOIN Household h
--                 ON h.email = p.email
--                 JOIN PostalCode c
--                 ON h.PostalCode = c.postalcode
--                 GROUP BY c.StateName;
--
-- -- oN -the grid household
-- SELECT p.StateName, COUNT(*)
--                 FROM Household AS h, PostalCode AS p
--                 WHERE h.Heating_Temperature IS NOT NULL AND h.Cooling_Temperature IS
--                 NOT NULL
--                 GROUP BY p.StateName;
--
-- -- OFF THE GRID POWER GENERATION
-- SELECT GenerationType, (Count(GenerationType) / SUM(GenerationType))*100
--                 AS Generator_percentage
--                 FROM Household h, PowerGenerator p
--                 WHERE h.cooling_Temperature IS NULL AND h.heating_Temperature IS NULL
--                 GROUP BY GenerationType;
--
-- -- OFF THE GRID HOUSEHOLD TYPES
-- SELECT h.Household_Type, ROUND(AVG(Temperature),1)
--                 FROM WaterHeater JOIN Household h
--                 WHERE h.cooling_Temperature IS NOT NULL AND h.heating_Temperature IS
--                 NOT NULL
--                 GROUP BY h.Household_Type;
--
-- -- TANK SIZE DATA off the grid
-- SELECT h.Household_Type, ROUND(AVG(TankSize),1)
--                 FROM WaterHeater JOIN Household h
--                 WHERE h.cooling_Temperature IS NULL OR h.heating_Temperature IS NULL
--                 GROUP BY h.Household_Type;
--
-- 	-- TANK SIZE DATA 2 on the grid
-- SELECT h.Household_Type, ROUND(AVG(TankSize),1)
--                     FROM WaterHeater JOIN Household h
--                     WHERE (h.cooling_Temperature IS NOT NULL) OR (h.heating_Temperature IS NOT NULL)
--                     GROUP BY h.Household_Type;
--
-- 	-- APPLIANCE BTU DATA
--     SELECT a.Appliance_Type, ROUND(MIN(BTUrating), 0), ROUND(AVG(BTUrating),0), ROUND(MAX(BTUrating),0)
--                 FROM Appliances a JOIN Household h
--                 WHERE h.Cooling_Temperature IS NULL AND h.Heating_Temperature IS NULL
--                 GROUP BY a.Appliance_Type;
 -- drop table Appliances;
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
-- select * from Appliances;




-- -- 6.EnergySource
-- CREATE TABLE EnergySource
-- (SourceID				  		INT,
-- PRIMARY KEY(SourceID),
-- SourceName						VARCHAR(50) 		NOT NULL);

-- INSERT INTO EnergySource VALUES (1,      'Electric');
-- INSERT INTO EnergySource VALUES (2,      'Gas');
-- INSERT INTO EnergySource VALUES (3,      'Fuel Oil');
-- INSERT INTO EnergySource VALUES (4,      'Heat Pump');
-- INSERT INTO EnergySource VALUES (5,      'Electric');
-- INSERT INTO EnergySource VALUES (6,      'Gas');
-- INSERT INTO EnergySource VALUES (7,      'Fuel Oil');
-- INSERT INTO EnergySource VALUES (8,      'Heat Pump');
-- INSERT INTO EnergySource VALUES (9,      'Electric');
-- INSERT INTO EnergySource VALUES (10,    'Gas');

-- select * from EnergySource;
-- -- 7. WaterHeater
-- CREATE TABLE WaterHeater
-- (SourceID					INT,
--  FOREIGN KEY(SourceID) REFERENCES EnergySource(SourceID),
--  TankSize					DECIMAL(5,1)			    NOT NULL,
--  Temperature				INT				    		NOT NULL,
--  Email			            VARCHAR(50)	,
--  HouseholdApplianceNum		INT,
--  PRIMARY KEY (Email, HouseholdApplianceNum));

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
select * from WaterHeater;

-- 8. HeatPump
-- -- drop table HeatPump;
-- CREATE TABLE  HeatPump
-- (SourceID							INT,
--  FOREIGN KEY(SourceID) REFERENCES EnergySource(SourceID),
--  Email			            		VARCHAR(50)	,
--  HouseholdApplianceNum				INT,
--  PRIMARY KEY (Email, HouseholdApplianceNum),
--  SEER					         	DECIMAL(5,1)				NOT NULL,
--  HSPF					          	DECIMAL(5,1)				NOT NULL);
 
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
-- select * from Heatpump;

-- 9. AirHandler
-- CREATE TABLE  AirHandler
-- (Email			            		VARCHAR(50)	,
--  HouseholdApplianceNum				INT,
--  PRIMARY KEY (Email, HouseholdApplianceNum),
--  FanRotationsPerminute				INT			    	NOT NULL);

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
-- select * from AirHandler;

-- -- 10.Heater
-- CREATE TABLE Heater
-- (SourceID							INT,
--  FOREIGN KEY(SourceID) REFERENCES EnergySource(SourceID),
--   Email			            		VARCHAR(50)	,
--  HouseholdApplianceNum				INT,
--  PRIMARY KEY (Email, HouseholdApplianceNum));

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

-- select * from Heater;

-- 11.AirConditioner
-- drop table AirConditioner;
-- CREATE TABLE AirConditioner
-- (SourceID							INT,
--  FOREIGN KEY(SourceID) REFERENCES EnergySource(SourceID),
--   Email			            		VARCHAR(50)	,
--  HouseholdApplianceNum				INT,
--  PRIMARY KEY (Email, HouseholdApplianceNum),
--  EER						        DECIMAL(5,1)		    NOT NULL);
--
--
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

-- select * from AirConditioner;

-- -- 12. PowerGenerator
-- CREATE TABLE PowerGenerator
-- (Email				        		VARCHAR(50),
--  GeneratorID		      			INT,
--  PRIMARY KEY (Email, GeneratorID),
--  GenerationType		    			VARCHAR(50)		NOT NULL,
--  AvgMonthly_kWh		    			INT				NOT NULL,
--  BatteryStorage_kWh	  				INT				NOT NULL);
--
--  select * from PowerGenerator;
--  -- 13.AverageRadius
--  -- drop table AverageRadius;
-- CREATE TABLE AverageRadius
-- (
-- PostalCode CHAR(5),
-- FOREIGN KEY (PostalCode) REFERENCES PostalCode(PostalCode),
-- Radius		  				INT			      NOT NULL);

--  select * from AverageRadius;

select * from household where email like "%pATRIC%"; 