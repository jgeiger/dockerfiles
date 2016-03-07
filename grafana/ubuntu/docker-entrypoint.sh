#!/bin/bash
set -e

if [ "$1" = "grafana-server" ]; then
  chown -R grafana /config
  chown -R grafana /data
  exec gosu grafana "$@"
fi

exec "$@"
