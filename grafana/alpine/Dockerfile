FROM jgeiger/alpine
MAINTAINER jgeiger@gmail.com

ENV GRAFANA_VERSION=grafana-3.0.0-pre1 \
    GLIBC_VERSION=2.23-r1
ENV GRAFANA_FILE=${GRAFANA_VERSION}.linux-x64 \
    GLIBC_FILE=glibc-${GLIBC_VERSION}.apk

EXPOSE 3000

WORKDIR /tmp

RUN addgroup -S grafana && adduser -S -G grafana grafana \
      && echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf \
      && apk add --update \
      curl \
      openssl \
      && curl -Ls https://github.com/andyshinn/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/${GLIBC_FILE} > /tmp/${GLIBC_FILE} \
      && apk add --allow-untrusted /tmp/${GLIBC_FILE} \
      && curl -Ls https://grafanarel.s3.amazonaws.com/builds/$GRAFANA_FILE.tar.gz > /tmp/$GRAFANA_FILE.tar.gz \
      && tar xfz /tmp/$GRAFANA_FILE.tar.gz \
      && rm /tmp/$GRAFANA_FILE.tar.gz \
      && mv /tmp/$GRAFANA_VERSION /usr/local \
      && ln -s /usr/local/$GRAFANA_VERSION/bin/grafana-server /usr/local/bin/grafana-server \
      && sed 's/mode = console, file/mode = console/' -i /usr/local/$GRAFANA_VERSION/conf/defaults.ini \
      && apk del \
      curl \
      && rm -rf /tmp/$GLIBC_FILE /var/cache/apk/*

COPY docker-entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh \
      && mkdir /data \
      && chown grafana:grafana /data \
      && mkdir /config \
      && chown grafana:grafana /config

COPY ./config /config/

WORKDIR /usr/local/$GRAFANA_VERSION

ENTRYPOINT [ "tini", "--", "/entrypoint.sh"]

CMD [ "grafana-server", "-config", "/config/grafana.ini" ]
