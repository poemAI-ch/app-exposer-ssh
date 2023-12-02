#! /bin/bash

##
# start_inside_tunnel.sh
##

TUNNEL_USER=${TUNNEL_USER:-root}
# Install the SSH private key (ensure this is done securely)
mkdir -p /root/.ssh

# if aws secret name is given, use it to get the private key
if [ -n "$AWS_SECRET_NAME" ]; then
    echo "Getting private key from AWS secret manager"
    aws secretsmanager get-secret-value --secret-id $AWS_SECRET_NAME --region $AWS_REGION --query SecretString --output text > /root/.ssh/id_rsa
else
    echo "Using private key from mounted volume"
    cat /etc/ssh-key/id_rsa > /root/.ssh/id_rsa
fi

chmod 600 /root/.ssh/id_rsa

# Start the SSH tunnel
echo Starting inside tunnel with ssh -o StrictHostKeyChecking=no -p ${TUNNEL_SSH_PORT} -i /root/.ssh/id_rsa -N -R "${TUNNEL_OUTSIDE_PORT}:${TUNNEL_INSIDE_HOST}:${TUNNEL_INSIDE_PORT}" ${TUNNEL_USER}@$TUNNEL_OUTSIDE_HOST
ssh -o StrictHostKeyChecking=no -p ${TUNNEL_SSH_PORT} -i /root/.ssh/id_rsa -N -R "${TUNNEL_OUTSIDE_PORT}:${TUNNEL_INSIDE_HOST}:${TUNNEL_INSIDE_PORT}" ${TUNNEL_USER}@$TUNNEL_OUTSIDE_HOST
