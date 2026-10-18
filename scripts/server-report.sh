#!/usr/bin/env bash

LOG_FILE="/var/log/server-report.log"

{
    echo "========================================"
    echo " Server Report: $(hostname) - $(date)"
    echo "========================================"
    echo "Hostname    : $(hostname)"
    echo "IP Address  : $(hostname -I | awk '{print $1}')"
    echo "Uptime      : $(uptime -p)"
    echo "RAM Usage   : $(free -m | awk 'NR==2{printf "Used: %sMB / Total: %sMB (%.2f%%)", $3, $2, $3*100/$2 }')"
    echo "CPU Load    : $(uptime | awk -F'load average:' '{ print $2 }')"
    echo "Disk Usage  : $(df -h / | awk 'NR==2 {print $3 " / " $2 " (" $5 " used)"}')"
    echo "========================================"
} | tee -a "$LOG_FILE"