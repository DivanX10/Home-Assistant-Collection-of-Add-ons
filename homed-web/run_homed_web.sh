#!/usr/bin/with-contenv bash

# Путь к файлу homed-web.conf внутри контейнера
DOCKER_HOMED_CONF="/data/homed-web.conf"

# Извлекаем значение "config_web" из файла options.json
CONFIG_PATH=$(jq -r '.config_web' < /data/options.json)

# Если значение не определено или пусто, используем значение по умолчанию
if [ -z "$CONFIG_PATH" ]; then
    CONFIG_PATH="/config/homed"
fi

# Путь к файлу homed-zigbee.conf на хосте (папка config/homed)
HOST_HOMED_CONF="$CONFIG_PATH/homed-web.conf"

# Проверяем, существует ли файл homed-zigbee.conf на хосте
if [ -f "$HOST_HOMED_CONF" ]; then
    # Копируем содержимое файла на хосте в новый файл внутри контейнера
    cat "$HOST_HOMED_CONF" > "$DOCKER_HOMED_CONF"
else
    # Создаем пустой файл homed-zigbee.conf, если его нет на хосте
    touch "$DOCKER_HOMED_CONF"
    # Копируем содержимое файла на хосте в новый файл внутри контейнера
    cat "$DOCKER_HOMED_CONF" > "$HOST_HOMED_CONF"
fi

# Запускаем homed-web
exec /usr/bin/homed-web

# Вечный процесс для предотвращения завершения контейнера
#tail -f /dev/null
