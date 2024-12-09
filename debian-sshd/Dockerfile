FROM smrtl/debian-dev

ARG USER=remote
ARG PASS=remote
ENV DEBIAN_FRONTEND=noninteractive

USER 0

# Create the $USER
RUN useradd -m -s /bin/bash -G sudo $USER && \
    echo "$USER:$PASS" | chpasswd

# Install open SSH
RUN apt-get install -yqq --no-install-recommends openssh-server

# Copy entrypoint
COPY conf/start_sshd.sh /

# setup home folder
USER $USER
WORKDIR /home/$USER
COPY --chown=$USER conf/home/ /home/$USER/
RUN cp /home/dev/.bashrc /home/$USER/ && \
    cp /home/dev/.bash_aliases /home/$USER/ && \
    sed -ie "s~\${home}~/home/$USER~" .sshd/sshd_config

EXPOSE 2222
CMD ["/start_sshd.sh"]
