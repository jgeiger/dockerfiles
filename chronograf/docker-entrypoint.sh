#!/bin/bash
set -e

if [ "$1" = "/opt/chronograf/chronograf" ]; then
  chown -R chronograf:chronograf /data
  exec gosu chronograf "$@"
fi

exec "$@"
