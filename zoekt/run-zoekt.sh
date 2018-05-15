#!/bin/bash
set -e

BRANCHES=${BRANCHES:-master}
export GOPATH=$(go env GOPATH)
echo $GOPATH
echo "Indexing branches: ${BRANCHES}"
for i in /home/git/*/; do
    if [[ -d "$i/.git" ]]; then
      echo "Indexing '$i' as a git repo..."
      $GOPATH/bin/zoekt-git-index -branches $BRANCHES "$i"
    else
      echo "Indexing '$i' as a regular directory"
      $GOPATH/bin/zoekt-index "$i"
    fi
done

$GOPATH/bin/zoekt-webserver -listen :6070