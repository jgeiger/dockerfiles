#!/bin/bash
set -e

if [ "$1" = "telegraf" ]; then
  ulimit -n 65536
  exec gosu telegraf "$@"
fi

exec "$@"
