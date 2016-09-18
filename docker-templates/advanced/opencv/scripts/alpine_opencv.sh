#!/bin/sh
echo "Downloading OpenCV 3.1.0...."
mkdir -p /opt && cd /opt 
curl --progress-bar -L https://github.com/Itseez/opencv/archive/3.1.0.zip -o opencv.zip 
unzip opencv.zip && rm opencv.zip

echo "Downloading OpenCV 3.1.0 contrib package...."
curl --progress-bar -L https://github.com/Itseez/opencv_contrib/archive/3.1.0.zip -o opencv_contrib.zip
unzip opencv_contrib.zip && rm opencv_contrib.zip
mv opencv_contrib-3.1.0 /opt/opencv-3.1.0/modules/contrib

echo "Building OpenCV..."
mkdir /opt/opencv-3.1.0/build && cd /opt/opencv-3.1.0/build/ 
#C++ flag fix for gcc5 in Alpine Linux
cmake -DCMAKE_CXX_FLAGS_RELEASE="-O2" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local -DOPENCV_EXTRA_MODULES_PATH=/opt/opencv-3.1.0/modules/contrib/modules -DWITH_IPP=NO -DWITH_OPENEXR=NO /opt/opencv-3.1.0/	
make -j2 && make install

echo "OpenCV Build completed, removing source code"
rm -rf /opt/opencv-3.1.0