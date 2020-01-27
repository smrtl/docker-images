FROM debian:bullseye-slim

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
    pip install \
        yapf \
        flake8 \
    && \
    # create user
    useradd -m -s /bin/bash -G sudo $USER && \
    echo "$USER:$PASS" | chpasswd

WORKDIR /home/$USER
USER $USER
COPY sshd_config bash_aliases /home/$USER/

# setup sshd
RUN mkdir .sshd && \
    ssh-keygen -t rsa -f .sshd/ssh_host_rsa_key -N '' && \
    sed -e "s~\${home}~/home/$USER~" sshd_config > .sshd/sshd_config && \
    rm sshd_config && \
    mv bash_aliases .bash_aliases

EXPOSE 2222
CMD ["/usr/sbin/sshd", "-f", ".sshd/sshd_config", "-D"]
