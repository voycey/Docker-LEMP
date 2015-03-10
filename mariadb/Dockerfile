FROM phusion/baseimage:0.9.16
MAINTAINER Dan Voyce <hello@danielvoyce.com>

ENV HOME /root

# Let the conatiner know that there is no tty
ENV DEBIAN_FRONTEND noninteractive

#Speed things up from Australia
RUN sed -i 's/archive.ubuntu.com/au.archive.ubuntu.com/' /etc/apt/sources.list

RUN apt-get install -y --force-yes software-properties-common
RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db
RUN add-apt-repository 'deb http://mirror.aarnet.edu.au/pub/MariaDB/repo/10.0/ubuntu trusty main'
RUN apt-get update
RUN apt-get install -y --force-yes mariadb-server
RUN rm -rf /var/lib/mysql/*
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

RUN sed -i -r 's/bind-address.*$/bind-address = 0.0.0.0/' /etc/mysql/my.cnf

ADD config/create-admin.sh 		/root/create-admin.sh
RUN chmod 775 					/root/create-admin.sh
RUN mkdir 						/etc/service/mariadb
ADD config/run.sh 				/etc/service/mariadb/run
RUN chmod 775 					/etc/service/mariadb/run

# Define mountable directories
VOLUME  ["/etc/mysql", "/var/lib/mysql"]

EXPOSE 3306

ENV TERM xterm

