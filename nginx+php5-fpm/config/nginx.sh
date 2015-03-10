#!/usr/bin/env bash
#Substitutions need to be done here to pass in the environment variables 
#DB_PORT_3306_TCP_PORT=3306
#DB_PORT_3306_TCP_ADDR=172.17.0.5
sed -i "s/DB_PORT_3306_TCP_PORT_REPLACE/${DB_PORT_3306_TCP_PORT}/" /etc/nginx/sites-enabled/default
sed -i "s/DB_PORT_3306_TCP_ADDR_REPLACE/${DB_PORT_3306_TCP_ADDR}/" /etc/nginx/sites-enabled/default
nginx
