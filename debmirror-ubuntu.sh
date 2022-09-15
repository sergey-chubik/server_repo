#!/bin/bash
export RSYNC_PROXY=leninagate.ekaterinburg.fsin.uis:8080
# Sync source
arch=amd64
release=focal,focal-updates,focal-security,focal-backports
section=main,restricted,universe,multiverse
server=mirror.yandex.ru
inPath=ubuntu
proto=rsync
outPath=/srv/www/mirror/ubuntu/
rsync_log=/var/log/mirror-sync/ubuntu-update.log
debmirror --arch $arch \
--passive --progress --nosource --i18n \
--ignore-small-errors --ignore-release-gpg \
--exclude='games' \
--exclude='/Translation-.*\.bz2' \
--include='/Translation-en.*\.bz2' \
--include='/Translation-ru.*\.bz2' \
--section $section --host $server \
--dist $release --method $proto \
--root $inPath $outPath | tee "$rsync_log"
