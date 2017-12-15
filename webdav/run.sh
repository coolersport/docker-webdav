#!/bin/bash

cp /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

htpasswd -cb /etc/apache2/webdav.password $USERNAME $PASSWORD
chown root:www-data /etc/apache2/webdav.password
chmod 640 /etc/apache2/webdav.password
sed -i 's/Listen 80/Listen 8080/g' /etc/apache2/ports.conf

su -m -s /bin/bash -c '/usr/sbin/apache2 -D FOREGROUND' www-data
