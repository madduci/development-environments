#!/bin/sh
echo "Installing basic tools"
apt-get install curl unzip -y

echo "Installing OpenCV dependencies"
apt-get install libavutil-dev libavformat-dev libavcodec-dev libavfilter-dev x264 libx264-dev -y
apt-get install libxvidcore-dev yasm -y
apt-get install libgstreamer0.10-0 libgstreamer0.10-dev gstreamer0.10-tools gstreamer0.10-plugins-base libgstreamer-plugins-base0.10-dev gstreamer0.10-plugins-good gstreamer0.10-plugins-ugly gstreamer0.10-plugins-bad -y
apt-get install libtiff5-dev libjpeg-dev libjasper-dev libusb-dev libusb-1.0-0-dev -y
    
echo "Downloading OpenCV 3.1.0...."
cd /opt 
curl --progress-bar -L https://github.com/Itseez/opencv/archive/3.1.0.zip -o opencv.zip 
unzip opencv.zip && rm opencv.zip

echo "Downloading OpenCV 3.1.0 contrib package...."
curl --progress-bar -L https://github.com/Itseez/opencv_contrib/archive/3.1.0.zip -o opencv_contrib.zip
unzip opencv_contrib.zip && rm opencv_contrib.zip
mv opencv_contrib-3.1.0 /opt/opencv-3.1.0/modules/contrib

echo "Building OpenCV..."
mkdir /opt/opencv-3.1.0/build && cd /opt/opencv-3.1.0/build/ 
#C++ flag fix for gcc5 in Alpine Linux
cmake -DCMAKE_CXX_FLAGS_RELEASE="-O2" -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=/usr/local -DOPENCV_EXTRA_MODULES_PATH=/opt/opencv-3.1.0/modules/contrib/modules -DWITH_IPP=NO -DWITH_OPENEXR=NO /opt/opencv-3.1.0/	
make -j2 && make install

echo "OpenCV Build completed, removing source code"
rm -rf /opt/opencv-3.1.0

apt-get remove --purge curl unzip -y && apt-get clean autoclean && apt-get autoremove -y
