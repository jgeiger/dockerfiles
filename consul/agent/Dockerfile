FROM jgeiger/consul
MAINTAINER jgeiger@gmail.com

ENV DNS_RESOLVES=consul \
                 DNS_PORT=8600

EXPOSE 8300 8301 8301/udp 8302 8302/udp 8400 8500 8600 8600/udp

ADD ./config /config/

CMD [ "consul", "agent", "-config-dir=/config" ]
