# Highly Available React.js Application Using Vagrant, HAProxy, and Keepalived

## Infrastructure Overview
- **lb-01** (`192.168.56.10`): HAProxy + Keepalived (Master)
- **lb-02** (`192.168.56.11`): HAProxy + Keepalived (Backup)
- **web-01** (`192.168.56.20`): React.js / Vite (systemd)
- **web-02** (`192.168.56.21`): React.js / Vite (systemd)
- **Virtual IP (VIP)** (`192.168.56.100`): Floating IP managed by VRRP

## Getting Started
1. Clone the repository and navigate into the project root.
2. Run `vagrant up` to provision all four virtual machines.
3. Access the application through the Virtual IP: `http://192.168.56.100`.