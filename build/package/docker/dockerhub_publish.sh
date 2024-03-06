#!/usr/bin/env bash

set -e

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ] ; do SOURCE="$(readlink "$SOURCE")"; done
BDIR="$( cd -P "$( dirname "$SOURCE" )/../../.." && pwd )"

TAG="current"
pushd $BDIR
if hash git 2>/dev/null && [ -e $BDIR/.git ]; then
  TAG="$(git describe --tags)"
fi
popd

docker tag mint mintoolkit/mint:$TAG
docker tag mint mintoolkit/mint
docker push mintoolkit/mint:$TAG
docker push mintoolkit/mint
