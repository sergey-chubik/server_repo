#!/bin/bash
export RSYNC_PROXY=leninagate.ekaterinburg.fsin.uis:8080
# Sync source
UPSTREAM="ftp.nsc.ru"
release="7"
LOG_FILE="/var/log/mirror-sync/epel-update.log"
rsync --verbose --progress --stats --archive --recursive --delete \
--perms --links --times --hard-links --sparse --safe-links \
--exclude='repo*' \
--log-file="$LOG_FILE" \
"${UPSTREAM}::epel/$release/x86_64/" "/srv/www/mirror/epel/$release/x86_64"
# Update repository info
createrepo --update /srv/www/mirror/epel/$release/x86_64
