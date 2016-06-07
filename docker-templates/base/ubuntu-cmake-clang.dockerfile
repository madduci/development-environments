FROM ubuntu:xenial
MAINTAINER Michele Adduci <info@micheleadduci.net>

#Set clang repository
RUN echo "deb http://llvm.org/apt/xenial/ llvm-toolchain-xenial-3.8 main" >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get install wget -y && \
    wget -O - http://llvm.org/apt/llvm-snapshot.gpg.key | apt-key add - && \
    apt-get dist-upgrade -y && \
    apt-get install clang-3.8 libclang-3.8-dev llvm-3.8-dev lldb-3.8-dev cmake -y  && \
    apt-get clean autoclean && \
    apt-get autoremove -y && \
    chmod +x /build.sh

VOLUME ["/build"]

ADD ./scripts/cmake-build.sh /build.sh
ADD ./cmake_toolchains/clang.cmake /clang.cmake

CMD exec /build.sh -DCMAKE_TOOLCHAIN_FILE=/clang.cmake