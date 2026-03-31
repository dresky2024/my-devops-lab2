#!/bin/bash

# 1. Генерируем новый контент с текущей датой и временем
echo "<h1>XXNB Site updated at: $(date)</h1><p>Deploy automated by Bash!</p>" > index.html

# 2. Пересобираем Docker-образ с новым тегом (версией)
docker build -t my-app:latest .

# 3. Останавливаем и удаляем старый контейнер, если он запущен
docker stop running-app || true
docker rm running-app || true

# 4. Запускаем обновленный контейнер
docker run -d -p 9000:80 --name running-app my-app:latest

echo "Successfully deployed!"
