FROM madduci/docker-ubuntu-cpp:gcc-5.3
MAINTAINER Michele Adduci <info@micheleadduci.net>

COPY ./scripts/ubuntu_opencv.sh /opencv.sh

RUN chmod +x /opencv.sh && sh /opencv.sh 