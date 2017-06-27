FROM ubuntu:17.04
MAINTAINER Michele Adduci <info@micheleadduci.net>

VOLUME ["/project"]
WORKDIR ["/project"]

RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install cmake clang-3.9 -y  && \
    apt-get clean autoclean && \
    apt-get autoremove -y
    
RUN update-alternatives --install /usr/bin/clang clang /usr/bin/clang-3.9 100 \
    --slave /usr/bin/clang++ clang++ /usr/bin/clang++-3.9 \
    --slave /usr/bin/clang-check clang-check /usr/bin/clang-check-3.9 \
    --slave /usr/bin/clang-query clang-query /usr/bin/clang-query-3.9 \
    --slave /usr/bin/clang-rename clang-rename /usr/bin/clang-rename-3.9 \
    --slave /usr/bin/clang-tblgen clang-tblgen /usr/bin/clang-tblgen-3.9

ADD ./scripts/cmake-build.sh /build.sh
ADD ./cmake_toolchains/clang.cmake /clang.cmake

RUN chmod +x /build.sh

ENTRYPOINT exec /build.sh -DCMAKE_TOOLCHAIN_FILE=/clang.cmake
