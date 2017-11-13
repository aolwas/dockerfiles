#!/bin/bash

# Add local user
# Either use the LOCAL_USER_ID if passed in at runtime or
# fallback

USER_ID=${LOCAL_USER_ID:-1000}

echo "Starting with UID : $USER_ID"
useradd --shell /bin/bash -u $USER_ID -o -c "" -m dockeruser
export HOME=/home/dockeruser

chown -R dockeruser:dockeruser /var/www

if [[ -n "$WEBDAV_USERNAME" ]] && [[ -n "$WEBDAV_PASSWORD" ]] 
then 
        htpasswd -c /etc/nginx/webdavpasswd $WEBDAV_USERNAME $WEBDAV_PASSWORD 
else 
        echo "No htpasswd config done" 
        sed -i 's%auth_basic "Restricted";% %g' /etc/nginx/conf.d/webdav-site.conf 
        sed -i 's%auth_basic_user_file webdavpasswd;% %g' /etc/nginx/conf.d/webdav-site.conf 
fi 

exec /usr/sbin/nginx -g "daemon off;"
