#!/bin/bash

# Проверяем, что указан аргумент
if [ -z "$1" ]; then
  echo "Использование: $0 <директория>"
  exit 1
fi

DIR="$1"

# Проверяем, существует ли директория
if [ ! -d "$DIR" ]; then
  echo "Ошибка: директория $DIR не существует"
  exit 1
fi

# Имя архива = имя директории + дата
ARCHIVE_NAME="$(basename "$DIR")_$(date +%Y-%m-%d_%H-%M-%S).tar.gz"

# Создаем архив
tar -czf "$ARCHIVE_NAME" -C "$(dirname "$DIR")" "$(basename "$DIR")"

echo "Архив создан: $ARCHIVE_NAME"
