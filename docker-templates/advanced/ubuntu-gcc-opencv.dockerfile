FROM madduci/ubuntu-cmake-gcc
MAINTAINER Michele Adduci <info@micheleadduci.net>

COPY ./scripts/opencv.sh /opencv.sh

RUN chmod +x /opencv.sh && sh /opencv.sh 