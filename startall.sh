#!/bin/bash
#Start Nginx Stack
echo "=== Starting Nginx & PHP5-FPM ==="
cd nginx+php5-fpm
./start.sh

cd ..

#Start MariaDB
echo "=== Starting MariaDB stack and linking to Nginx Container ==="
cd mariadb
./start.sh

echo "=== DONE! ==="