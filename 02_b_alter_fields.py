#!/usr/bin/env python
import MySQLdb

connection = MySQLdb.connect(host='localhost', user='data', passwd='data')
cursor = connection.cursor()
cursor.execute("USE hrs_mysql_db")
cursor.execute("SHOW TABLES")
tables = cursor.fetchall()

for table in tables:
    cursor.execute("SELECT COLUMN_NAME, DATA_TYPE FROM information_schema.columns WHERE "
                   "TABLE_SCHEMA='hrs_mysql_db' AND table_name = '" + table[0] + "'")
    fields = cursor.fetchall()
    for field in fields:
        cursor.execute("ALTER TABLE hrs_mysql_db." + table[0] + " CHANGE " + field[0] + " " + field[0] + " VARCHAR(99)")



