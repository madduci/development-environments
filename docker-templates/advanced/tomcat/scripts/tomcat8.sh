#!/bin/bash

#Install cURL first
apt-get update && apt-get install curl -y

#Set default Tomcat version
TOMCAT_VERSION=8.0.41

#detect if a defined version of tomcat was specified
if [ ! -z "$1" ]; then
    TOMCAT_VERSION=$1
fi

cd /tmp
curl -o tomcat.tar.gz -L http://artfiles.org/apache.org/tomcat/tomcat-8/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz

mkdir -p /opt/tomcat

tar -xzf tomcat.tar.gz -C /opt/tomcat --strip-components=1
rm -rf /opt/tomcat/webapps/*

#Clean /tmp folder
rm -rf /tmp/tomcat.tar.gz

apt-get remove --purge curl -y && apt-get autoremove -y && rm -rf /var/lib/apt/lists/*