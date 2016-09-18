# alpine-asciidoctor-pdf

Docker Image exposing `asciidoctor-pdf` as entrypoint and `/document` as mounted volume where to build the file

To build your own documents as PDF, simply run the container as:

`docker run --rm -v /path/to/your/document/folder/:/document/ madduci/docker-asciidoctor-pdf /document/your_document.adoc`

If you want to use some custom styles, just run it as

`docker run --rm -v /path/to/your/document/folder/:/document/ madduci/docker-asciidoctor-pdf -a pdf-stylesdir=/document/resources/themes -a pdf-style=your_style -a pdf-fontsdir=/document/resources/fonts /document/your_document.adoc`

and it will generate the pdf in the mounted volume _/document_
