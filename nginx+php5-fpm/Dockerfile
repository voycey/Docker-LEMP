FROM phusion/baseimage:0.9.16
MAINTAINER Dan Voyce <hello@danielvoyce.com>

ENV HOME /root

# Let the conatiner know that there is no tty
ENV DEBIAN_FRONTEND noninteractive

RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

CMD ["/sbin/my_init"]

# Try and speed things up from Aus
RUN sed -i 's/archive.ubuntu.com/au.archive.ubuntu.com/' /etc/apt/sources.list

# Nginx-PHP Installation
RUN apt-get update
RUN apt-get install -y vim curl wget build-essential
RUN add-apt-repository -y ppa:nginx/stable
RUN apt-get update
RUN apt-get install -y --force-yes\
 python-setuptools\
 php5-cli=5.5.9+dfsg-1ubuntu4.6\
 php5-fpm=5.5.9+dfsg-1ubuntu4.6\ 
 php5-mysql=5.5.9+dfsg-1ubuntu4.6\
 php5-curl=5.5.9+dfsg-1ubuntu4.6\
 php5-gd=5.5.9+dfsg-1ubuntu4.6\ 
 php5-tidy=5.5.9+dfsg-1ubuntu4.6\
 php5-intl=5.5.9+dfsg-1ubuntu4.6\
 php5-imap=5.4.6-0ubuntu5\
 php5-mcrypt=5.4.6-0ubuntu5

RUN sed -i "s/;date.timezone =.*/date.timezone = UTC/" /etc/php5/fpm/php.ini
RUN sed -i "s/;date.timezone =.*/date.timezone = UTC/" /etc/php5/cli/php.ini

RUN apt-get install -y nginx

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Tweak NGINX
RUN sed -i -e "s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php5/fpm/php-fpm.conf
RUN sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php5/fpm/php.ini

# Tweak FPM
RUN sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php5/fpm/php.ini
RUN sed -i -e "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g" /etc/php5/fpm/php.ini
RUN sed -i -e "s/upload_max_filesize\s*=\s*2M/upload_max_filesize = 100M/g" /etc/php5/fpm/php.ini
RUN sed -i -e "s/post_max_size\s*=\s*8M/post_max_size = 100M/g" /etc/php5/fpm/php.ini


RUN mkdir -p        	/var/www
ADD config/default  	/etc/nginx/sites-available/default
RUN mkdir           	/etc/service/nginx
ADD config/nginx.sh 	/etc/service/nginx/run
RUN chmod +x        	/etc/service/nginx/run
RUN mkdir           	/etc/service/phpfpm
ADD config/phpfpm.sh 	/etc/service/phpfpm/run
RUN chmod +x        	/etc/service/phpfpm/run

EXPOSE 80
# End Nginx-PHP
# Open a shell

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
