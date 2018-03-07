#!/bin/sh
while true; do
  if test -n "`tmux showb 2> /dev/null`"; then
    tmux saveb -|pbcopy && tmux deleteb
    echo "Copied text!"
    exit 1
  fi
  exit 1
done
