#!/bin/bash
LOGFILE=${1:-/var/log/syslog}
echo "Последние ошибки в $LOGFILE:"
grep -i "error" $LOGFILE | tail -n 20
