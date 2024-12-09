FROM debian:buster-slim

ARG USER=remote
ARG PASS=remote
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -yqq update && \
    apt-get -yqq install \
        bash \
        curl \
        git \
        openssh-server \
        python3 \
        python3-pip \
        sudo \
        vim \
    && \
    # setup python 3.7
    update-alternatives --install /usr/bin/python python /usr/bin/python3 1 && \
    update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 1 && \
    pip install --upgrade pip setuptools && \
    pip install \
        flake8 \
        virtualenv \
        yapf \
    && \
    # create user
    useradd -m -s /bin/bash -G sudo $USER && \
    echo "$USER:$PASS" | chpasswd

COPY start_sshd.sh /

# setup home folder
USER $USER
WORKDIR /home/$USER
COPY sshd_config bash_aliases /home/$USER/
RUN mkdir .sshd && \
    sed -e "s~\${home}~/home/$USER~" sshd_config > .sshd/sshd_config && \
    rm sshd_config && \
    mv bash_aliases .bash_aliases

EXPOSE 2222
CMD ["/start_sshd.sh"]
