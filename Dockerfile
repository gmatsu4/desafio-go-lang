FROM golang:1.21-alpine AS builder

WORKDIR /app

COPY hello.go .

RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-s -w" -o app hello.go

FROM scratch

COPY --from=builder /app/app /app

ENTRYPOINT ["/app"]