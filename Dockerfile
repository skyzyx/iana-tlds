FROM golang:1-alpine@sha256:6c5c9590f169f77c8046e45c611d3b28fe477789acd8d3762d23d4744de69812

RUN apk add --no-cache make nodejs wget

RUN mkdir -p /workspace
COPY go.mod /workspace
COPY go.sum /workspace
COPY main.go /workspace
COPY Makefile /workspace

WORKDIR /workspace

ENTRYPOINT ["make", "build"]
