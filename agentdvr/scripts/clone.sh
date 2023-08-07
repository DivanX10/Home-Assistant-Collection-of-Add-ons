#!/bin/bash

# Извлекаем значение "folder_path" из файла options.json
FOLDER_PATH=$(jq -r '.folder_path' < /data/options.json)

# Путь к папке с файлами на хосте (папка share/agentdvr)
HOST_MEDIA_DIR="$FOLDER_PATH/Media"
HOST_XML_DIR="$FOLDER_PATH/XML"
HOST_COMMANDS_DIR="$FOLDER_PATH/Commands"

# Путь к папке с файлами внутри контейнера
DOCKER_MEDIA_DIR="/agent/Media"
DOCKER_XML_DIR="/agent/XML"
DOCKER_COMMANDS_DIR="/agent/Commands"

# Функция для копирования измененных файлов
copy_files() {
    # Копируем только измененные файлы из папок на хосте в контейнер
    rsync -avh --update "$DOCKER_MEDIA_DIR/" "$HOST_MEDIA_DIR"
    rsync -avh --update "$DOCKER_XML_DIR/" "$HOST_XML_DIR"
    rsync -avh --update "$DOCKER_COMMANDS_DIR/" "$HOST_COMMANDS_DIR"
}

# Копируем файлы с папки в Home Assistant в контейнер
copy_files

