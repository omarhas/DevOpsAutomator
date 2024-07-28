#!/bin/bash 
sudo apt update -y
sudo apt upgrade -y

# install required packages 
sudo apt install -y apt-transport-https software-properties-common wget

#Add Grafana gpg key
sudo mkdir -p /etc/apt/keyrings/
wget -q -O - https://apt.grafana.com/gpg.key | gpg --dearmor | sudo tee /etc/apt/keyrings/grafana.gpg > /dev/null

#Add grafana Apt Repos
echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list
sudo apt update

#Install Grafana
sudo apt install grafana

#start Grafana as service 
sudo systemctl start grafana-server
sudo systemctl enable grafana-server

#Allow port on firewall 
sudo ufw enable 
sudo ufw allow ssh
sudo ufw allow 3000/tcp
