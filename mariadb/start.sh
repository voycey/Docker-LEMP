#!/bin/bash
CONTAINERID=`docker run -d --volumes-from db_vol -p 33062:3306 mariadb`
echo "ContainerID: $CONTAINERID"
#Ok so this runs the code needed to generate the credentials
docker exec $CONTAINERID /root/create-admin.sh
