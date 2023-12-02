#! /bin/bash

##
# start_inside_tunnel.sh
##

# Install the SSH private key (ensure this is done securely)
mkdir -p /root/.ssh
cat /etc/ssh-key/id_rsa > /root/.ssh/id_rsa
chmod 600 /root/.ssh/id_rsa

# Start the SSH tunnel
echo ssh -o StrictHostKeyChecking=no -p ${TUNNEL_SSH_PORT} -i /root/.ssh/id_rsa -N -R "${TUNNEL_OUTSIDE_PORT}:${TUNNEL_INSIDE_HOST}:${TUNNEL_INSIDE_PORT}" ${TUNNEL_USER}@$TUNNEL_HOST
ssh -o StrictHostKeyChecking=no -p ${TUNNEL_SSH_PORT} -i /root/.ssh/id_rsa -N -R "${TUNNEL_OUTSIDE_PORT}:${TUNNEL_INSIDE_HOST}:${TUNNEL_INSIDE_PORT}" ${TUNNEL_USER}@$TUNNEL_HOST
