FROM golang:alpine AS build-stage

WORKDIR /go/src/github.com/iAziz786/jiffy/

COPY . .

RUN go get -t -d -v ./...

RUN GOOS=linux GOARCH=amd64 go build -o main.out *.go

FROM golang:alpine

WORKDIR /app

COPY --from=build-stage /go/src/github.com/iAziz786/jiffy/main.out /app/main.out

ENTRYPOINT ./main.out