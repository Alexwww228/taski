# Используем Python для бэкенда
FROM python:3.13-slim as backend-build

# Устанавливаем зависимости системы
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Устанавливаем Node для фронтенда
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - \
    && apt-get install -y nodejs

# Рабочая директория
WORKDIR /app

# Копируем файлы проекта
COPY backend/ ./backend
COPY frontend/ ./frontend
COPY requirements.txt ./requirements.txt

# Устанавливаем Python-зависимости
RUN pip install --no-cache-dir -r requirements.txt

# Собираем фронтенд
WORKDIR /app/frontend
RUN npm install
RUN npm run build

# Копируем фронтенд билды в Django
RUN cp -r build/* ../backend/frontend/build/

# Финальный образ
FROM python:3.13-slim

WORKDIR /app
COPY --from=backend-build /app/backend ./backend
COPY --from=backend-build /app/backend/frontend/build ./backend/frontend/build

# Устанавливаем Python-зависимости
COPY requirements.txt ./requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

WORKDIR /app/backend
EXPOSE 8000

# Запуск Django
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
