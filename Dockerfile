FROM alpine:latest
MAINTAINER Kazunori Sakamoto

ENV TZ=Asia/Tokyo

RUN apk update && apk add --no-cache maven openjdk11-jdk python2 yarn \
    build-base g++ cairo-dev libjpeg-turbo-dev pango-dev giflib-dev
