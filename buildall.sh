#!/bin/bash
PS3='Please choose options: '
options=("MariaDB" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "MariaDB")
			echo "Building LEMP Stack with MariaDB"
            docker build -t mariadb mariadb
            
            if [ ! -f mariadb/.volcreated ]; then
            	echo "=== Creating storage container for MariaDB ==="
				#create the volume once
				docker run -d -v /var/lib/mysql --name db_vol -p 22:22 phusion/baseimage
				touch mariadb/.volcreated
			else
				echo "=== Storage Container already created ==="
			fi
			cd mariadb && ./start.sh
			break
            ;;
        "Quit")
            break
            ;;
        *) echo invalid option;;
    esac
done

echo "Building NGINX+FPM"

cd ..
#Build NGINX
docker build -t webapp nginx+php5-fpm
cd nginx+php5-fpm && ./start.sh