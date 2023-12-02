
# App-Exposer-SSH

## Overview

App-Exposer-SSH is an open-source solution designed to securely expose internal applications to the outside world using SSH tunnels. This project comprises two main components: an "inside" container that establishes an outbound SSH connection, and an "outside" container that acts as a gateway, forwarding incoming traffic through the tunnel to the internal service.

## Why App-Exposer-SSH?

### Purpose

App-Exposer-SSH is designed to provide a secure and flexible way to expose internal services, such as web servers or APIs, to the internet without the need for direct inbound internet access. This solution is particularly useful in environments where services are running behind firewalls or in isolated network environments, such as Kubernetes clusters without external IP addresses.

### Use Cases

- Behind Firewalls: For services running within a network protected by a firewall, App-Exposer-SSH allows these services to be accessed externally without the need to configure firewall rules or open inbound ports.

- Dynamic Infrastructure: In environments like Kubernetes, where worker nodes may have dynamic IP addresses, App-Exposer-SSH eliminates the need to track and expose these IPs.

- Kubernetes Clusters: Especially useful in Kubernetes environments, App-Exposer-SSH can expose services from within a cluster, even when running on AWS Fargate or other cloud services where nodes do not have external IP addresses.

- Cost-Effective Solution for Cloud Services: App-Exposer-SSH provides a more cost-effective alternative to using expensive load balancers in cloud environments. This can be particularly beneficial for services hosted on platforms like AWS Fargate, where setting up and maintaining a load balancer can be costly.

### How It Works

- "Inside" Container (SSH Client): This container resides within your internal network or Kubernetes cluster. It establishes an outbound SSH connection to the "outside" container, creating a secure tunnel.

- "Outside" Container (SSH Server): This container is placed in a network that is accessible from the internet, such as a public-facing server or load balancer. It listens for incoming traffic and forwards it through the SSH tunnel to the "inside" container.

### Advantages
- Security: By using SSH tunnels, App-Exposer-SSH ensures that the communication between internal and external environments is encrypted and secure.

- Flexibility: This solution can be deployed in a variety of environments, from simple on-premise setups to complex cloud-based Kubernetes clusters.

- Ease of Configuration: App-Exposer-SSH simplifies the configuration process, eliminating the need for complex network and firewall setups.

- Accessibility: Services that were previously inaccessible from the internet can now be securely exposed, facilitating easier access for development, testing, or production use.


## Prerequisites

- Docker installed on your machine
- Basic understanding of Docker containerization
- SSH keys for secure communication between containers

## License
This project is licensed under the MIT License.