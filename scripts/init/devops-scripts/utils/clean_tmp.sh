#!/bin/bash
find /tmp -type f -mtime +3 -delete
echo "✅ Старые файлы в /tmp удалены"
