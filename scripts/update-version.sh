#!/bin/bash
if [[ $# -eq 0 ]]
then
    echo "Need port name"
    exit -1
fi

NAME="$1"
shift

git commit -a -m "[$NAME] Update Port"
vcpkg --x-builtin-ports-root=./ports --x-builtin-registry-versions-dir=./versions x-add-version $NAME
git commit -a -m "[$NAME] Update Port"
git push
