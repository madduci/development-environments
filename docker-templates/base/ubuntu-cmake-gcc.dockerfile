FROM ubuntu:xenial
MAINTAINER Michele Adduci <info@micheleadduci.net>

VOLUME ["/build"]

ADD ./scripts/cmake-build.sh /build.sh

ENTRYPOINT exec /build.sh

RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install gcc-multilib g++-multilib cmake -y  && \
    apt-get clean autoclean && \
    apt-get autoremove -y && \
    chmod +x /build.sh
