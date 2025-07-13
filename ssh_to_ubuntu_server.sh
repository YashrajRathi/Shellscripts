#!/bin/bash

echo "Enter IP address of ubuntu server"
read ubuntu_ip_address

ssh -i ~/temp.pem ubuntu@$ubuntu_ip_address "curl -O https://raw.githubusercontent.com/usernameRathi/kubernetes_understanding/refs/heads/main/download_needed_scripts.sh; chmod 777 download_needed_scripts.sh;"

ssh -i ~/temp.pem ubuntu@$ubuntu_ip_address 
