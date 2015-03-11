Once the container is built you can run start.sh (or use the following code)
```
#!/bin/bash

MARIADB_CONTAINERID=`docker run --name=mariadb -d --volumes-from db_vol -p 33062:3306 mariadb`
echo "MariaDB ContainerID: $MARIADB_CONTAINERID"
DOCKER_DB_HOST=`docker inspect $MARIADB_CONTAINERID | grep IPAddres | awk -F'"' '{print $4}'`
#Ok so this runs the code needed to generate the credentials
if [ ! -f .admincreated ]; then
	docker exec $MARIADB_CONTAINERID /root/create-admin.sh
	touch .admincreated
fi

```
