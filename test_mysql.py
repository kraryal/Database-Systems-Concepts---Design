import mysql.connector

try:
    connection = mysql.connector.connect(
        host='localhost',
        user='root',
        password='your_actual_password',  # Put your real password here
        database='cs6400_project'
    )
    print("✅ Connection successful!")
    cursor = connection.cursor()
    cursor.execute("SELECT VERSION()")
    result = cursor.fetchone()
    print(f"MySQL version: {result[0]}")
    cursor.close()
    connection.close()
except Exception as e:
    print(f"❌ Connection failed: {e}")