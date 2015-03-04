#!/bin/bash
docker run -v `pwd`/data:/var/lib/mysql/data:rw -p 33062:3306 -d percona /sbin/my_init --enable-insecure-key
