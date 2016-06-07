FROM ubuntu:xenial
MAINTAINER Michele Adduci <info@micheleadduci.net>

# Setup environment
ENV DEBIAN_FRONTEND noninteractive

# Update sources
RUN apt-get update -y && \
	apt-get dist-upgrade -y && \
	apt-get install -y apache2 vim bash-completion unzip \ 
		mysql-client mysql-server php 
RUN apt-get install -y php-mysql php-dev php-gd \
		php-memcache php-pspell php libapache2-mod-php php-cli && \
	service apache2 start && \
	service mysql start

EXPOSE 22 80 443

ENTRYPOINT ["/bin/bash"]

VOLUME ["/var/www/html"]