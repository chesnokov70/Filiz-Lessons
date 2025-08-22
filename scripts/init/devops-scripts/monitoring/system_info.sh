#!/bin/bash
LOG_DIR="./logs"
LOG_FILE="$LOG_DIR/system_info.log"
mkdir -p "$LOG_DIR"

log() {
    echo -e "$1" | tee -a "$LOG_FILE"
}

log "===== Системная информация ($(date '+%Y-%m-%d %H:%M:%S')) ====="

log "\n⏱ Uptime:"; uptime | tee -a "$LOG_FILE"
log "\n🚀 Время запуска системы:"; uptime -s | tee -a "$LOG_FILE"

log "\n💻 Версия ОС:"
if [ -f /etc/os-release ]; then
    grep "PRETTY_NAME" /etc/os-release | cut -d= -f2 | tr -d '"' | tee -a "$LOG_FILE"
else uname -a | tee -a "$LOG_FILE"; fi

log "\n🖥 CPU Idle (%):"
if command -v mpstat >/dev/null; then
    mpstat 1 1 | awk 'NR==4 {print $12 "%"}' | tee -a "$LOG_FILE"
else log "mpstat не установлен (sysstat)"; fi

log "\n💾 Память:"; free -h | tee -a "$LOG_FILE"
log "\n💽 Диски:"; df -h --output=source,size,used,avail,pcent,target | column -t | tee -a "$LOG_FILE"

log "\n🌡 Температура CPU:"
if command -v sensors >/dev/null; then sensors | grep -E "Package id|Tctl|CPU Temp" | tee -a "$LOG_FILE"; fi

log "\n🎮 Температура GPU:"
if command -v nvidia-smi >/dev/null; then nvidia-smi --query-gpu=gpu_name,temperature.gpu --format=csv,noheader | tee -a "$LOG_FILE"; fi

log "\n===== Конец отчёта =====\n"
