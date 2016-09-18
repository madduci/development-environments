# Docker Java Templates

Ubuntu-based Docker image to build Java projects with maven and Oracle JDK8

To run this image (and to build your project), you can simply run:

`docker run -v /path/to/folder/with/pom.xml/:/project madduci/ubuntu-maven-jdk8`

and it will create a subfolder called **target** where all the maven-related files and the final *.jar / *.war will be archived.

Optionally, also the maven repository folder could be mounted on host (available at /root/.m2/repository)