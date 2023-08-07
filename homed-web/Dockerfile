# Используем базовый образ
FROM docker.u236.org/homed-web

# Добавим метаданные к образу
LABEL \
  io.hass.version="VERSION" \
  io.hass.type="addon" \
  io.hass.arch="amd64|aarch64|armv7" \
  maintainer="u236"

# Установим пакеты tini, mc, nano, jq
RUN apt-get update && apt-get install -y tini mc nano jq

# Скопируем файлы во внутрь контейнера
COPY run_homed_web.sh /tmp
#COPY homed-web.conf /etc/homed

# Установим права на выполнение скрипта
RUN chmod +x /tmp/run_homed_web.sh

# Укажем Tini как PID 1 и зарегистрируем его как subreaper
ENTRYPOINT ["/usr/bin/tini", "-s", "--", "bash", "/tmp/run_homed_web.sh"]
