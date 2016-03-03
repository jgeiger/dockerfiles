FROM jgeiger/alpine
MAINTAINER jgeiger@gmail.com

ENV INFLUXDB_VERSION=influxdb-0.10.0-1 \
    GLIBC_VERSION=2.23-r1
ENV INFLUXDB_FILE=${INFLUXDB_VERSION}_linux_amd64 \
    GLIBC_FILE=glibc-${GLIBC_VERSION}.apk

EXPOSE 8088 8091 8083 8086

WORKDIR /tmp

RUN addgroup -S influxdb && adduser -S -G influxdb influxdb \
      && apk add --update \
      curl \
      openssl \
      && curl -Ls https://github.com/andyshinn/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/${GLIBC_FILE} > /tmp/${GLIBC_FILE} \
      && apk add --allow-untrusted /tmp/${GLIBC_FILE} \
      && curl -Ls https://influxdb.s3.amazonaws.com/$INFLUXDB_FILE.tar.gz > /tmp/$INFLUXDB_FILE.tar.gz \
      && tar xvfz $INFLUXDB_FILE.tar.gz \
      && rm /tmp/$INFLUXDB_FILE.tar.gz \
      && cp /tmp/$INFLUXDB_VERSION/usr/bin/* /usr/local/bin \
      && cp -r /tmp/$INFLUXDB_VERSION/etc/influxdb /etc \
      && echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf \
      && apk del \
      curl \
      && rm -rf /tmp/* /var/cache/apk/*

USER influxdb

WORKDIR /var/lib/influxdb

ENTRYPOINT [ "tini", "--" ]

CMD [ "influxd" ]
