#!/bin/bash
set -e

if [ "$1" = "vault" ]; then
  chown -R vault:vault /config
  exec gosu vault "$@"
fi

exec "$@"
