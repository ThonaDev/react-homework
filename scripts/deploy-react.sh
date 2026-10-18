#!/usr/bin/env bash
set -e

APP_DIR="/var/www/react-app"
LOG_DIR="/var/log/react-app"

echo "[+] Preparing directories..."
sudo mkdir -p "$LOG_DIR"
sudo chown -R www-data:www-data "$LOG_DIR"

if [ -d "$APP_DIR/src" ]; then
    echo "[+] Building React application..."
    cd "$APP_DIR"
    npm install
    npm run build
fi

echo "[+] Setting up systemd service..."
sudo cp /vagrant/systemd/react-app.service /etc/systemd/system/react-app.service
sudo systemctl daemon-reload
sudo systemctl enable --now react-app

echo "[+] Deployment complete. Service status:"
sudo systemctl status react-app --no-pager