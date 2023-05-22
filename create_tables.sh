#!/bin/bash

MYSQL="mysql --defaults-file=/home/zivile/Documents/asmeniniai/07_turing/01_module/Turing-project/mysql-carvana-project2/.mysql.cnf -t -B --database=cars"

$MYSQL << MYSQL_INPUT
DROP TABLE IF EXISTS car;

DROP TABLE IF EXISTS engine;
CREATE TABLE engine(
  id int NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
  type varchar(50) NOT NULL,
  fuel_type varchar(15) NOT NULL,
  fuel_tank int NOT NULL,
  cc_displacement int NOT NULL,
  torque_nm double NOT NULL,
  power_bhp double NOT NULL,
  emission varchar(10) DEFAULT NULL,
  mileage_kmpl decimal(6,2) DEFAULT NULL);
SHOW COLUMNS FROM engine;

DROP TABLE IF EXISTS model;
CREATE TABLE model (
  id int NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
  name varchar(20) UNIQUE NOT NULL,
  maker varchar(15) NOT NULL,
  body_type varchar(15) NOT NULL,
  seating_capacity int DEFAULT NULL);
SHOW COLUMNS FROM model;

DROP TABLE IF EXISTS transmission;
CREATE TABLE transmission(
  id int NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
  type varchar(15) NOT NULL CHECK (type in ('Manual','Automatic')),
  transmission varchar(20) NOT NULL);
SHOW COLUMNS FROM transmission;

DROP TABLE IF EXISTS car;
CREATE TABLE car(
  id int NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
  name varchar(80) NOT NULL DEFAULT 'No description',
  mileage_run int NOT NULL,
  num_of_owners varchar(10) DEFAULT 'Unknown',
  color varchar(15) NOT NULL,
  price int NOT NULL,
  make_year int NOT NULL,
  model_id int NOT NULL,
  engine_id int NOT NULL,
  transmission_id int NOT NULL);
SHOW COLUMNS FROM car;
MYSQL_INPUT

#CONSTRAINT car_m_1 FOREIGN KEY (model_id) REFERENCES model(id),
#CONSTRAINT car_e_2 FOREIGN KEY (engine_id) REFERENCES engine(id),
#CONSTRAINT car_t_3 FOREIGN KEY (transmission_id) REFERENCES transmission(id));