#!/usr/bin/env python3
import os
import sys
import tarfile
from datetime import datetime

if len(sys.argv) < 2:
    print(f"Использование: {sys.argv[0]} <директория>")
    sys.exit(1)

directory = sys.argv[1]

if not os.path.isdir(directory):
    print(f"Ошибка: директория {directory} не существует")
    sys.exit(1)

archive_name = f"{os.path.basename(directory)}_{datetime.now().strftime('%Y-%m-%d_%H-%M-%S')}.tar.gz"

with tarfile.open(archive_name, "w:gz") as tar:
    tar.add(directory, arcname=os.path.basename(directory))

print(f"Архив создан: {archive_name}")
