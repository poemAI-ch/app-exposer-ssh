#!/bin/bash

# Read the private SSH key
TUNNEL_SSH_KEY=$(cat exposer_key)

# Define other tunnel variables
TUNNEL_INSIDE_HOST="192.168.178.61"
TUNNEL_INSIDE_PORT=8048
TUNNEL_OUTSIDE_PORT=9080
TUNNEL_USER=root
TUNNEL_HOST=192.168.178.61
TUNNEL_SSH_PORT=9922  # Replace with your SSH port


mkdir -p ./etc/ssh-key
cp exposer_key ./etc/ssh-key/id_rsa

# Run the Docker container
docker run \
-e TUNNEL_INSIDE_PORT=$TUNNEL_INSIDE_PORT \
-e TUNNEL_OUTSIDE_PORT=$TUNNEL_OUTSIDE_PORT \
-e TUNNEL_INSIDE_HOST=$TUNNEL_INSIDE_HOST \
-e TUNNEL_USER=$TUNNEL_USER \
-e TUNNEL_HOST=$TUNNEL_HOST \
-e TUNNEL_SSH_PORT=$TUNNEL_SSH_PORT \
-e TUNNEL_SSH_KEY="$TUNNEL_SSH_KEY" \
-v $(pwd)/etc/ssh-key:/etc/ssh-key \
exposer_ssh_inside_container:local

