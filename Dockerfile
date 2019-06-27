FROM alpine:latest
MAINTAINER Kazunori Sakamoto

ENV TZ=Asia/Tokyo

RUN apk add --no-cache alpine-sdk maven openjdk11-jdk python2 yarn
