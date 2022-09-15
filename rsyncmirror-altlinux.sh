#!/bin/bash
export RSYNC_PROXY=leninagate.ekaterinburg.fsin.uis:8080
# Sync source
UPSTREAM="mirror.yandex.ru"
UPSTREAM_DIR="altlinux/p9/branch"
LOCAL_DIR="/srv/www/mirror/altlinux/p9/branch"
LOG_FILE="/var/log/mirror-sync/altlinux-update.log"
rsync --verbose --progress --stats --archive --recursive --delete \
--perms --links --times --hard-links --sparse --safe-links \
--exclude='aarch64/' \
--exclude='armh/' \
--exclude='i568/' \
--exclude='ppc64le/' \
--exclude='files/SRPMS/' \
--exclude='files/aarch64/' \
--exclude='files/armh/' \
--exclude='files/i586/' \
--exclude='files/ppc64le/' \
--exclude='noarch/SRPMS.classic/' \
--exclude='x86_64/SRPMS.classic/' \
--log-file="$LOG_FILE" \
"${UPSTREAM}::${UPSTREAM_DIR}/" "$LOCAL_DIR"
