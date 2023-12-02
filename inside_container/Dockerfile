FROM ubuntu:20.04

# Install SSH client and Nginx

ENV export DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y tzdata keyboard-configuration openssh-client dumb-init
RUN apt-get -y install curl unzip groff less
RUN	curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN	unzip awscliv2.zip && ./aws/install

# Copy the script to establish the SSH tunnel
COPY start_inside_tunnel.sh /start_inside_tunnel.sh

ENTRYPOINT ["/usr/bin/dumb-init", "--"]


# Start the SSH tunnel
CMD ["sh", "/start_inside_tunnel.sh"]
