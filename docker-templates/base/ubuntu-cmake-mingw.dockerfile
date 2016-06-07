FROM ubuntu:xenial
MAINTAINER Michele Adduci <info@micheleadduci.net>

ENV CMAKE_C_COMPILER   /usr/bin/clang-3.8
ENV CMAKE_CXX_COMPILER /usr/bin/clang++-3.8 

COPY ./scripts/cmake-build.sh /build.sh

VOLUME ["/build"]

CMD exec /build.sh

#Set clang repository
RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install gcc-mingw-w64 g++-mingw-w64 cmake -y  && \
    apt-get clean autoclean && \
    apt-get autoremove -y && \
    chmod +x /build.sh