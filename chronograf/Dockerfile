FROM jgeiger/ubuntu
MAINTAINER jgeiger@gmail.com

ENV CHRONOGRAF_VERSION=chronograf_0.10.0
ENV CHRONOGRAF_FILE=${CHRONOGRAF_VERSION}_amd64.deb

EXPOSE 10000

USER root

WORKDIR /tmp

RUN wget --quiet --output-document /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/1.7/gosu-amd64" \
      && chmod +x /usr/local/bin/gosu \
      && wget --quiet https://s3.amazonaws.com/get.influxdb.org/chronograf/${CHRONOGRAF_FILE} \
      && apt-get -qq -y update \
      && dpkg -i ${CHRONOGRAF_FILE} \
      && apt-get autoremove \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR /opt/chronograf

ENTRYPOINT [ "/tini", "--", "/entrypoint.sh"]

CMD [ "/opt/chronograf/chronograf" ]
