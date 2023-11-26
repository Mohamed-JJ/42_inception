#!/bin/bash

# Start the MariaDB service
service mariadb start

# Create a file called file.sql
cat > file.sql <<EOF
CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'${DB_HOSTNAME}' IDENTIFIED BY '${MYSQL_PASSWORD}';
CREATE USER 'root'@'%' identified by '${MYSQL_ROOT_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

# Execute the MYSQL statements from the file
mysql -u root -p$MYSQL_ROOT_PASSWORD  < file.sql

# Stop the MariaDB service
service mariadb stop

# here we sleep 5 seconds soo we can give proper time for the mariadb service to stop else the mysqld is going to run and not find the data base creates

# Start the MariaDB service with safe exec
mysqld_safe
