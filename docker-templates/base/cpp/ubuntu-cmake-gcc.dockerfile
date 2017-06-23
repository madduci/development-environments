FROM ubuntu:17.04
MAINTAINER Michele Adduci <info@micheleadduci.net>

VOLUME ["/project"]
WORKDIR ["/project"]

RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install gcc-multilib g++-multilib cmake -y  && \
    apt-get clean autoclean && \
    apt-get autoremove -y

ADD ./scripts/cmake-build.sh /build.sh

RUN chmod +x /build.sh

ENTRYPOINT exec /build.sh
