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

## Script Content

```bash
#!/bin/bash

# Update system packages
sudo apt update

# Create a group and user for Prometheus
sudo groupadd --system prometheus
sudo useradd -s /sbin/nologin --system -g prometheus prometheus

# Create directories for Prometheus
sudo mkdir /etc/prometheus
sudo mkdir /var/lib/prometheus

# Download Prometheus
wget https://github.com/prometheus/prometheus/releases/download/v2.43.0/prometheus-2.43.0.linux-amd64.tar.gz -P /tmp

# Extract Prometheus
tar -xvf /tmp/prometheus-2.43.0.linux-amd64.tar.gz -C /tmp

# Move binary files and set ownership
sudo mv /tmp/prometheus-2.43.0.linux-amd64/prometheus /usr/local/bin/
sudo mv /tmp/prometheus-2.43.0.linux-amd64/promtool /usr/local/bin/
sudo chown prometheus:prometheus /usr/local/bin/prometheus
sudo chown prometheus:prometheus /usr/local/bin/promtool

# Move configuration files and set ownership
sudo mv /tmp/prometheus-2.43.0.linux-amd64/consoles /etc/prometheus
sudo mv /tmp/prometheus-2.43.0.linux-amd64/console_libraries /etc/prometheus
sudo mv /tmp/prometheus-2.43.0.linux-amd64/prometheus.yml /etc/prometheus
sudo chown -R prometheus:prometheus /etc/prometheus
sudo chown -R prometheus:prometheus /var/lib/prometheus

# Create Prometheus systemd service
cat <<EOF | sudo tee /etc/systemd/system/prometheus.service
[Unit]
Description=Prometheus
Wants=network-online.target
After=network-online.target

[Service]
User=prometheus
Group=prometheus
Type=simple
ExecStart=/usr/local/bin/prometheus \
    --config.file /etc/prometheus/prometheus.yml \
    --storage.tsdb.path /var/lib/prometheus/ \
    --web.console.templates=/etc/prometheus/consoles \
    --web.console.libraries=/etc/prometheus/console_libraries

[Install]
WantedBy=multi-user.target
EOF

# Reload systemd
sudo systemctl daemon-reload

# Enable and start Prometheus service
sudo systemctl enable prometheus
sudo systemctl start prometheus

# Allow firewall rule for Prometheus
sudo ufw allow 9090/tcp

# Check Prometheus status
sudo systemctl status prometheus
