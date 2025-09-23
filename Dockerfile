FROM golang:1-alpine@sha256:b6ed3fd0452c0e9bcdef5597f29cc1418f61672e9d3a2f55bf02e7222c014abd

RUN apk add --no-cache make nodejs wget

RUN mkdir -p /workspace
COPY go.mod /workspace
COPY go.sum /workspace
COPY main.go /workspace
COPY Makefile /workspace

WORKDIR /workspace

ENTRYPOINT ["make", "build"]
