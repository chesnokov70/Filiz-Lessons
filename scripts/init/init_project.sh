#!/bin/bash

# Проверяем, что передан аргумент
if [ -z "$1" ]; then
  echo "Использование: $0 <имя_проекта>"
  exit 1
fi

PROJECT_NAME="$1"

# Создаем корневую директорию
mkdir -p "$PROJECT_NAME"

# Переходим внутрь
cd "$PROJECT_NAME" || exit 1

# Создаем подкаталоги
mkdir -p doc logs public src

# Создаем файл readme.md
if [ ! -f readme.md ]; then
  echo "# $PROJECT_NAME" > readme.md
  echo "Проект инициализирован: $(date)" >> readme.md
fi

echo "Структура проекта $PROJECT_NAME создана:"
tree .
