from flask import Flask, render_template, request, redirect, session, url_for, jsonify
from flask_mysqldb import MySQL
from off_the_grid import get_off_grid_data
from heating_cooling_method import get_heating_cooling_method_data
from waterheaterstatistics import get_water_heater_stat
from average_radius import get_average_radiusdata
from heating_details import heating_details



app = Flask(__name__)
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = '0442084'
app.config['MYSQL_DB'] = 'cs6400_project'

app.secret_key = '12345678'
mysql = MySQL(app)


def no_heating_cooling(email):
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT COUNT(*) FROM HOUSEHOLD WHERE Heating_temperature is NULL AND Cooling_temperature is NULL AND email = %s", (email,))
    result = cursor.fetchone()
    cursor.execute("SELECT COUNT(*) FROM POWERGENERATOR WHERE email = %s", (email,))
    result2 = cursor.fetchone()
    if ((result[0] == 1) and (result2[0] == 0)):
        return True
    else:
        return False

def validate_postalcode(postal_code):
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT COUNT(*) FROM POSTALCODE WHERE postalcode = %s", (postal_code,))
    result = cursor.fetchone()
    cursor.close()
    if (result[0] < 1):
        return True

def validated_household_contrainst(email, postal_code):
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT COUNT(*) FROM POSTALCODE WHERE postalcode = %s", (postal_code,))
    result = cursor.fetchone()
    cursor.execute("SELECT COUNT(*) FROM household WHERE email = %s", (email,))
    result2 = cursor.fetchone()
    cursor.close()
    if (result[0] < 1):
        return render_template('error_messages.html', message="postal_code provided is an invalid. Please try again")
    elif (result2[0] > 0):
        return render_template('error_messages.html', message= "email provided is already in use. Please select a new email and try again")
    else:
        return True




def insert_manafucturer(name):
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
    cursor.close()

def setApplianceNumber(email):
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT MAX(HouseholdApplianceNum) FROM APPLIANCES WHERE email = %s", (email,))
    result = cursor.fetchone()
    current_appliance_number = result[0] if result[0] else 0
    session['appliance_id'] = current_appliance_number + 1
    cursor.close()


@app.route('/')
def index():
    return render_template('index.html')

@app.route('/add_household', methods=['GET', 'POST'])
def add_household():
    if request.method == 'POST':
        try:
            email = request.form["email"]
            print(f"DEBUG: Email received: {email}")
            
            session['email'] = email
            square_footage = request.form['square_footage']
            print(f"DEBUG: Square footage: {square_footage}")
            
            coolThermo = request.form['coolThermo']
            heatThermo = request.form['heatThermo']
            print(f"DEBUG: Cool temp: '{coolThermo}', Heat temp: '{heatThermo}'")
            
            if coolThermo == "":
                coolThermo = None
            if heatThermo == "":
                heatThermo = None
                
            household_type = request.form['household_type']
            postal_code = request.form['postal_code']
            utilities = request.form.getlist('public_utilities')
            
            print(f"DEBUG: household_type: {household_type}")
            print(f"DEBUG: postal_code: {postal_code}")
            print(f"DEBUG: utilities: {utilities}")
            
            cursor = mysql.connection.cursor()
            
            # Check postal code validation
            cursor.execute("SELECT COUNT(*) FROM POSTALCODE WHERE postalcode = %s", (postal_code,))
            result = cursor.fetchone()
            print(f"DEBUG: Postal code validation result: {result[0]}")
            
            # Check email validation
            cursor.execute("SELECT COUNT(*) FROM household WHERE email = %s", (email,))
            result2 = cursor.fetchone()
            print(f"DEBUG: Email validation result: {result2[0]}")
            
            if (result2[0] > 0):
                cursor.close()
                return render_template('error_messages.html',
                                       message= email + " is already in use. Please select a valid email address and try again")
            elif (result[0] < 1):
                cursor.close()
                return render_template('error_messages.html',
                                       message= postal_code + " is an invalid postal code. Please select a new postal code and try again")
            else:
                print("DEBUG: About to insert household record...")
                cursor.execute('''INSERT INTO HOUSEHOLD VALUES(%s, %s,%s,%s,%s,%s)''', (email, int(square_footage), coolThermo, heatThermo, household_type, postal_code))
                print("DEBUG: Household record inserted")
                
                print("DEBUG: About to insert utilities...")
                for utility in utilities:
                    print(f"DEBUG: Inserting utility: {utility}")
                    cursor.execute('''INSERT INTO HOUSEHOLD_UTILITIES (EMAIL, UTILITYNAME) VALUES(%s, %s)''',(email, utility))
                
                mysql.connection.commit()
                print("DEBUG: All changes committed to database")
                cursor.close()
                return redirect('/add_appliance')
                
        except Exception as e:
            print(f"DEBUG ERROR: {e}")
            return render_template('error_messages.html', message=f"Database error: {str(e)}")
            
    return render_template('add_household.html')

@app.route('/add_appliance', methods=['GET','POST'])
def add_appliance():
    if request.method == 'GET':
        if 'email' not in session:
            return render_template('error_messages.html', message="Invalid Household (email) provided")
        return render_template('add_appliance.html')
    if request.method=='POST':
        print(session['email'])
        applianceData = request.get_json()
        print(session['email'], applianceData)
        email = session['email']
        setApplianceNumber(email)
        cursor = mysql.connection.cursor()
        householdappliance= session.get('appliance_id')

        ########################################################
        #Add Water Heater Routine - WORKS!!
        #########################################################
        if applianceData['type']== "WaterHeater":
            insert_manafucturer(applianceData['manufacturer'])
            cursor.execute('''INSERT INTO APPLIANCES VALUES(%s, %s,%s,%s, %s,%s)''', (email, session.get('appliance_id'), applianceData['btu'], applianceData['type'], session.get('manufacturer_id'), applianceData['modelName']),)
            mysql.connection.commit()
            cursor.execute(''' INSERT INTO WATERHEATER VALUES(%s, %s, %s, %s, %s) ''',(int(applianceData['energySource']), float(applianceData['tankSize']), int(applianceData['currentTemp']), email, householdappliance),)
            mysql.connection.commit()
            cursor.close()
            # return redirect('/appliance_listings')
        ###########################################################
        ########################################################
        # Add Air Handler - Air Conditioner!!
        #########################################################
        elif applianceData['heatingMethod']== "AirConditioner":
            insert_manafucturer(applianceData['manufacturer'])
            sourceID = 5
            cursor = mysql.connection.cursor()
            cursor.execute('''INSERT INTO APPLIANCES VALUES(%s, %s,%s,%s, %s,%s)''', (email, householdappliance, applianceData['btu'], applianceData['type'], session.get('manufacturer_id'), applianceData['modelName']),)
            mysql.connection.commit()
            cursor.execute(''' INSERT INTO AIRCONDITIONER VALUES(%s, %s, %s, %s) ''',(sourceID, email, householdappliance, float(applianceData['eer']) ),)
            mysql.connection.commit()
            cursor.close()
            # return redirect('/appliance_listings')
            # return redirect('/appliance_listings')
        ########################################################
        # Add Air Handler - Heater!!
        #########################################################
        elif applianceData['heatingMethod']== "Heater":
            sourceID= 6
            insert_manafucturer(applianceData['manufacturer'])
            cursor = mysql.connection.cursor()
            cursor.execute('''INSERT INTO APPLIANCES VALUES(%s, %s,%s,%s, %s,%s)''', (email, householdappliance, applianceData['btu'], applianceData['type'], session.get('manufacturer_id'), applianceData['modelName']),)
            mysql.connection.commit()
            cursor.execute(''' INSERT INTO HEATER VALUES(%s, %s, %s) ''', (sourceID, email, householdappliance),)
            mysql.connection.commit()
            cursor.close()
            # return redirect('/appliance_listings')
            # return redirect('/appliance_listings')
        ########################################################
        # Add Air Handler - Heat Pump!!
        #########################################################
        elif applianceData['heatingMethod'] == "HeatPump":
            insert_manafucturer(applianceData['manufacturer'])
            sourceID = 4
            cursor = mysql.connection.cursor()
            cursor.execute('''INSERT INTO APPLIANCES VALUES(%s, %s,%s,%s, %s,%s)''', (email, householdappliance, applianceData['btu'], applianceData['type'], session.get('manufacturer_id'), applianceData['modelName']),)
            mysql.connection.commit()
            cursor.execute(''' INSERT INTO HEATPUMP VALUES(%s, %s, %s, %s, %s) ''', (sourceID, email, householdappliance, float(applianceData['seer']), float(applianceData['hspf'])),)
            mysql.connection.commit()
            cursor.close()





@app.route('/add_power', methods=['GET', 'POST'])
def add_power():
    if request.method == 'GET':
        if 'email' not in session:
            return render_template('error_messages.html', message="no email provided. contact system admin")
        print(no_heating_cooling(session['email']))
        return render_template("add_power.html", message=no_heating_cooling(session['email']))
    if request.method == 'POST':
        email = session['email']
        cursor = mysql.connection.cursor()
        query = 'SELECT MAX(GeneratorID) FROM POWERGENERATOR WHERE Email="email"';
        cursor.execute(query)
        result = cursor.fetchall()
        print(type(result),result[0][0] )
        if 'power_id' in session:
            session['power_id']+=1
        else:
            if result[0][0] == None:
                session['power_id'] = 1
            else:
                session['power_id'] = int(result[0][0]) + 1
        powertype = request.form['powertype']
        monthlyKWh = request.form['monthlyKWh']
        storageKWh = request.form['storageKWh']
        print([session.get('power_id'), powertype, monthlyKWh, storageKWh, session['email']])
        cursor = mysql.connection.cursor()
        cursor.execute('''INSERT INTO POWERGENERATOR VALUES(%s, %s, %s, %s, %s) ''', (email, session.get('power_id'), powertype, int(monthlyKWh), int(storageKWh)),)
        mysql.connection.commit()
        cursor.close()
        return redirect('/power_listings')




@app.route('/reporting')
def reporting():
    return render_template('reporting.html')


@app.route('/top_25_manufacturers')
def top_25_manufacturers():
    cursor = mysql.connection.cursor()
    # QUERY = 'select manufacturername, count(*) from appliances group by manufacturername order by count(*) limit 25;' # WHERE Email="email"';
    QUERY = 'SELECT manufacturer.manufacturername, count(*) FROM APPLIANCES INNER JOIN manufacturer ON manufacturer.manufacturerid = APPLIANCES.manufacturerid GROUP BY manufacturer.manufacturername limit 25;'
    cursor.execute(QUERY)
    output = cursor.fetchall()
    cursor.close()
    return render_template('top_25_manufacturers.html', output = output)

@app.route('/drilldown')
def drilldown():
    return render_template('drilldown.html')
#
# Search functionality
search_data =[]
@app.route('/search', methods=['GET', 'POST'])
def search():
    if request.method == 'POST':
        term = request.form['query']
        sql = "%" + term + "%"
        cursor = mysql.connection.cursor()
        cursor.execute("SELECT MANUFACTURER.manufacturername, APPLIANCES.model FROM APPLIANCES INNER JOIN MANUFACTURER ON MANUFACTURER.manufacturerid = APPLIANCES.manufacturerid where MANUFACTURER.manufacturername LIKE %s OR APPLIANCES.model LIKE %s order by MANUFACTURER.manufacturername ASC, APPLIANCES.model ASC ;", (sql, sql))
        output = cursor.fetchall()
        cursor.close()
        return render_template('search_results.html', output=output)
    else:
        return render_template('search.html')


@app.route('/search_results',methods=['GET', 'POST'])
def search_results():
    if request.method == 'POST':
        term = request.form['query']
        sql = "%" + term + "%"
        cursor = mysql.connection.cursor()
        # cursor.execute("SELECT manufacturername, model FROM appliances where manufacturername LIKE %s OR model LIKE %s", (sql, sql))
        cursor.execute(
            "SELECT MANUFACTURER.manufacturername, APPLIANCES.model FROM APPLIANCES INNER JOIN MANUFACTURER ON MANUFACTURER.manufacturerid = APPLIANCES.manufacturerid where "
            "MANUFACTURER.manufacturername LIKE %s OR APPLIANCES.model LIKE %s order by MANUFACTURER.manufacturername ASC ,APPLIANCES.model ASC ;",
            (sql, sql))
        output = cursor.fetchall()
        # print(output[0])
        cursor.close()
        return render_template('search_results.html', output=output)
    else:
        return render_template('search_results.html')
@app.route('/heating_cooling_methods')
def heating_cooling_methods():
    data = get_heating_cooling_method_data(mysql)
    return render_template('heating_cooling_methods.html', data= data)


@app.route('/households')
def view_households():
    return render_template('view_households.html')

@app.route('/wrapup')
def wrapup():
    return render_template('wrapup.html')


@app.route('/off_the_grid_household')
def off_the_grid_household():
    data = get_off_grid_data(mysql)
    return render_template('off_the_grid_household.html', data=data)


@app.route('/water_heater_statistics')
def water_heater_statistics():
    data = get_water_heater_stat(mysql)
    return render_template('water_heater_statistics.html', data=data)

@app.route('/appliance_listings')
def appliance_listings():
    try:
        email=session['email']
        cursor = mysql.connection.cursor()
        QUERY = 'SELECT APPLIANCES.householdApplianceNum, APPLIANCES.appliance_type, manufacturer.manufacturername, APPLIANCES.model FROM APPLIANCES INNER JOIN manufacturer ON manufacturer.manufacturerid = APPLIANCES.manufacturerid WHERE APPLIANCES.email = %s;'
        cursor.execute(QUERY, (email,))
        output = cursor.fetchall()
        cursor.close()
        return render_template('appliance_listings.html', output=output)
    except:
        return render_template('error_messages.html', message="Invalid household provide, please return to the main main")


@app.route('/manufacturer/<name>')
def manufacturer(name):
    query = name
    cursor = mysql.connection.cursor()
    QUERY2 = 'SELECT all_types.appliance_type, COUNT(appliances.appliance_type) AS count FROM ( SELECT DISTINCT appliance_type FROM appliances) ' \
             'AS all_types CROSS JOIN manufacturer LEFT JOIN appliances ON all_types.appliance_type = appliances.appliance_type AND ' \
             'manufacturer.manufacturerid = appliances.manufacturerid WHERE manufacturername = %s GROUP BY all_types.appliance_type, manufacturer.manufacturername;'

    # QUERY = 'SELECT APPLIANCES.appliance_type, count(appliances.appliance_type) FROM APPLIANCES INNER JOIN manufacturer ON manufacturer.manufacturerid = APPLIANCES.manufacturerid WHERE manufacturer.manufacturername = %s group by APPLIANCES.appliance_type;'
    cursor.execute(QUERY2, (query,))
    output = cursor.fetchall()
    cursor.close()
    return render_template('drilldown.html', output=[name, output])

@app.route('/appliances/<int:id>', methods=['GET', 'POST'])
def appliances(id):
    query = int(id)
    print(id)
    cursor = mysql.connection.cursor()
    QUERY = 'DELETE FROM APPLIANCES WHERE HouseholdApplianceNum = %s';
    cursor.execute(QUERY, (query,))
    # output = cursor.fetchall()
    mysql.connection.commit()
    cursor.close()
    print('query complete')
    return redirect('/appliance_listings')


@app.route('/generator/<id>')
def generator(id):
    query = id
    cursor = mysql.connection.cursor()
    QUERY = 'DELETE FROM POWERGENERATOR WHERE GENERATORID=%s';
    cursor.execute(QUERY, (query,))
    mysql.connection.commit()
    cursor.close()
    return redirect('/power_listings')
@app.route('/power_listings')
def power_listings():
    try:
        cursor = mysql.connection.cursor()
        email=session['email']
        QUERY = 'select GeneratorID, GenerationType, AvgMonthly_kWh, BatteryStorage_kWh from powergenerator WHERE Email=%s;' # WHERE Email="email"';
        cursor.execute(QUERY, (email,))
        output = cursor.fetchall()
        cursor.close()
        return render_template('power_listings.html', output=output)
    except:
        return render_template('error_messages.html', message="Invalid household provided, please return to the main main")
@app.route('/household_average_by_radius', methods=['GET', 'POST'])
def household_average_by_radius():
    if request.method == "GET":
        return render_template('initial_average_by_radius.html')
    if request.method == 'POST':
        postalcode = request.form['postalcode']
        radius = request.form['radius']



        if validate_postalcode(postalcode):
            return render_template('error_messages.html', message="postal_code provided is an invalid. Please try again")
        else:
            cursor = mysql.connection.cursor()
            query = 'SELECT longitude, latitude FROM PostalCode WHERE PostalCode = %s;'
            cursor.execute(query, (postalcode,))
            result = cursor.fetchall()
            longitude = result[0][0]
            latitude = result[0][1]
            cursor.close()
            data = get_average_radiusdata(mysql, postalcode, longitude, latitude, radius)
            query2 = 'SELECT postalcode, city, statename, latitude, longitude FROM PostalCode WHERE PostalCode = %s;'
            cursor = mysql.connection.cursor()
            cursor.execute(query2, (postalcode,))
            unique_row = cursor.fetchall()
            initial_distance = 0
            data0 = unique_row[0] + (initial_distance,)
            cursor.close()
            return render_template('household_average_by_radius.html', data = [data0, data] )



@app.route("/water_heater_details/<state>")
def water_heater_details(state):
    data = heating_details(mysql, state)
    return render_template('water_heater_details.html', data = [state, data])

@app.route("/error_messages")
def error_messages():
    message = "No Error Message Specified"
    return render_template('error_messages.html', message=message)
@app.errorhandler(404)
def page_not_found(e):
    return render_template('404.html'), 404



if __name__ == '__main__':
    app.run(debug=True)