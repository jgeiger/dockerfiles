FROM jgeiger/alpine
MAINTAINER jgeiger@gmail.com

ENV VAULT_VERSION=0.5.0
ENV VAULT_FILE=vault_${VAULT_VERSION}_linux_amd64.zip

RUN addgroup -S vault && adduser -S -G vault vault \
      && apk add --update curl \
      && curl -o $VAULT_FILE -sSL https://releases.hashicorp.com/vault/$VAULT_VERSION/$VAULT_FILE \
      && unzip $VAULT_FILE \
      && mv vault /usr/local/bin/ \
      && echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf \
      && rm -f $VAULT_FILE \
      && apk del curl \
      && rm -rf /var/cache/apk/*

EXPOSE 8200

VOLUME [ "/config" ]

WORKDIR /config

COPY ./config /config/

COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "tini", "--", "/entrypoint.sh" ]

CMD [ "vault", "server", "-config=/config/server.hcl" ]
