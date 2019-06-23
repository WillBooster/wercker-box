FROM alpine:latest
MAINTAINER Kazunori Sakamoto

ENV TZ=Asia/Tokyo

RUN apk add --no-cache maven openjdk11-jdk yarn
