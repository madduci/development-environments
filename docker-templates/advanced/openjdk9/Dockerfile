FROM ubuntu:14.04.3
MAINTAINER Michele Adduci <info@micheleadduci.net>

ENV JDK_VERSION_MAJOR=8 \
    JDK_VERSION_MINOR=151 \
    JDK_VERSION_PATCH=b12 \
    JIGSAW_VERSION_MAJOR=9.0.1 \
    JIGSAW_VERSION_PATCH=11 \
    GRADLE_VERSION=3.1 \
    ANT_VERSION=1.10.1 \
    CMAKE_VERSION=3.9 \
    CMAKE_VERSION_EXTENDED=3.9.4

VOLUME /build

# Download all the required libraries (for 32 bit builds) and tools
RUN echo "Installing required packages" \
    && echo "deb http://ppa.launchpad.net/ubuntu-toolchain-r/test/ubuntu trusty main" >> /etc/apt/sources.list \
    && export DEBIAN_FRONTEND=noninteractive \
    && dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -qq -y --force-yes --no-install-recommends \
      libavcodec-dev:i386 \
      libavformat-dev:i386 \
      libasound2-dev:i386 \
      libcups2-dev:i386 \
      libdwarf-dev:i386 \
      libelf-dev:i386 \
      libfreetype6-dev:i386 \
      libgl1-mesa-dev:i386 \
      libgstreamer0.10-dev:i386 \
      libgstreamer-plugins-base0.10-dev:i386 \
      libgtk2.0-dev:i386 \
      libgtk-3-dev:i386 \
      libjpeg-dev:i386 \
      libnuma-dev:i386  \
      libspice-server1:i386 \
      libssl-dev:i386 \
      libssl1.0.0:i386 \
      libxt-dev:i386 \
      libx11-dev:i386 \
      libxext-dev:i386 \
      libxrender-dev:i386 \
      libxtst-dev:i386 \
      libpng-dev:i386 \
      libxml2-dev:i386 \
      libxslt1-dev:i386 \
      libxt-dev:i386 \
      libxxf86vm-dev:i386 \
      libudev-dev:i386 \
      x11proto-core-dev:i386 \
      x11proto-xf86vidmode-dev:i386 \
      pkg-config:i386 \
      autoconf \
      cpio \
      file \
      make \
      ccache \
      ksh \
      bison \
      flex \
      gperf \
      zip \
      realpath \
      unzip \
      git \
      mercurial \
      mercurial-common \
      python2.7-minimal \
      wget \
      curl \
      vim \
      ca-certificates-java \
      gcc-4.9-multilib \
      g++-4.9-multilib \
      ruby \
    && echo "Performing cleanup" \
    && apt-get -q clean -y \
    && apt-get autoclean \
    && rm -rf /var/cache/* \
    && rm -rf /var/lib/apt/lists/* \
    && rm -f /var/cache/apt/*.bin

RUN echo "Setting Oracle Java 8 (Required by OpenJDK9)" \
    && curl -o /tmp/jdk${JDK_VERSION_MAJOR}.tar.gz -L -b "oraclelicense=a" http://download.oracle.com/otn-pub/java/jdk/${JDK_VERSION_MAJOR}u${JDK_VERSION_MINOR}-${JDK_VERSION_PATCH}/e758a0de34e24606bca991d704f6dcbf/jdk-${JDK_VERSION_MAJOR}u${JDK_VERSION_MINOR}-linux-i586.tar.gz \
    && tar -xzf /tmp/jdk${JDK_VERSION_MAJOR}.tar.gz -C /opt/ \
    && echo "Setting Oracle Java 9 (Required by OpenJFX9)" \
    && curl -o /tmp/jdk${JIGSAW_VERSION_MAJOR}.tar.gz -L -b "oraclelicense=a" http://download.oracle.com/otn-pub/java/jdk/${JIGSAW_VERSION_MAJOR}+${JIGSAW_VERSION_PATCH}/jdk-${JIGSAW_VERSION_MAJOR}_linux-x64_bin.tar.gz \
    && tar -xzf /tmp/jdk${JIGSAW_VERSION_MAJOR}.tar.gz -C /opt/ \
    && update-alternatives --remove  java /usr/bin/java \
    && update-alternatives --install /usr/bin/java java /opt/jdk-${JIGSAW_VERSION_MAJOR}/bin/java 1 \
    && update-alternatives --install /usr/bin/jlink jlink /opt/jdk-${JIGSAW_VERSION_MAJOR}/bin/jlink 1 \
    && update-alternatives --install /usr/bin/javapackager javapackager /opt/jdk-${JIGSAW_VERSION_MAJOR}/bin/javapackager 1 \
    && echo "Installing Gradle" \
    && wget https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip \
    && unzip gradle-${GRADLE_VERSION}-bin.zip -d /opt \
    && rm gradle-${GRADLE_VERSION}-bin.zip \
    && update-alternatives --install /usr/bin/gradle gradle /opt/gradle-${GRADLE_VERSION}/bin/gradle 1 \
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
    && echo "Performing cleanup" \
    && rm -rf /tmp/*

WORKDIR /build