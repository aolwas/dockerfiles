FROM ubuntu:14.04
MAINTAINER Maxime Cottret <maxime.cottret@gmail.com>
# original work from @jessfraz

RUN apt-get update && apt-get install -y \
    software-properties-common \
    --no-install-recommends && \
    add-apt-repository ppa:tomahawk/ppa && \
    apt-get update && \
    apt-get install -y \
    tomahawk \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "/usr/bin/tomahawk" ]
