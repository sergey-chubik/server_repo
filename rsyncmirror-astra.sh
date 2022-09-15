#!/bin/bash
export RSYNC_PROXY=leninagate.ekaterinburg.fsin.uis:8080
# Sync source
UPSTREAM="mirror.yandex.ru"
UPSTREAM_DIR="astra/stable/orel/repository"
LOCAL_DIR="/srv/www/mirror/astra/stable/orel/repository"
LOG_FILE="/var/log/mirror-sync/astra-update.log"
rsync --verbose --progress --stats --archive --recursive --delete \
--perms --links --times --hard-links --sparse --safe-links \
--log-file="$LOG_FILE" \
"${UPSTREAM}::${UPSTREAM_DIR}/" "$LOCAL_DIR"
