#!/bin/bash


if [ "$1" == "local" ]; then
    echo "Using local image"
    TAG="local"
else
    echo "Using docker hub image"
    PREFIX="empoemai/"
    TAG="latest"
fi

KEY_FILE="/tmp/app-exposer/exposer_key"

# Read the public SSH key
TUNNEL_SSH_PUBLIC_KEY=$(cat "${KEY_FILE}.pub")

# Define SSH port (should match TUNNEL_SSH_PORT from the inside container script)
TUNNEL_SSH_PORT=9922

# Define the outside tunnel port
TUNNEL_OUTSIDE_PORT=9080

IMAGE=${PREFIX}app-exposer-ssh-outside:$TAG

echo "Starting outside tunnel with image ${IMAGE}"
# Run the Docker container
docker run \
    -e TUNNEL_SSH_PUBLIC_KEY="$TUNNEL_SSH_PUBLIC_KEY" \
    -p ${TUNNEL_SSH_PORT}:22 \
    -p ${TUNNEL_OUTSIDE_PORT}:${TUNNEL_OUTSIDE_PORT} \
    ${IMAGE}
