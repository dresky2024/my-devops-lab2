#!/bin/bash
# 1. Меняем текст в файле
echo "<h1>XXNB Updated at $(date)</h1>" > index.html
# 2. Пересобираем образ
docker build -t my-app:v2 .
# 3. Останавливаем и удаляем старый контейнер
docker stop running-app
docker rm running-app
# 4. Запускаем новый
docker run -d -p 9000:80 --name running-app my-app:v2
