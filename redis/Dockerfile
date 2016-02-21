FROM jgeiger/alpine
MAINTAINER jgeiger@gmail.com

EXPOSE 6379

RUN apk add --update \
      redis \
      && sed 's/daemonize yes/daemonize no/' -i /etc/redis.conf \
      && sed 's/bind 127.0.0.1/bind 0.0.0.0/' -i /etc/redis.conf \
      && sed '/^logfile/d' -i /etc/redis.conf \
      && rm -rf /var/cache/apk/*

VOLUME ["/var/lib/redis"]

COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "tini", "--", "/entrypoint.sh"]

CMD [ "redis-server", "/etc/redis.conf" ]
