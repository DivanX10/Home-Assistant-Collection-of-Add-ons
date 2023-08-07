FROM doitandbedone/ispyagentdvr:4.9.3.0

# Добавим метаданные к образу
LABEL \
  io.hass.version="VERSION" \
  io.hass.type="addon" \
  io.hass.arch="amd64|aarch64|armv7" \
  maintainer="DivanX10"

# Установим пакеты
RUN apt-get update && apt-get install -yqq tini mc nano jq rsync cron && apt-get clean

# Скопируем файлы во внутрь контейнера
COPY scripts/ /tmp

# Установим права на выполнение скриптов
RUN echo "Adding executable permissions" && \
    chmod +x /agent/Agent && \
    chmod +x /agent/agent-register.sh && \
    chmod +x /agent/agent-reset.sh && \
    chmod +x /agent/agent-reset-local-login.sh && \
    chmod +x /tmp/agentdvr.sh && \
    chmod +x /tmp/clone.sh

# Добавим строку в файл /etc/crontab
RUN echo "*/1 * * * * root /bin/bash /tmp/clone.sh" >> /etc/crontab

# Define default environment variables
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
# Fix a memory leak on encoded recording
ENV MALLOC_TRIM_THRESHOLD_=100000

# Main UI port
EXPOSE 8090

# STUN server port
EXPOSE 3478/udp

# TURN server UDP port range
EXPOSE 50000-50010/udp

# Рабочая директория
WORKDIR /agent

# Укажем Tini как PID 1 и зарегистрируем его как subreaper
ENTRYPOINT ["/usr/bin/tini", "-s", "--", "bash", "/tmp/agentdvr.sh"]
