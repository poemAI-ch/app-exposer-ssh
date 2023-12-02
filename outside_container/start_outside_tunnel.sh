#! /bin/bash

#
# start_outside_tunnel.sh
#

mkdir -p /root/.ssh
echo ${TUNNEL_SSH_PUBLIC_KEY} >> /root/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys

/usr/sbin/sshd -D
