FROM ubuntu:xenial

RUN apt update \
    && apt install -y sudo vim build-essential python-minimal python-dev python-pip libssl-dev \
    && rm -rf /var/lib/apt/lists/*

RUN adduser --disabled-password --shell /bin/bash --uid 1000 dockuser
RUN echo "dockuser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/dockuser

USER dockuser

