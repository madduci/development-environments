FROM ubuntu:17.04
MAINTAINER Michele Adduci <info@micheleadduci.net>

ENV JDK_VERSION_MAJOR=9 \
    JDK_VERSION_MINOR=181 \
    MAVEN_VERSION=3.5.0 \
    ANT_VERSION=1.10.1 \
    CMAKE_VERSION=3.9 \
    CMAKE_VERSION_EXTENDED=3.9.1 \
    JAVA_HOME=/opt/jdk-9 \
    JDK_HOME=/opt/jdk-9

VOLUME  ["/project"]
WORKDIR "/project"

RUN  adduser --disabled-password --gecos '' builder \
  && apt-get update \
  && apt-get install -y \
            curl \
            build-essential \
            python3 \
            mono-devel \
            rpm \
            rpmlint \
            lintian \
  && echo "Setting Java" \
  && curl -o /tmp/jdk.tar.gz -L http://download.java.net/java/jdk${JDK_VERSION_MAJOR}/archive/${JDK_VERSION_MINOR}/binaries/jdk-${JDK_VERSION_MAJOR}+${JDK_VERSION_MINOR}_linux-x64_bin.tar.gz \
  && tar -xzf /tmp/jdk.tar.gz -C /opt/ \
  && update-alternatives --install /usr/bin/java java /opt/jdk-${JDK_VERSION_MAJOR}/bin/java 1 \
  && update-alternatives --install /usr/bin/jlink jlink /opt/jdk-${JDK_VERSION_MAJOR}/bin/jlink 1 \
  && update-alternatives --install /usr/bin/javapackager javapackager /opt/jdk-${JDK_VERSION_MAJOR}/bin/javapackager 1 \
  && echo "Setting Maven" \
  && curl -o /tmp/maven.tar.gz -L http://mirror.synyx.de/apache/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz \
  && tar -xzf /tmp/maven.tar.gz -C /opt/ \
  && update-alternatives --install /usr/bin/mvn mvn /opt/apache-maven-${MAVEN_VERSION}/bin/mvn 1 \
  && echo "Setting Ant" \
  && curl -o /tmp/ant.tar.gz -L http://mirror.23media.de/apache/ant/binaries/apache-ant-${ANT_VERSION}-bin.tar.gz \
  && tar -xzf /tmp/ant.tar.gz -C /opt/ \
  && update-alternatives --install /usr/bin/ant ant /opt/apache-ant-${ANT_VERSION}/bin/ant 1 \
  && echo "Setting CMake" \
  && curl -o /tmp/cmake.tar.gz -L https://cmake.org/files/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION_EXTENDED}-Linux-x86_64.tar.gz \
  && tar -xzf /tmp/cmake.tar.gz -C /opt/ \
  && update-alternatives --install /usr/bin/cmake cmake /opt/cmake-${CMAKE_VERSION_EXTENDED}-Linux-x86_64/bin/cmake 1 \
  && update-alternatives --install /usr/bin/ctest ctest /opt/cmake-${CMAKE_VERSION_EXTENDED}-Linux-x86_64/bin/ctest 1 \
  && update-alternatives --install /usr/bin/cpack cpack /opt/cmake-${CMAKE_VERSION_EXTENDED}-Linux-x86_64/bin/cpack 1 \
  && echo "Setting Python" \
  && update-alternatives --install /usr/bin/python python /usr/bin/python3 1 \
  && apt-get clean \
  && apt-get autoclean \
  && rm -rf /var/cache/* \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /tmp \
  && rm -rf /var/tmp/*

USER builder

ENTRYPOINT ["mvn"]