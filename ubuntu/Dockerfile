FROM ubuntu:14.04
MAINTAINER jgeiger@gmail.com

ENV DEBIAN_FRONTEND=noninteractive \
                    TINI_VERSION=v0.9.0

# Add Tini
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

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
      && locale-gen en_US \
      && echo "LANG=en_US.UTF-8" > /etc/default/locale \
      && rm /bin/sh \
      && ln -s /bin/bash /bin/sh \
      && useradd --create-home --shell /bin/bash devops \
      && echo "devops ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
      && chown -R devops:devops /usr/local \
      && apt-get autoremove \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER devops
WORKDIR /home/devops
