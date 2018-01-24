#!/bin/bash

cp /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

if [[ -f /etc/apache2/webdav.password ]]; then
  htpasswd -bB /etc/apache2/webdav.password $USERNAME $PASSWORD
else
  htpasswd -cbB /etc/apache2/webdav.password $USERNAME $PASSWORD
fi

chown root:www-data /etc/apache2/webdav.password
chmod 640 /etc/apache2/webdav.password
sed -i 's/Listen 80$/Listen 8080/g' /etc/apache2/ports.conf

exec gosu www-data /usr/sbin/apache2 -D FOREGROUND
