=================================================
After software installation
=================================================
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

=================================================
Docker on build process, include all files on directory build (include .git with old build)
Solution for reduce size of docker image (but for reuse is not good solution)
=================================================
File : .dockerignore
.bundle
.git
log
tmp
vendor

=================================================
Compress docker image
=================================================
ID=$(docker run -d image-name /bin/bash)
(docker export $ID | gzip -c > image.tgz)
gzip -dc image.tgz | docker import - flat-image-name

