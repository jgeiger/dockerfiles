FROM jgeiger/alpine
MAINTAINER jgeiger@gmail.com

ENV CONSUL_VERSION=0.6.3 \
    GLIBC_VERSION=2.23-r1
ENV CONSUL_FILE=consul_${CONSUL_VERSION}_linux_amd64.zip \
    GLIBC_FILE=glibc-${GLIBC_VERSION}.apk

VOLUME [ "/data", "/config" ]

RUN addgroup -S consul && adduser -S -G consul consul \
      && apk add --update \
      curl \
      openssl \
      && curl -Ls https://github.com/andyshinn/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/${GLIBC_FILE} > /tmp/${GLIBC_FILE} \
      && apk add --allow-untrusted /tmp/${GLIBC_FILE} \
      && curl -o $CONSUL_FILE -sSL https://releases.hashicorp.com/consul/$CONSUL_VERSION/$CONSUL_FILE \
      && unzip $CONSUL_FILE \
      && mv consul /usr/local/bin/ \
      && chmod +x /usr/local/bin/consul \
      && rm -f $CONSUL_FILE \
      && chown consul:consul /data \
      && chown consul:consul /config \
      && apk del \
      curl \
      && rm -rf /tmp/$GLIBC_FILE /var/cache/apk/*

WORKDIR /data

COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "tini", "--", "/entrypoint.sh"]

CMD [ "consul" ]
