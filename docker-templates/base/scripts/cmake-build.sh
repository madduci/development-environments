#!/bin/bash
mkdir -p /build/build
cd /build/build
cmake "$@" .. 
make
make install