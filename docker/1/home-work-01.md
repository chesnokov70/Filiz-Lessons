# Часть 1
1) Установить docker
2) Проверить установку
```bash
docker --version
sudo docker run hello-world
```
3) Запустить контейнер с ubuntu и именем my-ubuntu
```bash
sudo docker run -it -d --name my-ubuntu ubuntu bash
```
Зайти в контейнер 
```bash
sudo docker exec -it my-ubuntu bash
```
Внутри контейнера установить nano и проверить его работу, создав в директории /opt файл hello с содержимым
```txt
Hello from Ubuntu container
```
выйти из контейнера
```bash
exit
```
4) Остановить контейнер
```bash
sudo docker stop my-ubuntu
```
5) Проверить через
```bash
sudo docker ps
sudo docker ps -a
```
6) Запустить контейнер
```bash
sudo docker start my-ubuntu
```
7) Остановить и удалить контейнер
```bash
sudo docker stop my-ubuntu
sudo docker rm my-ubuntu
```
# Часть 2
Как правильно запустить контейнер Debian, чтобы он не завершался:
Сессия bash:

bash
Copy
Edit
docker run -it --name my-debian debian bash
Это даст интерактивную консоль внутри контейнера.

В фоне с sleep:


docker run -d --name my-debian debian sleep infinity
Контейнер останется активным, пока вы его не остановите.

С tail -f /dev/null (тоже чтобы “держать” процесс):

bash
Copy
Edit
docker run -d --name my-debian debian tail -f /dev/null
apt update
apt install -y procps
Пакет procps включает команды типа ps, top, uptime и т.д.
