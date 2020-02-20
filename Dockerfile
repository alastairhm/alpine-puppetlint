FROM ruby:alpine

VOLUME ["/blog"]
WORKDIR /blog
EXPOSE 80

RUN apk add --update \
  build-base \
  libxml2-dev \
  libxslt-dev && \
  rm -rf /var/cache/apk/* && \
  gem install puppet-lint && \
  mkdir -p /mnt

ENTRYPOINT ["puppet-lint"]
