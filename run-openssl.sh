#!/bin/bash

SCRIPT_PATH="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     MACHINE=Linux; VOLUME_PATH=$SCRIPT_PATH ;;
    Darwin*)    MACHINE=Mac; VOLUME_PATH=$SCRIPT_PATH;;
    CYGWIN*)    MACHINE=Cygwin; VOLUME_PATH=$(cygpath -w $SCRIPT_PATH) ;;
    MINGW*)     MACHINE=MinGw; VOLUME_PATH=$(echo $SCRIPT_PATH | sed 's|^/\([a-z,A-Z]\)/|\1:/|' | sed 's|/|\\|g' ) ;;
    *)          MACHINE="UNKNOWN:${unameOut}"
esac
echo "MACHINE="${MACHINE}
echo "SCRIPT_PATH="$SCRIPT_PATH
echo "VOLUME_PATH="$VOLUME_PATH
echo "openssl args="$@

#docker run -ti -v $VOLUME_PATH:/workspace --entrypoint ash bfblog/openssl:latest
docker run -ti -v $VOLUME_PATH:/workspace bfblog/openssl:latest "$@"