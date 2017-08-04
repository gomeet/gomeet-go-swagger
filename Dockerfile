FROM golang:1.8.3-alpine3.6
RUN apk add --no-cache --update git &&\
     rm -rf /var/cache/apk/* &&\
     go get -u github.com/go-swagger/go-swagger/cmd/swagger

ENTRYPOINT ["swagger"]
CMD ["--help"]
