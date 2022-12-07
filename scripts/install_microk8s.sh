#!/bin/bash
# Prerequiste
sudo apt-get update;
sudo apt-get install snapd;

# Step 1: Installing MicroK8s on Ubuntu
sudo snap install microk8s --classic;
# Step 2: Configuring Your Firewall for MicroK8s
sudo ufw allow in on cni0 && sudo ufw allow out on cni0;
sudo ufw default allow routed;
# Step 3: Adding Your User to the MicroK8s Group
sudo usermod -aG microk8s $USER;
sudo chown -f -R $USER ~/.kube;
# newgrp microk8s;
# Enabling Important Addons
microk8s enable dns storage
# install docker
# sudo snap install docker 
