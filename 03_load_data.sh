#!/bin/bash

MYSQL="mysql -u root -p -t -B --database=cars"

$MYSQL << MYSQL_INPUT
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE model;
ALTER TABLE model AUTO_INCREMENT = 1;
TRUNCATE TABLE engine;
ALTER TABLE engine AUTO_INCREMENT = 1;
TRUNCATE TABLE transmission;
ALTER TABLE engine AUTO_INCREMENT = 1;
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO transmission (type, transmission)
    SELECT DISTINCT Transmission_Type, Transmission FROM cars_raw ORDER BY 1;
SELECT COUNT(*) total FROM transmission;
SELECT * FROM transmission;

UPDATE cars_raw SET Seating_Capacity=8 WHERE Model='Omni';
INSERT INTO model(name, maker, body_type, seating_capacity)
    SELECT DISTINCT Model, Make, Body_Type, Seating_Capacity FROM cars_raw ORDER BY 2, 1, 3;
SELECT COUNT(*) total FROM model;
SELECT * FROM model;

UPDATE cars_raw SET Engine_Type='Turbocharged petrol engine'
    WHERE Engine_Type LIKE "Turbocharged petrol engine, in-line%";
UPDATE cars_raw SET Engine_Type='1.2 Kappa petrol'
    WHERE Engine_Type LIKE "1.2 Kappa petrol with%";
INSERT INTO engine(type, fuel_type, fuel_tank, cc_displacement, torque_nm, power_bhp, emission, mileage_kmpl)
    SELECT DISTINCT Engine_Type, Fuel_Type, Fuel_Tank_Capacity, CC_Displacement, Torque_nm, Power_bhp,
                        Emission, Mileage_kmpl FROM cars_raw;
SELECT COUNT(*) total FROM engine;
SELECT * FROM engine;
MYSQL_INPUT
