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

