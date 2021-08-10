ARG GO_VERSION=1.16

FROM golang:${GO_VERSION}-alpine AS builder

WORKDIR /src

COPY . .

RUN go build -ldflags "-w -s" -o jitsi-openid

FROM alpine

WORKDIR /app

COPY --from=builder /src/jitsi-openid .
COPY LICENSE .

EXPOSE 8080

ENTRYPOINT ["jitsi-openid"]
