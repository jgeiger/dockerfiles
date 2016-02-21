#!/bin/bash
set -e

if [ "$1" = "consul" ]; then
  chown -R consul /config
  chown -R consul /data
  exec gosu consul "$@"
fi

exec "$@"
