# 1. Берем чистый n8n
FROM n8nio/n8n:latest

# 2. Переключаемся на root, чтобы получить все права
USER root

# 3. Создаем ОТДЕЛЬНУЮ папку для кастомных нод, которую не затронет том
RUN mkdir -p /opt/custom-nodes

# 4. Устанавливаем рабочую директорию в эту новую папку
WORKDIR /opt/custom-nodes

# 5. Устанавливаем ноду прямо из GitHub в эту папку
RUN npm install git+https://github.com/tavily-ai/tavily-n8n-node.git

# 6. Делаем пользователя 'node' владельцем этой папки
RUN chown -R node:node /opt/custom-nodes

# 7. Возвращаемся к безопасному пользователю для запуска n8n
USER node
