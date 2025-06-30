# Базовый образ
FROM n8nio/n8n:latest

# Устанавливаем рабочую директорию в специальную папку n8n
# Это самая важная строка
WORKDIR /home/node/.n8n

# Переключаемся на root для установки
USER root

# Устанавливаем пакет. Так как мы в /home/node/.n8n,
# он создаст здесь папку node_modules, которую n8n увидит
RUN npm install @tavily/n8n-nodes-tavily

# ВАЖНО: Возвращаем права на всю папку .n8n пользователю node
RUN chown -R node:node /home/node/.n8n

# Возвращаемся к пользователю node для запуска
USER node
