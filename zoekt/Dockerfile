FROM alpine:latest
LABEL maintainer "Jake Hendy <me@jakehendy.com>"


# We need go, git, bash, and musl-dev for zoekt-git-index
RUN apk add --no-cache go git musl-dev bash
# Explicitly set GOPATH...
RUN export GOPATH=$(go env GOPATH)
# Required by zoekt-webserver, has to be explicitly included
RUN go get -u golang.org/x/sync/semaphore 
# Required by zoekt-git-index
RUN go get -u github.com/fsnotify/fsnotify
# Required by zoekt-git-index
RUN go get -u gopkg.in/src-d/go-git.v4/
# The star of the show!
RUN go get github.com/google/zoekt/
# Looks after git indices specifically
RUN go install github.com/google/zoekt/cmd/zoekt-git-index
RUN go install github.com/google/zoekt/cmd/zoekt-index
RUN go install github.com/google/zoekt/cmd/zoekt-webserver

# Wrapper script which provides a first run index, then starts the webserver
# TODO: Do we need to reindex? Can we have multiple indexes? Indices?
COPY run-zoekt.sh /usr/bin/run-zoekt.sh

# Let's go!
ENTRYPOINT [ "/usr/bin/run-zoekt.sh" ]