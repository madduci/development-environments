FROM ubuntu:xenial
MAINTAINER Michele Adduci <info@micheleadduci.net>

RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee /etc/apt/sources.list.d/webupd8team-java.list && \
	  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 && \
	  apt-get update && \
    apt-get dist-upgrade -y && \
    echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
    apt-get install -y maven oracle-java7-installer && \
    apt-get clean autoclean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* && \
  	rm -rf /var/cache/oracle-jdk7-installer

VOLUME ["/build", "/root/.m2/repository"]

ENV JAVA_HOME /usr/lib/jvm/java-7-oracle

WORKDIR /build

ENTRYPOINT mvn -e clean install