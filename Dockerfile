FROM alpine:latest
MAINTAINER Kazunori Sakamoto

ENV TZ=Asia/Tokyo

RUN cat /etc/apk/repositories && apk update && apk add --no-cache maven openjdk11-jdk python2 \
    build-base g++ cairo-dev libjpeg-turbo-dev pango-dev giflib-dev \
    && apk update --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main \
    && apk add yarn --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main
