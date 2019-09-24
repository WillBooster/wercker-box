FROM alpine:latest
MAINTAINER Kazunori Sakamoto

ENV TZ=Asia/Tokyo

RUN apk add --no-cache maven openjdk11-jdk python2 \
    build-base g++ cairo-dev libjpeg-turbo-dev pango-dev giflib-dev \
    && apk add yarn --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main
