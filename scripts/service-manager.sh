#!/usr/bin/env bash

ACTION=$1

if [ -z "$ACTION" ]; then
    echo "Usage: $0 {start|stop|restart|status}"
    exit 1
fi

case "$ACTION" in
    start|stop|restart|status)
        echo "[+] Executing systemctl $ACTION react-app..."
        sudo systemctl "$ACTION" react-app
        ;;
    *)
        echo "Invalid action: $ACTION"
        echo "Usage: $0 {start|stop|restart|status}"
        exit 1
        ;;
esac