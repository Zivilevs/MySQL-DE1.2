#!/bin/bash

MYSQL="mysql --defaults-file=/home/zivile/Documents/asmeniniai/07_turing/01_module/Turing-project/mysql-carvana-project2/.mysql.cnf -t -B"

$MYSQL << MYSQL_INPUT
CREATE DATABASE IF NOT EXISTS cars;
USE cars;
DROP TABLE IF EXISTS cars_raw;
CREATE TABLE IF NOT EXISTS cars_raw (
    Car_Name varchar(100) not null,
    Make varchar(20) not null,
    Model varchar(40) not null,
    Make_Year int not null,
    Color varchar(20) not null,
    Body_Type varchar(15) not null,
    Mileage_Run varchar(15) not null,
    No_of_Owners varchar(10) not null,
    Seating_Capacity int not null,
    Fuel_Type varchar(20) not null,
    Fuel_Tank_Capacity int not null,
    Engine_Type varchar(20) not null,
    CC_Displacement int not null,
    Transmission varchar(15) not null,
    Transmission_Type varchar(20) not null,
    Power_bhp decimal(6,2) not null, 
    Torque_nm decimal(6,2) not null,
    Mileage_kmpl decimal(6,2) not null,
    Emission varchar(15) not null,
    Price varchar(15) not null);
SHOW TABLES from cars;
SHOW COLUMNS FROM cars_raw;
load data local infile 'FINAL_SPINNY_900.csv' into table cars.cars_raw
 FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;
 SELECT COUNT(*) total_cars FROM cars_raw;
MYSQL_INPUT
