#!/bin/bash
docker run -v `pwd`/www:/var/www:rw -p 82:80 -d webapp /sbin/my_init --enable-insecure-key