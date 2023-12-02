#!/bin/bash

# Define the file where the key will be saved
mkdir -p /tmp/app-exposer
KEY_FILE="/tmp/app-exposer/exposer_key"

# Generate the SSH key pair
ssh-keygen -t rsa -b 4096 -C "exposer@poemai.ch" -f "${KEY_FILE}" -N ""

echo "SSH key pair generated into ${KEY_FILE}"

