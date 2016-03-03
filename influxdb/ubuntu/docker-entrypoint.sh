#!/bin/bash
set -e

if [ "$1" = "influxd" ]; then
  ulimit -n 65536
  chown -R influxdb:influxdb /var/lib/influxdb
  exec gosu influxdb "$@"
fi

exec "$@"
