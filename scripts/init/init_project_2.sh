#!/bin/bash
# init_project.sh
# Скрипт для создания структуры DevOps проекта

set -e

# Получаем имя проекта из аргумента
PROJECT_NAME="$1"

if [ -z "$PROJECT_NAME" ]; then
    echo "Usage: $0 <project_name>"
    exit 1
fi

echo "Инициализация проекта: $PROJECT_NAME"

# Создание корневой папки
mkdir -p "$PROJECT_NAME"

# Создание директорий
mkdir -p "$PROJECT_NAME/monitoring"
mkdir -p "$PROJECT_NAME/logs"
mkdir -p "$PROJECT_NAME/ci_cd"
mkdir -p "$PROJECT_NAME/kubernetes"
mkdir -p "$PROJECT_NAME/aws"
mkdir -p "$PROJECT_NAME/security"
mkdir -p "$PROJECT_NAME/utils"

# Создание пустых скриптов
touch "$PROJECT_NAME/README.md"

# Monitoring
touch "$PROJECT_NAME/monitoring/system_info.sh"
touch "$PROJECT_NAME/monitoring/check_services.sh"
touch "$PROJECT_NAME/monitoring/check_ports.sh"

# Logs
touch "$PROJECT_NAME/logs/find_errors.sh"
touch "$PROJECT_NAME/logs/rotate_logs.sh"

# CI/CD
touch "$PROJECT_NAME/ci_cd/build_push.sh"
touch "$PROJECT_NAME/ci_cd/deploy_helm.sh"

# Kubernetes
touch "$PROJECT_NAME/kubernetes/list_failed_pods.sh"
touch "$PROJECT_NAME/kubernetes/restart_deployment.sh"

# AWS
touch "$PROJECT_NAME/aws/s3_backup.sh"
touch "$PROJECT_NAME/aws/list_ec2.sh"

# Security
touch "$PROJECT_NAME/security/check_ports.sh"
touch "$PROJECT_NAME/security/check_sudo.sh"

# Utils
touch "$PROJECT_NAME/utils/init_project.sh"
touch "$PROJECT_NAME/utils/clean_tmp.sh"

echo "Структура проекта $PROJECT_NAME успешно создана."
