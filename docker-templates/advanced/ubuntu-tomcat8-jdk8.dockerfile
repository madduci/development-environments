FROM ubuntu-maven-jdk8
MAINTAINER Michele Adduci <info@micheleadduci.net>

ARG tomcat_version

ADD ./scripts/tomcat8.sh /tmp/tomcat8.sh

RUN chmod +x /tmp/tomcat8.sh && \
    sh /tmp/tomcat8.sh $tomcat_version

EXPOSE 8080

#Exposed the webapps folder to be loaded from Tomcat
VOLUME ["/opt/tomcat/webapps", "/opt/tomcat/logs"]

ENTRYPOINT ["/opt/tomcat/bin/catalina.sh", "run"]