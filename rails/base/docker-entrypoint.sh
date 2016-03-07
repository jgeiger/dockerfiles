#!/bin/bash
set -e

echo "Installing gems as needed..."
sudo chown -R $USERNAME:$USERNAME /usr/local/bundle
sudo chmod go-w /usr/local/bundle
bundle install --quiet --path /usr/local/bundle --jobs 20 --retry 5

exec "$@"
