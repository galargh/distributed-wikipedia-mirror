#!/bin/sh
# vim: set ts=2 sw=2:

set -euo pipefail

ipfs init -p server,local-discovery,flatfs,randomports --empty-repo
ipfs config --json Experimental.AcceleratedDHTClient true
ipfs config --json 'Datastore.Spec.mounts' "$(ipfs config 'Datastore.Spec.mounts' | jq -c '.[0].child.sync=false')"
