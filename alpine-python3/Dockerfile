FROM alpine:3.10
LABEL maintainer jarvan
ENV TIME_ZONE Asia/Shanghai

RUN apk update && \
    apk add --no-cache -U tzdata && \
    ln -sf /usr/share/zoneinfo/${TIME_ZONE} /etc/localtime && \
    echo "${TIME_ZONE}" > /etc/timezone

RUN apk add --no-cache python3 && \
    pip3 install --upgrade --no-cache-dir pip setuptools && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    pip3 install --no-cache-dir requests
