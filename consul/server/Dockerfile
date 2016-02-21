FROM jgeiger/consul-agent
MAINTAINER jgeiger@gmail.com

COPY ./config /config/

CMD ["consul", "agent", "-server", "-config-dir=/config"]
