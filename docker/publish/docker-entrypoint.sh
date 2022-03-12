#!/bin/sh
set -e

if [ $# -eq 0 ]; then
  ( ( ipfs daemon & ) && pid=$! ) | sed '/Daemon is ready/q'
  add_to_ipfs.sh "$(find 'tmp' -name '*.zim' -maxdepth 1 -exec basename {} \;)" 'tmp'
  wait $pid
else
  exec "$@"
fi
