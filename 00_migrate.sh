#!/bin/bash
set -e
chmod u+x 02_a_dbf_mysql.R
chmod u+x 02_b_alter_fields.py

echo "01"
mysql -pdata < 01_create_hrs_mysql_db.sql
echo "02a"
./02_a_dbf_mysql.R
#convert text columns to varchar
echo "02b"
./02_b_alter_fields.py
echo "03"
mysql -pdata hrs_mysql_db < 03_alter_rounds.sql
echo "04"
mysql -pdata hrs_mysql_db < 04_alter_location.sql
echo "05"
mysql -pdata hrs_mysql_db < 05_alter_observation.sql
echo "06"
mysql -pdata hrs_mysql_db < 06_alter_individual.sql
echo "07"
mysql -pdata hrs_mysql_db < 07_alter_socialgroup.sql
echo "08"
mysql -pdata hrs_mysql_db < 08_alter_relationship.sql
echo "09"
mysql -pdata hrs_mysql_db < 09_alter_membership.sql
echo "10"
mysql -pdata hrs_mysql_db < 10_alter_indvstatus.sql
echo "11"
mysql -pdata hrs_mysql_db < 11_alter_pregoutcome.sql
echo "12"
mysql -pdata hrs_mysql_db < 12_alter_birth.sql
echo "13"
mysql -pdata hrs_mysql_db < 13_alter_residency.sql
echo "14"
mysql -pdata hrs_mysql_db < 14_alter_death.sql
echo "15"
mysql -pdata hrs_mysql_db < 15_alter_outmigration.sql
echo "16"
mysql -pdata hrs_mysql_db < 16_alter_inmigration.sql
echo "17"
mysql -pdata odk_prod < 17_create_error_table.sql
echo "18"
mysql -pdata openhds < 18_prepare_openhds_db.sql


