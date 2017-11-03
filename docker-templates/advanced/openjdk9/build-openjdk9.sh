#!/bin/bash

# Required by OpenJFX 9
echo "deb http://ppa.launchpad.net/ubuntu-toolchain-r/test/ubuntu trusty main" >> /etc/apt/sources.list
apt-get install gcc-4.9-multilib g++-4.9-multilib -y


export _JAVA_OPTIONS="-Dsun.reflect.debugModuleAccessChecks=true --add-opens=java.base/sun.reflect.misc=ALL-UNNAMED --add-opens=java.base/sun.util.logging=ALL-UNNAMED --add-opens=java.base/java.lang=ALL-UNNAMED --add-opens=java.base/java.util=ALL-UNNAMED --add-opens=java.base/java.lang.invoke=ALL-UNNAMED --add-opens=java.base/java.io=ALL-UNNAMED --add-opens=java.base/java.util.concurrent=ALL-UNNAMED --add-opens=java.base/java.text=ALL-UNNAMED"

cd /build
hg clone http://hg.openjdk.java.net/jdk9/jdk9 openjdk9
cd openjdk9
sh ./get_source.sh
bash ./configure --with-cacerts-file=/etc/ssl/certs/java/cacerts --with-boot-jdk=/opt/jdk1.8.0_151 --with-target-bits=32 --with-import-modules=/build/jfx9/build/modular-sdk --disable-warnings-as-errors --with-native-debug-symbols=none --enable-ccache
make clean images
cp -a build/linux-x86_64-normal-server-release/images/jdk /opt/openjdk9
find /opt/openjdk9 -type f -exec chmod a+r {} +
find /opt/openjdk9 -type d -exec chmod a+rx {} +