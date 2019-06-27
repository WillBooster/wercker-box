FROM alpine:latest
MAINTAINER Kazunori Sakamoto

ENV TZ=Asia/Tokyo

RUN apk add --no-cache alpine-sdk maven openjdk11-jdk python2 yarn \
  && apk add --no-cache --virtual .build-deps git build-base g++ \
  && apk add --no-cache --virtual .npm-deps cairo-dev libjpeg-turbo-dev pango \
  && npm install -g canvas
