#!/bin/bash
NGINX_CONTAINERID=`docker run --name=webapp --link=mariadb:db -v \`pwd\`/www:/var/www:rw -p 82:80 -d webapp /sbin/my_init`
echo "NGINX ContainerID: $NGINX_CONTAINERID"