#!/bin/bash

MYSQL="mysql -u root -p -t -B"

$MYSQL << MYSQL_INPUT
DROP USER 'zivile'@'localhost';
CREATE USER IF NOT EXISTS 'zivile'@'localhost' IDENTIFIED BY 'zivile';
GRANT SELECT ON cars.* TO 'zivile'@'localhost';
FLUSH PRIVILEGES;
SELECT user FROM mysql.user;
SHOW GRANTS FOR 'zivile'@'localhost';
MYSQL_INPUT


