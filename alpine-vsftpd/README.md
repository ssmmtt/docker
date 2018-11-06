# alpine-vsftpd
Docker image of vsftpd server based on Alpine 3.8 

##Exemple usage
```
docker run \
  --name vsftpd \
  -d \
  -e FTP_USER=test \
  -e FTP_PASS=test \
  -e PASV_ADDRESS=0.0.0.0 \
  -e PASV_MIN=21100 \
  -e PASV_MAX=21110 \
  -p 21:21 \
  -p 21100-21110:21100-21110 \
  jarvan/alpine-vsftpd
```

##Exemple usage in compose file
```
version: '3'
services:
    ftp:
        image: jarvan/alpine-vsftpd
        container_name: vsftpd
        ports:
            - "21:21"
            - "21100-21110:21100-21110"
        volumes:
            - /home/vsftpd:/home
            - /home/vsftpd/log:/var/log
        environment:
            - FTP_USER=test
            - FTP_PASS=test
            - PASV_ADDRESS=0.0.0.0  # 服务器ip
            - PASV_MIN=21100
            - PASV_MAX=21110
        restart: always
```
