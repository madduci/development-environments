#!/bin/bash

WORKDIR=/build
mkdir -p $WORKDIR

#########################################
# Download OpenJDK and OpenJFX projects
#########################################

hg clone http://hg.openjdk.java.net/openjfx/9-dev/rt $WORKDIR/jfx9
hg clone http://hg.openjdk.java.net/jdk9/jdk9 $WORKDIR/jdk9

#########################################
# Build OpenJFX 9 with Oracle JDK 9
#########################################

# Required by Gradle 3.1 to build OpenJFX 9
export _JAVA_OPTIONS="-Dsun.reflect.debugModuleAccessChecks=true --add-opens=java.base/sun.reflect.misc=ALL-UNNAMED --add-opens=java.base/sun.util.logging=ALL-UNNAMED --add-opens=java.base/java.lang=ALL-UNNAMED --add-opens=java.base/java.util=ALL-UNNAMED --add-opens=java.base/java.lang.invoke=ALL-UNNAMED --add-opens=java.base/java.io=ALL-UNNAMED --add-opens=java.base/java.util.concurrent=ALL-UNNAMED --add-opens=java.base/java.text=ALL-UNNAMED"
cd $WORKDIR/jfx9
# Apply patch to disable errors on compiler warnings, libs and enable 32 Bit compile
patch -p1 < openjfx.patch
gradle

#####################################################################
# Build OpenJDK 9 with Oracle JDK 8 and previously built OpenJFX 9
#####################################################################

# Unset options defined above for OpenJFX
export -n _JAVA_OPTIONS
cd $WORKDIR/jdk9
sh ./get_source.sh
# Apply patch to disable errors on compiler warnings
patch -p1 < openjdk.patch
bash ./configure --with-cacerts-file=/etc/ssl/certs/java/cacerts --with-boot-jdk=/opt/jdk1.8.0_151 --with-target-bits=32 --with-import-modules=$WORKDIR/build/modular-sdk --disable-warnings-as-errors --with-native-debug-symbols=none --enable-ccache
make images
cp -a $WORKDIR/linux-x86_64-normal-server-release/images/jdk /opt/openjdk9
find /opt/openjdk9 -type f -exec chmod a+r {} +
find /opt/openjdk9 -type d -exec chmod a+rx {} +