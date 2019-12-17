FROM alpine:latest
MAINTAINER Kazunori Sakamoto

ENV TZ Asia/Tokyo
ENV CONFIGURE_OPTS --disable-install-doc

RUN GLIBC_PKG_VERSION="${GLIBC_PKG_VERSION:-2.30-r0}" \
    && GLIBC_URL="https://github.com/sgerrand/alpine-pkg-glibc/releases/download/$GLIBC_PKG_VERSION" \
    && GLIBC_SSH_KEY="/etc/apk/keys/sgerrand.rsa.pub" \
    && GLIBC_PKG_FILE="glibc-$GLIBC_PKG_VERSION.apk" \
    && GLIBC_BIN_PKG_FILE="glibc-bin-$GLIBC_PKG_VERSION.apk" \
    && apk add --no-cache --virtual=.fetchdeps wget ca-certificates \
    && wget -q -O "$GLIBC_SSH_KEY" "https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub" \
    && wget -q "$GLIBC_URL/$GLIBC_PKG_FILE" "$GLIBC_URL/$GLIBC_BIN_PKG_FILE" \
    && apk add --no-cache "$GLIBC_PKG_FILE" "$GLIBC_BIN_PKG_FILE" \
    && apk del .fetchdeps \
    && rm "$GLIBC_SSH_KEY" \
    && rm ~/.wget-hsts \
    && rm "$GLIBC_PKG_FILE" "$GLIBC_BIN_PKG_FILE"

RUN apk update && apk add --no-cache maven \
    bash \
    binutils-gold \
    build-base \
    cairo-dev \
    curl \
    g++ \
    giflib-dev \
    git \
    libjpeg-turbo-dev \
    linux-headers \
    openjdk11-jdk \
    openssl \
    openssl-dev \
    pango-dev \
    python2 \
    python2-dev \
    readline-dev \
    wget \
    yarn \
    zlib-dev

RUN echo $HOME
ENV PATH $HOME/.anyenv/bin:$PATH

RUN git clone --depth 1 https://github.com/anyenv/anyenv ~/.anyenv && ~/.anyenv/bin/anyenv init
RUN echo 'eval "$(anyenv init -)"' >> /etc/profile.d/anyenv.sh