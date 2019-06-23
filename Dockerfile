FROM alpine:latest
MAINTAINER Kazunori Sakamoto

ENV TZ=Asia/Tokyo

RUN apk add --no-cache yarn
