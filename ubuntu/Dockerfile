FROM ubuntu:14.04
MAINTAINER jgeiger@gmail.com

ENV DEBIAN_FRONTEND=noninteractive \
                    TINI_VERSION=v0.9.0 \
                    GOSU_VERSION=1.7 \
                    USERNAME=devops
ENV HOME=/home/$USERNAME

USER root

WORKDIR /tmp

RUN apt-get -qq -y update \
      && apt-get -qq -y upgrade \
      && apt-get -qq -y dist-upgrade \
      && dpkg-reconfigure tzdata \
      && dpkg-divert --local --rename --add /sbin/initctl \
      && ln -sf /bin/true /sbin/initctl \
      && dpkg-divert --local --rename --add /usr/bin/ischroot \
      && ln -sf /bin/true /usr/bin/ischroot \
      && apt-get install -qq -y --no-install-recommends \
      apt-transport-https \
      ca-certificates \
      git \
      iptables \
      language-pack-en \
      software-properties-common \
      ssh \
      sudo \
      unzip \
      wget \
      && wget --quiet --output-document /usr/local/bin/tini https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini \
      && chmod +x /usr/local/bin/tini \
      && wget --quiet --output-document /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture)" \
      && chmod +x /usr/local/bin/gosu \
      && locale-gen en_US \
      && echo "LANG=en_US.UTF-8" > /etc/default/locale \
      && rm /bin/sh \
      && ln -s /bin/bash /bin/sh \
      && useradd --create-home --shell /bin/bash $USERNAME \
      && echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
      && chown -R $USERNAME:$USERNAME /usr/local \
      && apt-get autoremove \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER $USERNAME

WORKDIR $HOME

ENTRYPOINT ["tini", "--"]

CMD [ "bash" ]
