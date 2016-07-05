#!/bin/sh
set -eu

chown -R lighttpd /var/log/lighttpd && chmod -R u+rw /var/log/lighttpd
chown -R lighttpd $WWW_ROOT && chmod u+r -R $WWW_ROOT
tail -F -n 0 /var/log/lighttpd/access.log /var/log/lighttpd/error.log 2> /dev/null &

find $START_PATH -type f -exec {} \;

exec lighttpd -D -f /etc/lighttpd/lighttpd.conf
