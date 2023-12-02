#!/bin/bash

if [ "$1" == "local" ]; then
    echo "Using local image"
    TAG="local"
else
    echo "Using docker hub image"
    PREFIX="empoemai/"
    TAG="latest"
fi


# Try to find the IP using ifconfig (common on MacOS)
IP=$(ifconfig | grep 'inet ' | grep -v '127.0.0.1' | awk '{print $2}' | head -n 1)

# If the above command fails (common in Linux), try using ip addr
if [ -z "$IP" ]; then
    IP=$(ip addr | grep 'inet ' | grep -v '127.0.0.1' | awk '{print $2}' | cut -d/ -f1 | head -n 1)
fi

# Check if an IP was found
if [ -z "$IP" ]; then
    echo "No IP address found."
else
    echo "IP address: $IP"
fi



# Define other tunnel variables
KEY_FILE="/tmp/app-exposer/exposer_key"
# we need to mount the key into the container, so we copy it into a tmp dir, but not on /tmp, because that will lead to problems on MacOS
ETC_DIR="$HOME/tmp/app-exposer/etc"
ETC_KEY_DIR="$ETC_DIR/ssh-key"
ETC_KEY_FILE="$ETC_KEY_DIR/id_rsa"


TUNNEL_INSIDE_HOST=$IP
TUNNEL_INSIDE_PORT=8048
TUNNEL_OUTSIDE_PORT=9080
TUNNEL_USER=root
TUNNEL_OUTSIDE_HOST=$IP # Replace with your outside, if you want to test with separate inside/outside hosts
TUNNEL_SSH_PORT=9922  # Replace with your SSH port

mkdir -p  $ETC_DIR/ssh-key

cp $KEY_FILE $ETC_KEY_FILE
chmod 666 $ETC_KEY_FILE

IMAGE=${PREFIX}app-exposer-ssh-inside:$TAG
MOUNT_OPTION="-v $ETC_KEY_DIR/:/etc/ssh-key"

echo "Starting inside tunnel with image ${IMAGE}, mounting with ${MOUNT_OPTION}"

# Run the Docker container
docker run \
-e TUNNEL_INSIDE_PORT=$TUNNEL_INSIDE_PORT \
-e TUNNEL_OUTSIDE_PORT=$TUNNEL_OUTSIDE_PORT \
-e TUNNEL_INSIDE_HOST=$TUNNEL_INSIDE_HOST \
-e TUNNEL_USER=$TUNNEL_USER \
-e TUNNEL_OUTSIDE_HOST=$TUNNEL_OUTSIDE_HOST \
-e TUNNEL_SSH_PORT=$TUNNEL_SSH_PORT \
-e TUNNEL_SSH_KEY="$TUNNEL_SSH_KEY" \
 ${MOUNT_OPTION}  \
${IMAGE}

