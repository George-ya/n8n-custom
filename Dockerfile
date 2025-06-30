# Используем официальный образ n8n как основу
FROM n8nio/n8n:latest

# Переключаемся на пользователя root, чтобы получить права на установку
USER root

# Копируем наш файл с зависимостями внутрь контейнера
COPY packages.json .

# Устанавливаем все пакеты, перечисленные в packages.json
# --legacy-peer-deps решает возможные конфликты версий
RUN npm install --production --legacy-peer-deps

# Возвращаемся к безопасному пользователю node для запуска n8n
USER node
