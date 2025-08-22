#!/bin/bash
services=("nginx" "docker" "kubelet")

for svc in "${services[@]}"; do
  systemctl is-active --quiet $svc \
    && echo "✅ $svc работает" \
    || echo "⚠️ $svc не запущен"
done
