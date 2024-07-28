# Grafana Installation Script

This repository contains a Bash script to install and configure Grafana on Ubuntu. The script performs the following steps:

1. Updates the system's package list and upgrades existing packages.
2. Installs required packages.
3. Adds Grafana's GPG key.
4. Adds Grafana's APT repository.
5. Installs Grafana.
6. Starts Grafana as a service and enables it to start on boot.
7. Configures the firewall to allow traffic on the necessary ports.

## Prerequisites

- Ubuntu
- sudo privileges

## Usage

1. **Clone the repository**

    ```bash
    git clone <repository-url>
    cd <repository-directory>
    ```

2. **Make the script executable**

    ```bash
    chmod +x setup-grafana.sh
    ```

3. **Run the script**

    ```bash
    ./setup-grafana.sh
    ```

## Script Content

```bash
#!/bin/bash 
sudo apt update -y
sudo apt upgrade -y

# Install required packages 
sudo apt install -y apt-transport-https software-properties-common wget

# Add Grafana GPG key
sudo mkdir -p /etc/apt/keyrings/
wget -q -O - https://apt.grafana.com/gpg.key | gpg --dearmor | sudo tee /etc/apt/keyrings/grafana.gpg > /dev/null

# Add Grafana APT repository
echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list
sudo apt update

# Install Grafana
sudo apt install grafana

# Start Grafana as a service
sudo systemctl start grafana-server
sudo systemctl enable grafana-server

# Allow ports on the firewall
sudo ufw enable 
sudo ufw allow ssh
sudo ufw allow 3000/tcp
