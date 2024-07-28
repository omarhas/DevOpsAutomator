# Prometheus Installation Script

This repository contains a Bash script to install and configure Prometheus on Ubuntu . The script performs the following steps:

1. Updates the system's package list.
2. Creates a system group and user for Prometheus.
3. Creates necessary directories for Prometheus.
4. Downloads and extracts Prometheus.
5. Moves binary files to the appropriate location and sets ownership.
6. Moves configuration files to the appropriate location and sets ownership.
7. Creates a systemd service file for Prometheus.
8. Enables and starts the Prometheus service.
9. Configures the firewall to allow traffic on port 9090 (the default Prometheus port).
10. Checks the status of the Prometheus service.

## Prerequisites

- Ubuntu 22.04
- sudo privileges

## Usage

1. **Clone the repository**

    ```bash
    git clone <repository-url>
    cd <repository-directory>
    ```

2. **Make the script executable**

    ```bash
    chmod +x setup_prometheus.sh
    ```

3. **Run the script**

    ```bash
    ./setup_prometheus.sh
    ```

