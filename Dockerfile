FROM node:18

# Установим системные зависимости
RUN apt-get update && apt-get install -y \
    python3-pip \
    ffmpeg \
    espeak-ng \
    libsndfile1 \
    git \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Копируем requirements
COPY requirements.txt .

# Устанавливаем Python зависимости
RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt

# Копируем Node.js код
WORKDIR /app
COPY . .

# Устанавливаем Node.js зависимости
RUN npm install

# Стартуем сервер
CMD ["npm", "start"]
