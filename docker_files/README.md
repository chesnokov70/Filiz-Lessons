docker run -d \
  --name php-web-1 \
  -p 8000:80 \
  -v "$(pwd)/index.php":/var/www/html/index.php \
  php:8.2-apache
📌 Объяснение:
--name php-web-1 — имя контейнера
-p 8000:80 — проброс порта (localhost:8000 → контейнер:80)

-v "$(pwd)/index.php":/var/www/html/index.php — bind mount файла

Обрати внимание, что файл должен находиться по пути html/index.php, т.к. Apache в этом образе ищет корень сайта в /var/www/html/.
curl -I 127.0.0.1:8000
#--------------------------------------------
docker run --rm \  -v "$PWD/hello.py:/app/hello.py" \
  python:3.11 \
  python3 /app/hello.py

Hello, root you inside in 4ad77b72582a
#---------------------------------------
docker run -dit \
  --name phpinfo-1 \
  -v "$PWD/info.php":/app/info.php \
  php:latest
-dit — запустить интерактивный контейнер в фоне.

--name phpinfo-1 — имя контейнера.

-v "$PWD/info.php":/app/info.php — bind-mount файла в контейнер.

✅ 3. Зайди внутрь контейнера
bash
Copy
Edit
docker exec -it phpinfo-1 bash
✅ 4. Выполни команду в контейнере
bash
Copy
Edit
php /app/info.php

