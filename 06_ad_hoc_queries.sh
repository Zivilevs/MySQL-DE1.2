#!/bin/bash

MYSQL="mysql -u zivile -p --database=cars -t -B -e"

echo -e "\nWhat are the 5 cheapest cars? Show its model and maker:\n"
echo "$($MYSQL "SELECT m.name Model_name, m.maker, c.mileage_run, c.num_of_owners, c.color, c.price, c.make_year
                FROM car c JOIN model m ON c.model_id=m.id ORDER BY c.price LIMIT 5;")"

echo -e "\nWhat are the 5 most expensive cars? Show its model and maker:\n"
echo "$($MYSQL "SELECT m.name Model_name, m.maker, c.mileage_run, c.num_of_owners, c.color, c.price, c.make_year
                FROM car c JOIN model m ON c.model_id=m.id ORDER BY c.price DESC LIMIT 5;")"

echo -e "\nWhat models we have only manual transmission type in this database? Order by maker:\n"
echo "$($MYSQL "SELECT m.maker, m.name Model_name, GROUP_CONCAT(DISTINCT t.type) transmissions
                FROM car c JOIN model m ON c.model_id=m.id JOIN transmission t ON c.transmission_id=t.id
                GROUP BY m.name, m.maker HAVING transmissions = 'Manual' ORDER BY m.maker, m.name;")"

echo -e "\nWhat are 5 models with the lowest avarage consumption? Order by model:\n"
echo "$($MYSQL "SELECT m.name Model_name, m.maker, round(avg(e.mileage_kmpl),2) average_consumption
                FROM car c JOIN engine e on c.engine_id=e.id JOIN model m ON c.model_id=m.id
                GROUP BY Model_name, m.maker ORDER BY average_consumption LIMIT 5;")"
