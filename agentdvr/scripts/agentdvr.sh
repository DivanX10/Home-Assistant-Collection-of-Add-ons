#!/bin/bash

# Запускаем cron во фоновом режиме и ждем его завершения
cron -f &

# Извлекаем значение "folder_path" из файла options.json
FOLDER_PATH=$(jq -r '.folder_path' < /data/options.json)

# Путь к папке с файлами внутри контейнера
DOCKER_MEDIA_DIR="/agent/Media"
DOCKER_XML_DIR="/agent/XML"
DOCKER_COMMANDS_DIR="/agent/Commands"

# Путь к папке с файлами на хосте (папка share/agentdvr)
HOST_MEDIA_DIR="$FOLDER_PATH/Media"
HOST_XML_DIR="$FOLDER_PATH/XML"
HOST_COMMANDS_DIR="$FOLDER_PATH/Commands"

# Проверяем, существует ли папка на хосте
if [ ! -d "$HOST_MEDIA_DIR" ]; then
    # Создаем папку на хосте
    mkdir -p "$HOST_MEDIA_DIR"
fi

if [ ! -d "$HOST_XML_DIR" ]; then
    # Создаем папку на хосте
    mkdir -p "$HOST_XML_DIR"
fi

if [ ! -d "$HOST_COMMANDS_DIR" ]; then
    # Создаем папку на хосте
    mkdir -p "$HOST_COMMANDS_DIR"
fi

# Функция для копирования измененных файлов
copy_files() {
    # Копируем только измененные файлы из папок на хосте в контейнер
    rsync -avh --update "$HOST_MEDIA_DIR/" "$DOCKER_MEDIA_DIR"
    rsync -avh --update "$HOST_XML_DIR/" "$DOCKER_XML_DIR"
    rsync -avh --update "$HOST_COMMANDS_DIR/" "$DOCKER_COMMANDS_DIR"
}

# Копируем файлы перед запуском agentdvr
copy_files

# Запускаем agentdvr
exec /agent/Agent
