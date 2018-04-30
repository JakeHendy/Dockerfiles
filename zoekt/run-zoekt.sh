#!/bin/bash
set -e

BRANCHES=${BRANCHES:-master}
export GOPATH=$(go env GOPATH)
echo $GOPATH
echo "Indexing branches: ${BRANCHES}"
$GOPATH/bin/zoekt-git-index -branches master /home/git

$GOPATH/bin/zoekt-webserver -listen :6070