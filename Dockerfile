FROM ruby:alpine
MAINTAINER Kazunori Sakamoto

ENV TZ=Asia/Tokyo

RUN apk update && apk add --no-cache maven \
    build-base \
    cairo-dev \
    giflib-dev \
    g++ \
    libjpeg-turbo-dev \
    openjdk11-jdk \
    pango-dev \
    python2 \
    yarn \
  && gem update --system \
  && gem install bundler
