DROP DATABASE  IF EXISTS CS6400_PROJECT;
CREATE DATABASE CS6400_PROJECT;
USE CS6400_PROJECT;
-- 1.Postal code
CREATE TABLE PostalCode
(PostalCode				CHAR(5),
PRIMARY KEY(PostalCode),			    
City			    	VARCHAR(50)     	NOT NULL,
StateName		  		VARCHAR(50)     	NOT NULL,
Latitude		  		DECIMAL	(11,8)		    NOT NULL,
Longitude		  		DECIMAL	(11,8)	    	NOT NULL);



-- 2.Household
CREATE TABLE Household 
(Email			            VARCHAR(50)	,
Square_footage			    INT			      NOT NULL,
Cooling_temperature		  	INT			      NULL,
Heating_temperature		  	INT			      NULL,
Household_Type			    VARCHAR(50)		  NOT NULL,
PostalCode CHAR(5),
PRIMARY KEY(Email),
FOREIGN KEY (PostalCode) REFERENCES PostalCode(PostalCode));


-- 3. Household_utilities
CREATE TABLE Household_utilities
(UtilityName 				varchar(50) 			NOT NULL,
Email			            VARCHAR(50)	,
FOREIGN KEY (Email)  REFERENCES Household(Email),
PRIMARY KEY(Email, UtilityName));



-- 4.Manufacturer
CREATE TABLE Manufacturer
(ManufacturerName			VARCHAR(50)		NOT NULL,
ManufacturerID              INT auto_increment,
 PRIMARY KEY (ManufacturerID) );

-- 5. Appliances
CREATE TABLE Appliances
(Email			            	VARCHAR(50)	,
 HouseholdApplianceNum			INT,
 PRIMARY KEY (Email, HouseholdApplianceNum),
 BTUrating					    INT				    NOT NULL,
 Appliance_Type				  	VARCHAR(50)			NOT NULL,
 ManufacturerID				  	INT,
 FOREIGN KEY(ManufacturerID)   REFERENCES Manufacturer(ManufacturerID),
 Model						      VARCHAR(50)		NULL);

-- 6.EnergySource
CREATE TABLE EnergySource
(SourceID				  		INT,
PRIMARY KEY(SourceID),
SourceName						VARCHAR(50) 		NOT NULL);


-- 7. WaterHeater
CREATE TABLE WaterHeater
(SourceID					INT,
 FOREIGN KEY(SourceID) REFERENCES EnergySource(SourceID),
 TankSize					DECIMAL			    NOT NULL,
 Temperature				INT				    NOT NULL,
 Email			            VARCHAR(50)	,
 HouseholdApplianceNum		INT,
 PRIMARY KEY (Email, HouseholdApplianceNum));

-- 8. HeatPump
CREATE TABLE  HeatPump
(SourceID							INT,
 FOREIGN KEY(SourceID) REFERENCES EnergySource(SourceID),
 Email			            		VARCHAR(50)	,
 HouseholdApplianceNum				INT,
 PRIMARY KEY (Email, HouseholdApplianceNum),
 SEER					         	DECIMAL				NOT NULL,
 HSPF					          	DECIMAL				NOT NULL);

-- 9. AirHandler
CREATE TABLE  AirHandler
(Email			            		VARCHAR(50)	,
 HouseholdApplianceNum				INT,
 PRIMARY KEY (Email, HouseholdApplianceNum),
 FanRotationsPerminute				INT			    	NOT NULL);


-- 10.Heater
CREATE TABLE Heater
(SourceID							INT,
 FOREIGN KEY(SourceID) REFERENCES EnergySource(SourceID),
  Email			            		VARCHAR(50)	,
 HouseholdApplianceNum				INT,
 PRIMARY KEY (Email, HouseholdApplianceNum));


-- 11.AirConditioner
CREATE TABLE AirConditioner
(SourceID							INT,
 FOREIGN KEY(SourceID) REFERENCES EnergySource(SourceID),
  Email			            		VARCHAR(50)	,
 HouseholdApplianceNum				INT,
 PRIMARY KEY (Email, HouseholdApplianceNum),
 EER						        DECIMAL		    NOT NULL);

-- 12. PowerGenerator

CREATE TABLE PowerGenerator
(Email				        		VARCHAR(50),
 GeneratorID		      			INT,
 PRIMARY KEY (Email, GeneratorID),
 GenerationType		    			VARCHAR(50)		NOT NULL,
 AvgMonthly_kWh		    			INT				NOT NULL,
 BatteryStorage_kWh	  				INT				NOT NULL);

