# Docker Base Templates

## List of Templates
1. [alpine-cmake-gcc](#alpine-cmake-gcc)
2. [ubuntu-cmake-gcc](#ubuntu-cmake-gcc)
3. [ubuntu-cmake-clang](#ubuntu-cmake-clang)
4. [ubuntu-cmake-mingw](#ubuntu-cmake-mingw)
5. [ubuntu-maven-jdk8](#ubuntu-maven-jdk8)

## alpine-cmake-gcc

Alpine-based Docker minimal image to build C/C++ projects with cmake and gcc 5

To run this image (and to build your project), you can simply run:

	docker run -v /path/to/folder/with/CMakeLists/:/project madduci/alpine-cmake-gcc

and it will create a subfolder called **build/** where all the CMake-generated files will be stored and then it will perform the following commands: 

	cmake ..
	cmake --build .

to compile your project

## ubuntu-cmake-gcc

Ubuntu-based Docker image to build C/C++ projects with cmake and gcc 5

To run this image (and to build your project), you can simply run:

	docker run -v /path/to/folder/with/CMakeLists/:/project madduci/ubuntu-cmake-gcc

and it will create a subfolder called **build/** where all the CMake-generated files will be stored and then it will perform the following commands: 

	cmake ..
	cmake --build .

to compile your project

## ubuntu-cmake-clang

Ubuntu-based Docker image to build C/C++ projects with cmake and clang 3.8

To run this image (and to build your project), you can simply run:

	docker run -v /path/to/folder/with/CMakeLists/:/project madduci/ubuntu-cmake-clang

and it will create a subfolder called **build/** where all the CMake-generated files will be stored and then it will perform the following commands: 

	cmake ..
	cmake --build .

to compile your project

## ubuntu-cmake-mingw

Ubuntu-based Docker image to build C/C++ projects with cmake and MinGW 5 and target Windows platform

To run this image (and to build your project), you can simply run:

	docker run -v /path/to/folder/with/CMakeLists/:/project madduci/ubuntu-cmake-mingw

and it will create a subfolder called **build/** where all the CMake-generated files will be stored and then it will perform the following commands: 

	cmake ..
	cmake --build .

to compile your project

## ubuntu-maven-jdk8

Ubuntu-based Docker image to build Java projects with maven and Oracle JDK8

To run this image (and to build your project), you can simply run:

	docker run -v /path/to/folder/with/pom.xml/:/project madduci/ubuntu-maven-jdk8

and it will create a subfolder called **target** where all the maven-related files and the final *.jar / *.war will be archived.

Optionally, also the maven repository folder could be mounted on host (/root/.m2/repository)