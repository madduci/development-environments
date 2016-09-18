# Docker Base Templates

## List of Templates
1. [alpine-asciidoctor-pdf](#alpine-asciidoctor-pdf)
2. [alpine-github-pages](#alpine-github-pages)
3. [alpine-gcc-opencv](#alpine-gcc-opencv)
4. [ubuntu-gcc-opencv](#ubuntu-gcc-opencv)
5. [ubuntu-tomcat-jdk8](#ubuntu-tomcat-jdk8)

## alpine-asciidoctor-pdf

Docker Image exposing `asciidoctor-pdf` as entrypoint and `/document` as mounted volume where to build the file

To build your own documents as PDF, simply run the container as:

`docker run --rm -v /path/to/your/document/folder/:/document/ madduci/docker-alpine-asciidoctor-pdf:1.0 /document/your_document.adoc`

If you want to use some custom styles, just run it as

`docker run --rm -v /path/to/your/document/folder/:/document/ madduci/docker-alpine-asciidoctor-pdf:1.0 -a pdf-stylesdir=/document/resources/themes -a pdf-style=your_style -a pdf-fontsdir=/document/resources/fonts /document/your_document.adoc`

## alpine-github-pages

GitHub-Pages Docker container, powered by Alpine Linux and Jekyll 3.0 installed via the [github-pages gem](https://github.com/github/pages-gem).

Based on [andredumas/github-pages](https://github.com/andredumas/docker-github-pages) project, optimized to fetch latest packages and make it lighter

To run this image (and to build your pages), you can simply run:

```
docker run --rm -it -p 4000:4000 -v /mysite:/site madduci/docker-github-pages serve --watch --force_polling --host 0.0.0.0
```

### Warning

By default, Jekyll will run on 127.0.0.1 (default gem configuration): this will make jekyll unreachable from outside the docker container. 

To override this behaviour, just give the extra `--host X.X.X.X` parameter to serve the specific IP.

## alpine-gcc-opencv

## ubuntu-gcc-opencv

## ubuntu-tomcat-jdk8