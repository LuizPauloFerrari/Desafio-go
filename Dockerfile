FROM golang:1.18rc1-alpine3.15 as builder

WORKDIR /usr/src/app

COPY main.go .

RUN go build main.go

FROM scratch

COPY --from=builder /usr/src/app/main /

CMD [ "./main" ]