#!/bin/bash
docker run -p 33062:3306 -d percona /sbin/my_init --enable-insecure-key
