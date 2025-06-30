# Используем официальный образ n8n как основу
FROM n8nio/n8n:latest

# Переключаемся на пользователя root для установки
USER root

# Устанавливаем git, так как он нужен для скачивания с GitHub
RUN apk add --no-cache git

# Скачиваем исходный код ноды с GitHub, переходим в папку и "привязываем" ее
RUN git clone https://github.com/tavily-ai/tavily-n8n-node.git \
    && cd tavily-n8n-node \
    && npm link

# Возвращаемся к безопасному пользователю node для запуска
USER node
