##
## Build
##
FROM golang:1.15.3 as builder
WORKDIR /app/
COPY . .
RUN go build -o app /app/main.go

##
## Deploy
##
FROM scratch
WORKDIR /app/
COPY --from=builder /app/ /app/
CMD ./app