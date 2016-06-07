FROM ubuntu:xenial
MAINTAINER Michele Adduci <info@micheleadduci.net>

COPY ./scripts/cmake-build.sh /build.sh

VOLUME ["/build"]

CMD exec /build.sh

#Set clang repository
RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install gcc-multilib g++-multilib cmake -y  && \
    apt-get clean autoclean && \
    apt-get autoremove -y && \
    chmod +x /build.sh