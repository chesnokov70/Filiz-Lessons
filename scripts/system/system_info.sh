#!/bin/bash

LOG_DIR="./logs"
LOG_FILE="$LOG_DIR/system_info.log"

# Создаём каталог logs, если его нет
mkdir -p "$LOG_DIR"

# Функция записи и вывода
log() {
    echo -e "$1" | tee -a "$LOG_FILE"
}

log "===== Системная информация ($(date '+%Y-%m-%d %H:%M:%S')) ====="

# Время работы системы
log "\n⏱ Uptime:"
uptime | tee -a "$LOG_FILE"

# Время последнего запуска системы
log "\n🚀 Время запуска системы:"
uptime -s | tee -a "$LOG_FILE"

# Версия ОС
log "\n💻 Версия ОС:"
if [ -f /etc/os-release ]; then
    grep -E "PRETTY_NAME" /etc/os-release | cut -d= -f2 | tr -d '"' | tee -a "$LOG_FILE"
else
    uname -a | tee -a "$LOG_FILE"
fi

# CPU Idle (%)
log "\n🖥 CPU Idle (%):"
if command -v mpstat >/dev/null 2>&1; then
    mpstat 1 1 | awk 'NR==4 {print $12 "%"}' | tee -a "$LOG_FILE"
else
    log "mpstat не установлен (установите пакет sysstat)"
fi

# Использование памяти
log "\n💾 Использование памяти:"
free -h | tee -a "$LOG_FILE"

# Использование дисков
log "\n💽 Использование дисков:"
df -h --output=source,size,used,avail,pcent,target | column -t | tee -a "$LOG_FILE"

# Температура CPU
log "\n🌡 Температура CPU:"
if command -v sensors >/dev/null 2>&1; then
    sensors | grep -E "Package id 0:|Tctl:|CPU Temp" || sensors | head -n 10 | tee -a "$LOG_FILE"
else
    log "sensors не установлен (установите пакет lm-sensors)"
fi

# Температура GPU (NVIDIA)
log "\n🎮 Температура GPU:"
if command -v nvidia-smi >/dev/null 2>&1; then
    nvidia-smi --query-gpu=gpu_name,temperature.gpu --format=csv,noheader | tee -a "$LOG_FILE"
else
    log "nvidia-smi не установлен или GPU NVIDIA отсутствует"
fi

log "\n===== Конец отчёта =====\n"
