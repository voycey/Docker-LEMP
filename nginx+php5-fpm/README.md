Once the build is completed you can run start.sh to setup the container or you can use the following code (from within the nginx-php5-fpm directory)
(feel free to change ```\`pwd\`/www``` to your local webroot, else it will use the www folder in the nginx-php5-fpm folder)

```
#!/bin/bash
NGINX_CONTAINERID=`docker run --name=webapp --link=mariadb:db -v \`pwd\`/www:/var/www:rw -p 82:80 -d webapp /sbin/my_init`
echo "NGINX ContainerID: $NGINX_CONTAINERID"
```
