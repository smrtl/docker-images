#!/bin/bash

if [ ! -f .sshd/ssh_host_rsa_key ]; then
  ssh-keygen -t rsa -f .sshd/ssh_host_rsa_key -N '' >/dev/null
fi

/usr/sbin/sshd -f ~/.sshd/sshd_config -D
