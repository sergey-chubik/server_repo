#!/bin/bash
export RSYNC_PROXY=leninagate.ekaterinburg.fsin.uis:8080
# Sync source
UPSTREAM="mirror.yandex.ru"
release="7"
repolist="os updates extras centosplus"
LOG_FILE="/var/log/mirror-sync/centos-update.log"
for repo in $repolist
do
rsync --verbose --progress --stats --archive --recursive --delete \
--perms --links --times --hard-links --sparse --safe-links \
--exclude='repo*' \
--log-file="$LOG_FILE" \
"${UPSTREAM}::centos/$release/$repo/x86_64/" "/srv/www/mirror/centos/$release/$repo/x86_64"
done
# Update repository info
for repo in $repolist
do
createrepo --update /srv/www/mirror/centos/$release/$repo/x86_64
done
