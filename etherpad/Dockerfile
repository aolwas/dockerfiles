FROM node:latest

MAINTAINER Aolwas <maxime.cottret@gmail.com>

RUN apt-get update \
    && apt-get install -y \
    git \
    gettext-base \
    && git clone git://github.com/ether/etherpad-lite.git /etherpad

EXPOSE 9001

WORKDIR /etherpad

RUN bin/installDeps.sh

ADD settings.tpl .
ADD docker-entrypoint.sh /

ENTRYPOINT /docker-entrypoint.sh
CMD ["bin/run.sh", "--root"]
