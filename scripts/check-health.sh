#!/usr/bin/env bash

SERVERS=("192.168.56.20" "192.168.56.21")

echo "=== Backend Health Status Check ==="
for server in "${SERVERS[@]}"; do
    STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://$server:3000/health || echo "DOWN")
    if [ "$STATUS" -eq 200 ]; then
        echo "[UP] Server $server is healthy (HTTP 200)"
    else
        echo "[DOWN] Server $server is unreachable or returning status $STATUS"
    fi
done