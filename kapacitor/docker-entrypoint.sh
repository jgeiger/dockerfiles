#!/bin/bash
set -e

if [ "$1" = "kapacitord" ]; then
  chown -R kapacitor:kapacitor /var/lib/kapacitor
  exec gosu kapacitor "$@"
fi

exec "$@"
