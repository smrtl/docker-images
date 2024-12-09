FROM debian:12.8

# User, group, su permission
RUN addgroup --system wheel && \
    useradd -G wheel -m dev

COPY conf/su /etc/pam.d/su

# Install stuff
RUN apt-get update -qq && \
    apt-get install -y -q --no-install-recommends \
        curl \
        git \
        iputils-ping \
        jq \
        less \
        openjdk-17-jre-headless \
        postgresql-client \
        procps \
        python3 \
        python3-pip \
        vim \
        wget \
        # python utils \
        python-is-python3 \
        python3-virtualenv \
        yq \
        awscli \
        httpie

# Kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && \
    rm kubectl

# Use dev by default
USER dev
COPY conf/home/* /home/dev/
WORKDIR /home/dev
