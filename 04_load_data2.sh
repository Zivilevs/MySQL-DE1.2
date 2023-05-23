#!/bin/bash

MYSQL="mysql -u root -p -t -B --database=cars"

$MYSQL << MYSQL_INPUT
 TABLE car;
ALTER TABLE model AUTO_INCREMENT = 1;
INSERT INTO car 
SELECT null,
        Car_Name,
        CAST(REGEXP_REPLACE(Mileage_Run,',','') AS SIGNED),
        No_of_Owners,
        Color,
        CAST(REGEXP_REPLACE(Price,',','') AS SIGNED),
        Make_Year,
        m.id,
        e.id,
        t.id
    FROM cars_raw r, transmission t, model m, engine e
    WHERE r.Transmission=t.transmission AND r.Transmission_Type=t.type AND
        r.Model=m.name AND r.Make=m.maker AND r.Body_Type=m.body_type AND r.Seating_Capacity=m.seating_capacity AND
        r.Engine_Type=e.type AND r.Fuel_Type=e.fuel_type AND r.Fuel_Tank_Capacity=e.fuel_tank AND
        r.CC_Displacement=e.cc_displacement AND r.Torque_nm=e.torque_nm AND r.Power_bhp=e.power_bhp AND r.Emission=e.emission
        AND r.Mileage_kmpl=e.mileage_kmpl;

SELECT COUNT(*) total_rows FROM car;
DESCRIBE car;
SELECT * FROM car WHERE LENGTH(name) < 20 LIMIT 5;
SHOW TABLES;
MYSQL_INPUT