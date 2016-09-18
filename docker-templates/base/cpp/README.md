# Docker C++ Templates

The C++ images are based on Ubuntu and Alpine Linux, using different compilers:

* gcc
* mingw
* clang

At the moment, only gcc is offered for Alpine Linux.

## How to run the images

All the images can be run as follows:

`docker run -v /path/to/folder/with/CMakeLists/:/project [image_name]`

and it will create a subfolder called **build/** where all the CMake-generated files will be stored and then it will perform the following commands: 

`cmake ..`
`cmake --build .`

to compile your project.

The following images are available:

## madduci/docker-alpine-cpp

Alpine-based Docker minimal image to build C/C++ projects with cmake and gcc 5

## madduci/docker-ubuntu-cpp:gcc-5.3

Ubuntu-based Docker image to build C/C++ projects with cmake and gcc 5

## madduci/docker-ubuntu-cpp:mingw-5.3

Ubuntu-based Docker image to build C/C++ projects with cmake and MinGW 5 and target Windows platform

## madduci/docker-ubuntu-cpp:clang-3.8

Ubuntu-based Docker image to build C/C++ projects with cmake and clang 3.8