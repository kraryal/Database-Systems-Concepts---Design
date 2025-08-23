from flask import Flask, render_template, request, redirect
from flask_sqlalchemy import SQLAlchemy
# from flask_mysqldb import MySQL

app = Flask(__name__)

#sqlite connection
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///households.db'
db = SQLAlchemy(app)

# # MySQL connection string
# app.config['MYSQL_HOST'] = 'localhost'
# app.config['MYSQL_USER'] = 'cs400'
# app.config['MYSQL_PASSWORD'] = ''
# app.config['MYSQL_DB'] = 'cs6400_project'
# mysql = MySQL(app)


class Household(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    email = db.Column(db.String(100))
    postal_code = db.Column(db.String(10))
    dwelling_type = db.Column(db.String(50))
    square_footage = db.Column(db.Integer)
    thermostat = db.Column(db.Integer)
    public_utilities = db.Column(db.String(50))

    def __init__(self, email, postal_code, dwelling_type, square_footage, thermostat, public_utilities):
        self.email = email
        self.postal_code = postal_code
        self.dwelling_type = dwelling_type
        self.square_footage = square_footage
        self.thermostat = thermostat
        self.public_utilities = public_utilities

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/add_household', methods=['GET', 'POST'])
def add_household():
    if request.method == 'POST':
        email = request.form['email']
        postal_code = request.form['postal_code']
        dwelling_type = request.form['dwelling_type']
        square_footage = request.form['square_footage']
        thermostat = request.form['thermostat']
        public_utilities = request.form['public_utilities']

        household = Household(email, postal_code, dwelling_type, square_footage, thermostat, public_utilities)
        db.session.add(household)
        db.session.commit()
        return redirect('/add_appliance')
    return render_template('add_household.html')

@app.route("/add_power", methods=['GET', 'POST'])
def add_power():
    if request.method == 'POST':
        return redirect('/wrapup.html')
    return render_template("add_power.html")

@app.route('/reporting')
def reporting():
    return render_template('reporting.html')

@app.route('/add_appliance', methods=['GET', 'POST'])
def add_appliance():
    if request.method == 'POST':
        return redirect('/add_power')
    return render_template('add_appliance.html')

@app.route('/top_25_manufacturers')
def top_25_manufacturers():
    return render_template('top_25_manufacturers.html')

app.route('/search')
def search():
    return render_template('search.html')

@app.route('/heating_cooling_methods')
def heating_cooling_methods():
    return render_template('heating_cooling_methods.html')


@app.route('/households')
def view_households():
    households = Household.query.all()
    return render_template('view_households.html', households=households)

if __name__ == '__main__':
    db.create_all()
    app.run(debug=True)
