#!/bin/bash
PROJECT=$1
if [ -z "$PROJECT" ]; then
  echo "Использование: $0 <имя_проекта>"
  exit 1
fi

mkdir -p "$PROJECT"/{doc,logs,public,src}
echo "# $PROJECT" > "$PROJECT/readme.md"

tree "$PROJECT"
