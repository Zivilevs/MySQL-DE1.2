#!/bin/bash

MYSQL="mysql --defaults-file=/home/zivile/Documents/asmeniniai/07_turing/01_module/Turing-project/mysql-carvana-project2/.mysql.cnf -t -B"

$MYSQL << MYSQL_INPUT
CREATE USER IF NOT EXISTS 'zivile'@'localhost' IDENTIFIED BY 'zivile';
GRANT SELECT ON *.* TO 'zivile'@'localhost';
FLUSH PRIVILEGES;
select user from mysql.user;
show grants for 'zivile'@'localhost';
MYSQL_INPUT


