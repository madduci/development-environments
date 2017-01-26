FROM madduci/docker-ubuntu-cpp:gcc-6
MAINTAINER Michele Adduci <info@micheleadduci.net>

COPY ./scripts/ubuntu_opencv.sh /opencv.sh

RUN chmod +x /opencv.sh && sh /opencv.sh 