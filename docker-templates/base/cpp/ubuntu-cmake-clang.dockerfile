FROM ubuntu:16.10
MAINTAINER Michele Adduci <info@micheleadduci.net>

VOLUME ["/project"]
WORKDIR ["/project"]

RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install cmake clang-3.9 -y  && \
    apt-get clean autoclean && \
    apt-get autoremove -y

ADD ./scripts/cmake-build.sh /build.sh
ADD ./cmake_toolchains/clang.cmake /clang.cmake

RUN chmod +x /build.sh

ENTRYPOINT exec /build.sh -DCMAKE_TOOLCHAIN_FILE=/clang.cmake