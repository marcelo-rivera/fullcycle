FROM golang:1.20.2-alpine AS builder

WORKDIR /src

COPY /src/hello-world.go /src

#CMD ["go", "build","hello-world.go"]
RUN go build hello-world.go

FROM hello-world:latest

WORKDIR /src
COPY --from=builder /src .

CMD ["./hello-world"]