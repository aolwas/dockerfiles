FROM ubuntu:bionic

RUN echo "===> Update packages list..."  && \
    apt update && \
    echo "===> Adding Required runtime..."  && \
    apt install -y bash bash-completion python-minimal python-pip ca-certificates gnupg curl wget && \
    echo "===> Installing Ansible..."  && \
    pip install ansible==2.6.4                && \
    echo "==> Installing boto dependencies into the right version" && \
    pip install boto==2.49.0 boto3==1.9.10 botocore==1.12.10 netaddr==0.7.19 && \
    echo "==> Installing awscli" && \
    pip install awscli && \
    echo "===> Removing package list..."  && \
    rm -rf /var/lib/apt/lists/*

ENV KUBECTL_VERSION 1.10.11
ENV KOPS_VERSION 1.10.0
ENV HELM_VERSION 2.11.0
ENV MINIO_CLIENT_VERSION RELEASE.2018-12-05T22-59-07Z

RUN wget -O kubectl https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl && \
    wget -O kops https://github.com/kubernetes/kops/releases/download/${KOPS_VERSION}/kops-linux-amd64 && \
    chmod +x ./kops && \
    mv ./kops /usr/local/bin/ && \
    wget -O get_helm.sh https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get && \
    chmod 700 get_helm.sh && \
    ./get_helm.sh --version v${HELM_VERSION} && \
    wget -O /usr/local/bin/mc https://dl.minio.io/client/mc/release/linux-amd64/archive/mc.${MINIO_CLIENT_VERSION} && \
    chmod +x /usr/local/bin/mc

# configure bash and kubeps1
# make sure the package repository is up to date
RUN sed -i -e "s/bin\/ash/bin\/bash/" /etc/passwd
CMD ["/bin/bash","-i"]

