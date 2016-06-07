FROM ubuntu:xenial
MAINTAINER Michele Adduci <info@micheleadduci.net>

RUN apt-get update && \
    apt-get install gcc-multilib g++-multilib cmake -y  && \
    apt-get clean autoclean && \
    apt-get autoremove -y && \
    chmod +x /build.sh

VOLUME ["/build"]

ADD ./scripts/cmake-build.sh /build.sh

CMD exec /build.sh