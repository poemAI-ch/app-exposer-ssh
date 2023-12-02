FROM ubuntu

# Install SSH client and Nginx
RUN apt-get update && apt-get install -y openssh-client dumb-init

# Copy the script to establish the SSH tunnel
COPY start_inside_tunnel.sh /start_inside_tunnel.sh

ENTRYPOINT ["/usr/bin/dumb-init", "--"]


# Start the SSH tunnel
CMD ["sh", "/start_inside_tunnel.sh"]
