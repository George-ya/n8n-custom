# 1. Берем чистый n8n
FROM n8nio/n8n:latest

# 2. Переключаемся на root, чтобы получить все права
USER root

# 3. Устанавливаем git, чтобы скачать код с GitHub
RUN apk add --no-cache git

# 4. ВАЖНО: Переходим в папку, где лежат все основные пакеты n8n
WORKDIR /usr/local/lib/node_modules/n8n/node_modules

# 5. Клонируем ноду Tavily прямо сюда
RUN git clone https://github.com/tavily-ai/tavily-n8n-node.git @tavily/n8n-nodes-tavily

# 6. Переходим в папку со скачанной нодой
WORKDIR /usr/local/lib/node_modules/n8n/node_modules/@tavily/n8n-nodes-tavily

# 7. Устанавливаем зависимости, которые нужны самой ноде Tavily
RUN npm install --production

# 8. Возвращаемся к безопасному пользователю для запуска n8n
USER node
