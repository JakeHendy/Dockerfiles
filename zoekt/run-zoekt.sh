#!/bin/bash
set -e

# If the user doesn't specify a branch, master is a safe bet
BRANCHES=${BRANCHES:-master}
# Explicitly set GOPATH
export GOPATH=$(go env GOPATH)
# As a reminder...
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

# TODO Customise Port
$GOPATH/bin/zoekt-webserver -listen :6070