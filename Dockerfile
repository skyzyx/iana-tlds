FROM golang:1-alpine@sha256:ace6cc3fe58d0c7b12303c57afe6d6724851152df55e08057b43990b927ad5e8

RUN apk add --no-cache make nodejs wget

RUN mkdir -p /workspace
COPY go.mod /workspace
COPY go.sum /workspace
COPY main.go /workspace
COPY Makefile /workspace

WORKDIR /workspace

ENTRYPOINT ["make", "build"]
