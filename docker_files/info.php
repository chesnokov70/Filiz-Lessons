<?php
echo "Версия ОС сервера: " . php_uname() . PHP_EOL;
echo "Тип ОС сервера: " . PHP_OS . PHP_EOL;
echo "IP-адрес сервера: " . gethostbyname(gethostname()) . PHP_EOL;
