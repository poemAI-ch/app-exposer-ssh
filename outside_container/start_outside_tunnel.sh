#! /bin/bash

#
# start_outside_tunnel.sh
#
echo "Installing SSH public key.."
mkdir -p /root/.ssh
echo ${TUNNEL_SSH_PUBLIC_KEY} >> /root/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys

echo "Starting SSH server.."

/usr/sbin/sshd -D

echo "SSH sever stopped, exiting."
