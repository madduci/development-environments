FROM ubuntu:xenial
MAINTAINER Michele Adduci <info@micheleadduci.net>

RUN apt-get update && \
    apt-get install gcc-mingw-w64 g++-mingw-w64 cmake -y  && \
    apt-get clean autoclean && \
    apt-get autoremove -y

VOLUME ["/build"]

ADD ./scripts/cmake-build.sh /build.sh
ADD ./cmake_toolchains/mingw.cmake /mingw.cmake

RUN chmod +x /build.sh

CMD exec /build.sh -DCMAKE_TOOLCHAIN_FILE=/mingw.cmake