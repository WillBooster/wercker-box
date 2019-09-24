FROM alpine:latest
MAINTAINER Kazunori Sakamoto

ENV TZ=Asia/Tokyo

RUN apk update && apk add --no-cache maven openjdk11-jdk python2 \
    build-base g++ cairo-dev libjpeg-turbo-dev pango-dev giflib-dev \
    && apk add nodejs-current yarn --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
