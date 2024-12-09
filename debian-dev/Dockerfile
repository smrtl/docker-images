FROM debian:12.8-slim

# User, group, su permission
RUN addgroup --system wheel && \
    useradd -G wheel -m dev

COPY conf/su /etc/pam.d/su

# Install stuff
RUN apt-get update -qq && \
    apt-get install -y -q --no-install-recommends \
        awscli \
        bash \
        curl \
        git \
        httpie \
        iputils-ping \
        jq \
        less \
        postgresql-client \
        procps \
        python-is-python3 \
        python3 \
        python3-pip \
        python3-virtualenv \
        sudo \
        vim \
        wget \
        yq

# Kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && \
    rm kubectl

# Use dev by default
USER dev
COPY conf/home/ /home/dev/
WORKDIR /home/dev
