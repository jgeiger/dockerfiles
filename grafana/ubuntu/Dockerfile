FROM jgeiger/ubuntu
MAINTAINER jgeiger@gmail.com

ENV GRAFANA_VERSION=grafana_3.0.0-pre1
ENV GRAFANA_FILE=${GRAFANA_VERSION}_amd64.deb

EXPOSE 3000

USER root

WORKDIR /tmp

RUN wget --quiet https://grafanarel.s3.amazonaws.com/builds/$GRAFANA_FILE \
      && apt-get -qq -y update \
      && apt-get install -qq -y --no-install-recommends \
      libfontconfig \
      && dpkg -i $GRAFANA_FILE \
      && sed 's/mode = console, file/mode = console/' -i /usr/share/grafana/conf/defaults.ini \
      && apt-get autoremove \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY docker-entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh \
      && mkdir /data \
      && chown grafana:grafana /data \
      && mkdir /config \
      && chown grafana:grafana /config

COPY ./config /config/

WORKDIR /usr/share/grafana

ENTRYPOINT [ "tini", "--", "/entrypoint.sh"]

CMD [ "grafana-server", "-config", "/config/grafana.ini" ]
