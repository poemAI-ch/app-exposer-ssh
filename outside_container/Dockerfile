FROM ubuntu:latest
RUN apt-get update && apt-get install -y openssh-server
# Configure SSH
RUN mkdir /var/run/sshd
RUN echo 'root:redhat' | chpasswd
#password for user login
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
# remove GatewayPorts  from sshd_config
RUN sed -i 's/^.*GatewayPorts/#&/' /etc/ssh/sshd_config
RUN echo "GatewayPorts yes" >> /etc/ssh/sshd_config
COPY start_outside_tunnel.sh /start_outside_tunnel.sh

EXPOSE 22

# Start SSH server
CMD ["sh", "/start_outside_tunnel.sh"]

