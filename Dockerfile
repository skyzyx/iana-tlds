FROM golang:1-alpine@sha256:09742590377387b931261cbeb72ce56da1b0d750a27379f7385245b2b058b63a

RUN apk add --no-cache make nodejs wget

RUN mkdir -p /workspace
COPY go.mod /workspace
COPY go.sum /workspace
COPY main.go /workspace
COPY Makefile /workspace

WORKDIR /workspace

ENTRYPOINT ["make", "build"]
