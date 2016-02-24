#!/bin/bash
set -e

echo "Installing gems as needed..."
sudo chown -R devops:devops /usr/local/bundle
sudo chmod go-w /usr/local/bundle
bundle install --quiet --path /usr/local/bundle --jobs 20 --retry 5

exec "$@"
