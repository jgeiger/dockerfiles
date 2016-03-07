FROM jgeiger/ruby-ubuntu
MAINTAINER jgeiger@gmail.com

EXPOSE 3000

USER root

WORKDIR /tmp

RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list \
      && wget --quiet https://www.postgresql.org/media/keys/ACCC4CF8.asc -O - | apt-key add - \
      && apt-get -qq -y update \
      && apt-get install -qq -y --no-install-recommends \
      libpq-dev \
      nodejs \
      npm \
      postgresql-client \
      sqlite3 \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY docker-entrypoint.sh /entrypoint.sh

RUN mkdir -p /app \
      && chown -R $USERNAME /app \
      && chmod +x /entrypoint.sh

USER $USERNAME

WORKDIR /app

ENTRYPOINT [ "tini", "--", "/entrypoint.sh" ]

CMD ["bundle", "exec", "rails", "server"]
