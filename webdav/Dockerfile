# Do not use nginx as base since extras are not included.
FROM      ubuntu:xenial

RUN       apt-get update && \
          apt-get install -y nginx-full && \
          rm -rf /var/lib/apt/lists/*
    
COPY      webdav-site.conf /etc/nginx/conf.d/
COPY	  nginx.conf /etc/nginx/nginx.conf

# Overwrite mimetypes to add rss format.
COPY      mime.types /etc/nginx/

# forward request and error logs to docker log collector
RUN       ln -sf /dev/stdout /var/log/nginx/access.log
RUN       ln -sf /dev/stderr /var/log/nginx/error.log

# Create folder where webdav files end up.
RUN       mkdir -p /var/www/.temp
RUN       chmod -R a+rw /var/www

# Share the volume with the files to other dockers
#VOLUME    /var/www
STOPSIGNAL SIGTERM

COPY      entrypoint.sh /entrypoint.sh
ENTRYPOINT       [ "/entrypoint.sh" ]
