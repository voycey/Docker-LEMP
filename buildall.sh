#!/bin/bash
docker build -t webapp nginx+php5-fpm
docker build -t percona percona
./nginx+php5-fpm/start.sh
./percona/start.sh