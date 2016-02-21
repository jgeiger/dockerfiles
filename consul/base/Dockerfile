FROM jgeiger/alpine
MAINTAINER jgeiger@gmail.com

ENV CONSUL_VERSION 0.6.3
ENV CONSUL_FILE=consul_${CONSUL_VERSION}_linux_amd64.zip \
                GLIBC_FILE=glibc-2.21-r2.apk

VOLUME [ "/data", "/config" ]

RUN addgroup -S consul && adduser -S -G consul consul \
      && apk add --update \
      curl \
      openssl \
      && curl -Ls https://circle-artifacts.com/gh/andyshinn/alpine-pkg-glibc/6/artifacts/0/home/ubuntu/alpine-pkg-glibc/packages/x86_64/$GLIBC_FILE > /tmp/$GLIBC_FILE \
      && apk add --allow-untrusted /tmp/$GLIBC_FILE \
      && curl -o $CONSUL_FILE -sSL https://releases.hashicorp.com/consul/$CONSUL_VERSION/$CONSUL_FILE \
      && unzip $CONSUL_FILE \
      && mv consul /usr/local/bin/ \
      && chmod +x /usr/local/bin/consul \
      && rm -f $CONSUL_FILE \
      && chown consul:consul /data \
      && chown consul:consul /config \
      && apk del curl \
      && rm -rf /tmp/$GLIBC_FILE /var/cache/apk/*

WORKDIR /data

COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "tini", "--", "/entrypoint.sh"]

CMD [ "consul" ]
