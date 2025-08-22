#!/bin/bash
LOG_DIR=${1:-/var/log/myapp}
find "$LOG_DIR" -type f -name "*.log" -mtime +7 -exec gzip {} \;
echo "Старые логи в $LOG_DIR заархивированы"
