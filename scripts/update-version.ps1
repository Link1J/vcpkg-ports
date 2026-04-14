param (
    [Parameter(Mandatory=$true)][string]$NAME
)

vcpkg format-manifest ports/$NAME/vcpkg.json
git add ports/$NAME/.
git commit -m "[$NAME] Update Port"
vcpkg --x-builtin-ports-root=./ports --x-builtin-registry-versions-dir=./versions x-add-version $NAME
git add versions/.
git commit -m "[$NAME] Update Port" --amend
git push
