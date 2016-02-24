FROM jgeiger/ruby-ubuntu
MAINTAINER jgeiger@gmail.com

EXPOSE 3000

USER root

RUN apt-get -qq -y update \
      && apt-get install -qq -y --no-install-recommends \
      libpq-dev \
      nodejs \
      npm \
      sqlite3 \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY docker-entrypoint.sh /entrypoint.sh

RUN mkdir -p /app \
      && chown -R devops /app \
      && chmod +x /entrypoint.sh

USER devops

WORKDIR /app

ENTRYPOINT [ "/tini", "--", "/entrypoint.sh" ]

CMD ["bundle", "exec", "rails", "server"]
