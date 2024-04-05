FROM golang:1-alpine@sha256:cdc86d9f363e8786845bea2040312b4efa321b828acdeb26f393faa864d887b0

RUN apk add --no-cache make nodejs wget

RUN mkdir -p /workspace
COPY go.mod /workspace
COPY go.sum /workspace
COPY main.go /workspace
COPY Makefile /workspace

WORKDIR /workspace

ENTRYPOINT ["make", "build"]
