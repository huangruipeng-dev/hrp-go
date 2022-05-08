FROM ubuntu
MAINTANER hrp 
ENV GO111MODULE=off     
ENV CGO_ENABLED=0
ENV  GOOS=linux
ENV GOARCH=amd64
WORKDIR /httpserver/
COPY /usr/lib/go-1.18/src/httpserver .
RUN go build -o httpserver

FROM alpine:latest
COPY --from=build /httpserver/httpserver /httpserver/httpserver
EXPOSE 8090
ENTRYPOINT ["/httpserver"]
