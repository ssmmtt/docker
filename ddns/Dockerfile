FROM python:3.7-alpine


ENV LIBRARY_PATH=/lib:/usr/lib

WORKDIR /app

RUN echo https://mirrors.tuna.tsinghua.edu.cn/alpine/v3.8/main > /etc/apk/repositories; \
    echo https://mirrors.tuna.tsinghua.edu.cn/alpine/v3.8/community >> /etc/apk/repositories

RUN echo "*/5 * * * *   root   python /app/run.py -c /etc/ddns/config.json >> /var/log/ddns.log " > /var/spool/cron/crontabs/root;

RUN apk add --no-cache git && \
    git clone https://github.com/NewFuture/DDNS /app

ENTRYPOINT  python ./run.py -c /etc/ddns/config.json >> /var/log/ddns.log && crond &&  tail -f /var/log/ddns.log 
