FROM jgeiger/ubuntu
MAINTAINER jgeiger@gmail.com

ENV CONFIGURE_OPTS=--disable-install-doc \
                   LANG=en_US.UTF-8 \
                   RUBY_MINOR_VERSION=2.3 \
                   RUBY_TEENY_VERSION=2.3.0

USER root
WORKDIR /tmp

RUN apt-get -qq -y update \
      && apt-get install -qq -y --no-install-recommends \
      build-essential \
      libcurl4-openssl-dev \
      libffi-dev \
      libreadline-dev \
      libsqlite3-dev \
      libssl-dev \
      libxml2-dev \
      libxslt1-dev \
      libyaml-dev \
      zlib1g-dev \
      && locale-gen en_US \
      && echo "LANG=en_US.UTF-8" > /etc/default/locale \
      && rm /bin/sh && ln -s /bin/bash /bin/sh \
      && apt-get autoremove \
      && apt-get clean
      # && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# install ruby gem requires
RUN wget http://ftp.ruby-lang.org/pub/ruby/$RUBY_MINOR_VERSION/ruby-$RUBY_TEENY_VERSION.tar.gz \
      && tar -xzf ruby-$RUBY_TEENY_VERSION.tar.gz \
      && cd ruby-$RUBY_TEENY_VERSION/ \
      && ./configure $CONFIGURE_OPTS \
      && make \
      && make install \
      && echo "gem: --no-ri --no-rdoc" > ~/.gemrc \
      && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN rm -rf /usr/local/bin/rake \
  && gem update rake \
  && gem install \
        bundler \
        zeus

USER devops
WORKDIR /home/devops

CMD ["irb"]
