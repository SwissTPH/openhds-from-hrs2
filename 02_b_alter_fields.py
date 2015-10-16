#!/usr/bin/env python
import MySQLdb


host = 'localhost'
user = 'data'
pw = 'data'
print("Connecting to mysql with following paramters:")
print("Host: " + host)
print("User: " + user)
print("Password: " + pw)

connection = MySQLdb.connect(host=host, user=user, passwd=pw)
cursor = connection.cursor()
cursor.execute("USE hrs_mysql_db")
cursor.execute("SHOW TABLES")
tables = cursor.fetchall()


for table in tables:
    cursor.execute("SELECT COLUMN_NAME, DATA_TYPE FROM information_schema.columns WHERE "
                   "TABLE_SCHEMA='hrs_mysql_db' AND table_name = '" + table[0] + "'")
    fields = cursor.fetchall()
    for field in fields:
        print("Altering table " + table[0] + ", field " + field[0])
        query = "ALTER TABLE hrs_mysql_db." + table[0] + " CHANGE " + field[0] + " " + field[0] + " VARCHAR(99)"
        try:
            cursor.execute(query)
        except:
            print("unable to run query: " + query)




