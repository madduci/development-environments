# alpine-hugo

Hugo Docker container, powered by Debian Linux and Hugo latest release available at [GitHub repository]https://github.com/spf13/hugo/releases).

To run this image (and to build your pages), you can simply run:

`docker run --rm -it -p 4000:4000 -v /mysite:/site madduci/docker-hugo serve --watch --force_polling --host 0.0.0.0`

Beware as entrypoint the application *jekyll* is exposed

### Warning

By default, Jekyll will run on 127.0.0.1 (default gem configuration): this will make jekyll unreachable from outside the docker container.

To override this behaviour, just give the extra `--host X.X.X.X` parameter to serve the specific IP.
