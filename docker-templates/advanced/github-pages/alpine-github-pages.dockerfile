FROM alpine:3.4
MAINTAINER Michele Adduci <info@micheleadduci.net>

VOLUME /site

EXPOSE 4000

WORKDIR /site

RUN apk update && \
    apk --update add \
        gcc \
        g++ \
        make \
        curl \
        bison \
        nodejs \
        tzdata \
        ruby \
        ruby-rdoc \
        ruby-irb \
        ruby-bundler \
        ruby-dev \
    	glib-dev \
        libc-dev \
        libffi-dev \
        libxslt-dev && \
    echo 'gem: --no-document' > /etc/gemrc && \
    gem install --no-ri --no-rdoc jekyll && \
    gem install --no-ri --no-rdoc rouge && \
    gem install --no-ri --no-rdoc nokogiri && \
    gem install --no-ri --no-rdoc octopress && \
    gem install --no-ri --no-rdoc github-pages && \
    gem install --no-ri --no-rdoc jekyll-gist && \
    gem install --no-ri --no-rdoc jekyll-watch && \
    bundle clean --force && \
    apk del gcc g++ make curl && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["jekyll"]
