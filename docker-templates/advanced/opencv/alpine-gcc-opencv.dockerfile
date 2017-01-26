FROM madduci/docker-alpine-cpp:gcc-6
MAINTAINER Michele Adduci <info@micheleadduci.net>

ADD ./scripts/alpine_opencv.sh /opencv.sh

RUN apk update && \
    apk --update add \
        ffmpeg-dev \
        x264-dev \
        curl \
        unzip \
        gsl \
        yasm \
        libavc1394-dev  \
        libdc1394-dev \
        libusb-dev \
        libjpeg \
        libjpeg-turbo-dev \
        libpng-dev \
        libjasper \
        tiff-dev \
        libwebp-dev \
        linux-headers

RUN chmod +x /opencv.sh && \
    exec /opencv.sh && \ 
    apk del curl unzip && \
    rm -rf /var/cache/apk/* && \
    rm /opencv.sh
