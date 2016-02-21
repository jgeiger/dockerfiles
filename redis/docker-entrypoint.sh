#!/bin/bash
set -e

if [ "$1" = "redis-server" ]; then
  chown -R redis:redis /var/lib/redis
  exec gosu redis "$@"
fi

exec "$@"
