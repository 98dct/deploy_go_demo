# 第一阶段：编译应用程序
FROM golang:1.19 AS builder

RUN mkdir /app/

ADD . /app/

# 设置工作目录
WORKDIR /app


ENV GO111MODULE=on \
    GOPROXY=https://goproxy.cn,direct


RUN GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o main .

# 第二阶段：运行应用程序
FROM alpine:3.14

RUN mkdir /app

WORKDIR /app

COPY --from=builder /app/main /app/

RUN chmod +x ./main

CMD ["./main"]

