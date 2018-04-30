FROM alpine

RUN apk add --no-cache go git musl-dev bash
RUN export GOPATH=$(go env GOPATH)
RUN go get -u golang.org/x/sync/semaphore # Required by zoekt-webserver
RUN go get -u github.com/fsnotify/fsnotify
RUN go get -u gopkg.in/src-d/go-git.v4/
RUN go get github.com/google/zoekt/
RUN go install github.com/google/zoekt/cmd/zoekt-git-index
RUN go install github.com/google/zoekt/cmd/zoekt-webserver

COPY run-zoekt.sh /usr/bin/run-zoekt.sh


ENTRYPOINT [ "/usr/bin/run-zoekt.sh" ]