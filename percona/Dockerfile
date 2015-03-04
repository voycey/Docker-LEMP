FROM phusion/baseimage:0.9.16
MAINTAINER Dan Voyce <hello@danielvoyce.com>

# Let the conatiner know that there is no tty
ENV DEBIAN_FRONTEND noninteractive

ENV HOME /root

CMD ["/sbin/my_init"]

RUN \
  apt-key adv --keyserver keys.gnupg.net --recv-keys 1C4CBDCDCD2EFD2A && \
  echo "deb http://repo.percona.com/apt `lsb_release -cs` main" > /etc/apt/sources.list.d/percona.list && \
  apt-get update && \
  apt-get install -y --force-yes percona-server-server-5.6 supervisor && \
  rm -rf /var/lib/apt/lists/* && \
  sed -i 's/^\(bind-address\s.*\)/# \1/' /etc/mysql/my.cnf && \
  sed -i 's/^\(log_error\s.*\)/# \1/' /etc/mysql/my.cnf

# Percona service
RUN mkdir /etc/service/mysql && \
    echo "#!/bin/bash"  > /etc/service/mysql/run && \
    echo "mysqld_safe" >> /etc/service/mysql/run && \
    chmod +x /etc/service/mysql/run

# Define mountable directories.
VOLUME ["/etc/mysql", "/var/lib/mysql"]

# Define working directory.
WORKDIR /data

# Expose ports.
EXPOSE 3306