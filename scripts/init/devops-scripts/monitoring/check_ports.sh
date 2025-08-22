#!/bin/bash
ports=(22 80 443)

for port in "${ports[@]}"; do
  nc -zv localhost $port >/dev/null 2>&1 \
    && echo "✅ Порт $port доступен" \
    || echo "❌ Порт $port закрыт"
done
