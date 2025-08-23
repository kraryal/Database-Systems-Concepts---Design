from flask import session

def insert_manafucturer(name, mysql):
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT manufacturerID FROM manufacturer WHERE manufacturername = %s", (name,))
    result = cursor.fetchone()
    if result:
        manufacturer_id = result[0]
        session['manufacturer_id'] = manufacturer_id
        print(manufacturer_id)
        print("session", session['manufacturer_id'])
    else:
        cursor.execute("INSERT INTO manufacturer (manufacturername) VALUES (%s)", (name,))
        manufacturer_id = cursor.lastrowid
        session['manufacturer_id'] = manufacturer_id
        print(manufacturer_id)
        print("session", session['manufacturer_id'])
    mysql.connection.commit()
    mysql.connection.close()

def setApplianceID(email, mysql):
    cursor = mysql.connection.cursor()
    query = 'SELECT MAX(`HouseholdApplianceNum`) FROM APPLIANCES WHERE Email="email"';
    cursor.execute(query)
    result = cursor.fetchall()
    if result[0][0] == None:
        session['appliance_id'] = 1
    else:
        session['appliance_id'] = int(result[0][0]) + 1