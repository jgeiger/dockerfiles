#!/bin/bash
set -e

export GEOMETRY="$SCREEN_WIDTH""x""$SCREEN_HEIGHT"

tightvncserver $VNC_DISPLAY -geometry $GEOMETRY
fluxbox -display $DISPLAY 2>/dev/null &

echo "Installing gems as needed..."
sudo chown -R $USERNAME:$USERNAME /usr/local/bundle
sudo chmod go-w /usr/local/bundle
bundle install --quiet --path /usr/local/bundle --jobs 20 --retry 5

exec "$@"
