# 1. Берем чистый n8n
FROM n8nio/n8n:latest

# 2. Переключаемся на root
USER root

# 3. Устанавливаем git
RUN apk add --no-cache git

# 4. Создаем НОВУЮ, НЕЗАВИСИМУЮ папку в /opt
RUN mkdir -p /opt/custom-nodes

# 5. Переходим в нее
WORKDIR /opt/custom-nodes

# 6. Клонируем ноду сюда
RUN git clone https://github.com/tavily-ai/tavily-n8n-node.git .

# 7. Устанавливаем ее зависимости
RUN npm install --production

# 8. Возвращаемся к пользователю node
USER node
