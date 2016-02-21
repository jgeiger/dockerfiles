FROM alpine:edge
MAINTAINER jgeiger@gmail.com

RUN apk add --update \
      tini \
      curl \
      bash \
        && curl -o /usr/local/bin/gosu -sSL "https://github.com/tianon/gosu/releases/download/1.7/gosu-amd64" \
        && chmod +x /usr/local/bin/gosu \
        && apk del curl \
        && rm -rf /var/cache/apk/* /usr/local/src/*

ENTRYPOINT ["tini", "--"]
