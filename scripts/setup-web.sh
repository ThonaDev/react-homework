#!/usr/bin/env bash
set -e

echo "[+] Updating package lists and installing Node.js & npm..."
sudo apt-get update -y
sudo apt-get install -y curl nodejs npm

echo "[+] Creating application directory and assigning permissions..."
sudo mkdir -p /var/www/react-app
sudo chown -R $USER:$USER /var/www/react-app

echo "[+] Setup completed successfully."