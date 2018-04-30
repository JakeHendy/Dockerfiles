#!/bin/bash
set -e

# If the user doesn't specify a branch, master is a safe bet
BRANCHES=${BRANCHES:-master}
# Explicitly set GOPATH
export GOPATH=$(go env GOPATH)
# As a reminder...
echo $GOPATH
echo "Indexing branches: ${BRANCHES}"
# TODO cover off multiple indices/folders
$GOPATH/bin/zoekt-git-index -branches master /home/git

# TODO Customise Port
$GOPATH/bin/zoekt-webserver -listen :6070