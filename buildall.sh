#!/bin/bash
docker build -t webapp nginx+php5-fpm
docker build -t percona percona
