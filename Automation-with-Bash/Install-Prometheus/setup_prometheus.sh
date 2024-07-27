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

