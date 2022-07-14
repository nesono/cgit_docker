FROM ubuntu:22.04

# refresh the system
RUN apt-get update && apt-get -y dist-upgrade
# get rid of warning messages when installing new packages
RUN apt-get install -y apt-utils 

# special case for tzdata to avoid interactive shell
COPY install_tzdata_noninteractive.sh /usr/local/bin/
RUN /usr/local/bin/install_tzdata_noninteractive.sh

# install the OSS parts
RUN apt-get install -y nginx cgit python3-pygments fcgiwrap php-cgi

COPY nginx.conf /etc/nginx/conf.d/cgit.conf
COPY fastcgi.conf /etc/nginx/fastcgi.conf
COPY start_fcgi.sh /usr/local/bin/

# nginx is serving at port 80
EXPOSE 80
