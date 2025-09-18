# Database Systems Concepts & Design

<div align="center">

![Database](https://img.shields.io/badge/Database-Systems-blue?style=for-the-badge)
![SQL](https://img.shields.io/badge/SQL-Query-orange?style=for-the-badge)
![Python](https://img.shields.io/badge/Python-3.7+-green?style=for-the-badge)
![Flask](https://img.shields.io/badge/Flask-Web%20App-red?style=for-the-badge)

</div>

---

## 📊 Overview

A **comprehensive repository** covering fundamental concepts, design principles, and practical implementations in database systems. This project serves as both a learning resource and reference guide for **Database Management Systems (DBMS)**.

> 🎯 **Purpose**: Bridge the gap between theoretical database concepts and real-world implementations

---

## ✨ Key Features

### 🧠 **Conceptual Learning**
- Clear explanations of database fundamentals
- Step-by-step tutorials and guides
- Interactive examples

### 🏗️ **Design Patterns** 
- Best practices for schema design
- Industry-standard approaches
- Scalable architectures

### 💻 **Practical Implementation**
- Comprehensive SQL queries
- Real-world project examples
- Performance optimization techniques

### 📈 **Advanced Topics**
- Transaction management
- Concurrency control
- Distributed systems

---

## 📚 Curriculum Coverage

**🔧 Core Concepts**
- **Database Models**: Relational, NoSQL, NewSQL
- **Entity-Relationship (ER) Modeling**: Conceptual design
- **Relational Algebra & Calculus**: Mathematical foundations
- **SQL & Query Processing**: Data manipulation and retrieval

**🏛️ Design Principles**
- **Database Normalization**: 1NF → 2NF → 3NF → BCNF
- **Schema Design**: Logical and physical design
- **Indexing Strategies**: Performance optimization
- **Data Integrity**: Constraints and validation

**🚀 Advanced Topics**
- **Transaction Management**: ACID properties
- **Concurrency Control**: Multi-user environments
- **Database Security**: Access control and encryption
- **Backup & Recovery**: Data protection strategies
- **Distributed Databases**: Scalability solutions

---

## 🗂️ Project Architecture

```
Database-Systems-Concepts---Design/
│
├── concepts/
│   ├── er-modeling/           # Entity-Relationship diagrams
│   ├── normalization/         # Database normalization examples
│   ├── sql-basics/            # Fundamental SQL operations
│   └── advanced-topics/       # Advanced database concepts
│
├── examples/
│   ├── schema-designs/        # Sample database schemas
│   ├── sample-databases/      # Ready-to-use databases
│   └── query-examples/        # SQL query collections
│
├── projects/
│   ├── library-management/    # Complete library system
│   ├── inventory-system/      # Warehouse management
│   └── student-portal/        # Academic management system
│
├── resources/
│   ├── cheat-sheets/          # Quick reference guides
│   ├── reference-materials/   # Additional learning resources
│   └── practice-exercises/    # Hands-on practice problems
│
└── README.md
```

---

## ⚡ Quick Start

### 🔧 Prerequisites

**Essential Requirements:**
- Python 3.7+
- Basic programming knowledge
- Text editor/IDE

**Recommended:**
- MySQL 8.0+ / PostgreSQL 12+
- Flask framework
- Git version control

### 🚀 Installation

#### **Method 1: Standard Setup**

```bash
# Clone the repository
git clone https://github.com/kraryal/Database-Systems-Concepts---Design.git

# Navigate to project directory
cd Database-Systems-Concepts---Design

# Set up database (choose one)
mysql -u root -p              # MySQL
psql -U postgres              # PostgreSQL  
sqlite3 example.db            # SQLite
```

#### **Method 2: Flask Application (Ubuntu)**

```bash
# 1. Create project environment
mkdir project && cd project

# 2. Install dependencies
pip install -r requirements.txt

# 3. Launch application
flask run

# 4. Access web interface at http://localhost:5000
```

---

## 💡 Usage Examples

### 🔍 **Basic SQL Operations**

```sql
-- Student Performance Analysis
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
```

### 🏗️ **Average Radius**

```sql
USE CS6400_PROJECT;
SET @given_postal_code = '44240';-- (SELECT PostalCode FROM AverageRadius WHERE PostalCode = ( SELECT MAX(PostalCode) FROM PostalCode));
SET @given_radius = 100; -- (SELECT Radius FROM AverageRadius); -- Search radius in miles
SET @given_latitude = (SELECT latitude FROM PostalCode WHERE PostalCode = @given_postal_code);
SET @given_longitude = (SELECT longitude FROM PostalCode WHERE PostalCode = @given_postal_code);

SELECT
  p.Postalcode,
  Round(3958.75 * 2 * ATAN2(SQRT(SIN((latitude-@given_latitude) * PI()/180/2) * SIN((latitude-@given_latitude) * PI()/180/2) +
         COS(@given_latitude * PI()/180) * COS(latitude * PI()/180) *
         SIN((longitude-@given_longitude) * PI()/180/2) * SIN((longitude-@given_longitude) * PI()/180/2)), SQRT(1-SIN((latitude-@given_latitude) * PI()/180/2) * SIN((latitude-@given_latitude) * PI()/180/2) +
         COS(@given_latitude * PI()/180) * COS(latitude * PI()/180) *
         SIN((longitude-@given_longitude) * PI()/180/2) * SIN((longitude-@given_longitude) * PI()/180/2))),1) AS distance,
h.Household_Type, COALESCE(Count(*),0) as cnt_household, Round(Avg(h.Heating_temperature),1),Round(Avg(h.Cooling_temperature),1), group_concat(utilityname, ', ') AS utilities
FROM
  PostalCode p
Join Household h
ON h.PostalCode = p.PostalCode
Join Household_utilities u
ON h.email =u.email
Join Powergenerator g
ON g.email = h.email
WHERE
  p.PostalCode <> @given_postal_code
  AND (3958.75 * 2 * ATAN2(SQRT(SIN((latitude-@given_latitude) * PI()/180/2) * SIN((latitude-@given_latitude) * PI()/180/2) +
         COS(@given_latitude * PI()/180) * COS(latitude * PI()/180) *
         SIN((longitude-@given_longitude) * PI()/180/2) * SIN((longitude-@given_longitude) * PI()/180/2)), SQRT(1-SIN((latitude-@given_latitude) * PI()/180/2) * SIN((latitude-@given_latitude) * PI()/180/2) +
         COS(@given_latitude * PI()/180) * COS(latitude * PI()/180) *
         SIN((longitude-@given_longitude) * PI()/180/2) * SIN((longitude-@given_longitude) * PI()/180/2)))>= @given_radius)
         Group by p.Postalcode,h.Household_Type;
```

### 🐍 **Flask Integration**

```python
from flask import Flask, render_template
import sqlite3

app = Flask(__name__)

@app.route('/')
def dashboard():
    conn = sqlite3.connect('database.db')
    cursor = conn.cursor()
    
    # Get student statistics
    cursor.execute("""
        SELECT COUNT(*) as total_students,
               AVG(grade) as avg_grade
        FROM students s
        JOIN enrollments e ON s.student_id = e.student_id
    """)
    
    stats = cursor.fetchone()
    return render_template('dashboard.html', stats=stats)
```

---

## 📊 Featured Projects

| **Project Name** | **Complexity** | **Technologies** | **Description** |
|------------------|----------------|------------------|-----------------|
| Library Management System | ⭐⭐⭐ | MySQL, Flask, HTML/CSS | Complete book lending system |
| Inventory Control System | ⭐⭐⭐⭐ | PostgreSQL, Python, REST API | Warehouse management solution |
| Student Portal | ⭐⭐⭐⭐⭐ | SQLite, Flask, Bootstrap | Academic management platform |

---

## 🤝 Contributing

We welcome contributions! Here's how you can help:

### **Contribution Workflow**

```bash
# 1. Fork the repository
git fork https://github.com/kraryal/Database-Systems-Concepts---Design

# 2. Create feature branch  
git checkout -b feature/amazing-feature

# 3. Commit changes
git commit -m "Add amazing database feature"

# 4. Push to branch
git push origin feature/amazing-feature

# 5. Open Pull Request
```

### **Guidelines**
- ✅ Follow consistent code formatting
- ✅ Include comprehensive documentation  
- ✅ Add practical examples
- ✅ Test all SQL scripts
- ✅ Update README for new features

---

## 📚 Learning Resources

### **📖 Recommended Books**
- Database System Concepts by Silberschatz, Korth, and Sudarshan
- Fundamentals of Database Systems by Elmasri and Navathe
- Database Design for Mere Mortals by Michael J. Hernandez

### **🌐 Online Resources**
- [W3Schools SQL Tutorial](https://www.w3schools.com/sql/)
- [PostgreSQL Documentation](https://www.postgresql.org/docs/)
- [MySQL Documentation](https://dev.mysql.com/doc/)
- [Flask Documentation](https://flask.palletsprojects.com/)

### **💪 Practice Platforms**
- [SQLBolt](https://sqlbolt.com/)
- [HackerRank SQL Challenges](https://www.hackerrank.com/domains/sql)
- [LeetCode Database Problems](https://leetcode.com/problemset/database/)

---

## 📄 License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

---

<div align="center">

**Created with ❤️ by [Kraryal](https://github.com/kraryal)**

[![GitHub followers](https://img.shields.io/github/followers/kraryal?style=social)](https://github.com/kraryal)
[![GitHub stars](https://img.shields.io/github/stars/kraryal/Database-Systems-Concepts---Design?style=social)](https://github.com/kraryal/Database-Systems-Concepts---Design)

---

### 🚀 **Ready to master database systems?**
**Star this repo ⭐ if you found it helpful!**

</div>
```
