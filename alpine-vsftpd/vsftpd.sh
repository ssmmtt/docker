#!/bin/sh
echo "pasv_max_port=$PASV_MAX" >> /etc/vsftpd/vsftpd.conf
echo "pasv_min_port=$PASV_MIN" >> /etc/vsftpd/vsftpd.conf
echo "pasv_address=$PASV_ADDRESS" >> /etc/vsftpd/vsftpd.conf

addgroup -g 433 -S $FTP_USER
adduser -u 431 -D -G $FTP_USER -h /home/$FTP_USER -s /bin/false  $FTP_USER

echo "$FTP_USER:$FTP_PASS" | /usr/sbin/chpasswd

mkdir -p /home/$FTP_USER
chown $FTP_USER:$FTP_USER /home/$FTP_USER/ -R

echo "
	*************************************************
	*                                               *
	*    Docker image: jarvan/alpine-vsftpd         *
	*    valoran.jayce@gmail.com                    *
	*                                               *
	*************************************************

	SERVER SETTINGS
	---------------
	· PASV_ADDRESS: $PASV_ADDRESS
	· FTP User: $FTP_USER
	· FTP Password: $FTP_PASS
"

/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf

