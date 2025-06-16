FROM python:3.10-slim

# Установка системных библиотек, необходимых для TTS
RUN apt-get update && apt-get install -y \
    git \
    ffmpeg \
    espeak-ng \
    libsndfile1 \
    build-essential \
    libatlas-base-dev \
    libportaudio2 \
    libffi-dev \
    && rm -rf /var/lib/apt/lists/*

# Копируем requirements.txt
COPY requirements.txt .

# Устанавливаем Python-зависимости
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Копируем код
COPY . /app
WORKDIR /app

# Запускаем сервер (предполагается, что у тебя есть app.py или index.js)
CMD ["python", "app.py"]
