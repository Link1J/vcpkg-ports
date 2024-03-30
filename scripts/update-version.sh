#!/bin/bash
if [[ $# -eq 0 ]]
then
    echo "Need port name"
    exit -1
fi

NAME="$1"
shift

vcpkg format-manifest ports/$NAME/vcpkg.json
git commit ports/$NAME/.
git commit -m "[$NAME] Update Port"
vcpkg --x-builtin-ports-root=./ports --x-builtin-registry-versions-dir=./versions x-add-version $NAME
git commit versions/.
git commit -m "[$NAME] Update Port" --amend
git push
