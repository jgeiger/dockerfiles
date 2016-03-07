#!/bin/bash
set -e

export GEOMETRY="$SCREEN_WIDTH""x""$SCREEN_HEIGHT""x""$SCREEN_DEPTH"
sudo Xvfb $DISPLAY -ac -screen 0 $GEOMETRY 2>/dev/null &
sudo fluxbox -display $DISPLAY 2>/dev/null &
sudo x11vnc -noxdamage -forever -usepw -shared -rfbport 5900 -display $DISPLAY 2>/dev/null &

echo "Installing gems as needed..."
sudo chown -R $USERNAME:$USERNAME /usr/local/bundle
sudo chmod go-w /usr/local/bundle
bundle install --quiet --path /usr/local/bundle --jobs 20 --retry 5

exec "$@"
