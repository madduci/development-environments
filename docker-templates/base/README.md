# Docker Base Templates

## List of Templates
1. [ubuntu-cmake-gcc](#ubuntu-cmake-gcc)
2. [ubuntu-cmake-clang](#ubuntu-cmake-clang)
3. [ubuntu-cmake-mingw](#ubuntu-cmake-mingw)
4. [ubuntu-maven-jdk7](#ubuntu-maven-jdk7)
4. [ubuntu-maven-jdk8](#ubuntu-maven-jdk8)

## ubuntu-cmake-gcc

Ubuntu-based Docker image to build C/C++ projects with cmake and gcc 5

To run this image (and to build your project), you can simply run:

	docker run -v /path/to/folder/with/CMakeLists/:/build madduci/ubuntu-cmake-gcc

and it will create a subfolder called **build/** where all the CMake-generated files will be stored and then it will perform the following commands: 

	make
	make install

to generate binaries and install them

## ubuntu-cmake-clang

Ubuntu-based Docker image to build C/C++ projects with cmake and clang 3.8

To run this image (and to build your project), you can simply run:

	docker run -v /path/to/folder/with/CMakeLists/:/build madduci/ubuntu-cmake-clang

and it will create a subfolder called **build/** where all the CMake-generated files will be stored and then it will perform the following commands: 

	make
	make install

to generate binaries and install them

## ubuntu-cmake-mingw

Ubuntu-based Docker image to build C/C++ projects with cmake and MinGW 5 and target Windows platform

To run this image (and to build your project), you can simply run:

	docker run -v /path/to/folder/with/CMakeLists/:/build madduci/ubuntu-cmake-mingw

and it will create a subfolder called **build/** where all the CMake-generated files will be stored and then it will perform the following commands: 

	make
	make install

to generate binaries and install them

## ubuntu-maven-jdk7

Ubuntu-based Docker image to build Java projects with maven and Oracle JDK7

To run this image (and to build your project), you can simply run:

	docker run -v /path/to/folder/with/pom.xml/:/build madduci/ubuntu-maven-jdk7

and it will create a subfolder called **target** where all the maven-related files and the final *.jar / *.war will be archived.

Optionally, also the maven repository folder could be mounted on host (/root/.m2/repository)

## ubuntu-maven-jdk8

Ubuntu-based Docker image to build Java projects with maven and Oracle JDK8

To run this image (and to build your project), you can simply run:

	docker run -v /path/to/folder/with/pom.xml/:/build madduci/ubuntu-maven-jdk8

and it will create a subfolder called **target** where all the maven-related files and the final *.jar / *.war will be archived.

Optionally, also the maven repository folder could be mounted on host (/root/.m2/repository)