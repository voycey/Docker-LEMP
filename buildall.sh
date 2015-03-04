#!/bin/bash
docker build -t webapp nginx+php5-fpm
docker build -t percona percona
cd nginx+php5-fpm && ./start.sh
cd ..
cd percona && ./start.sh