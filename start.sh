#!/bin/sh
set -e

touch /var/log/lighttpd/error.log /var/log/lighttpd/access.log
chown -R lighttpd /var/log/lighttpd && chmod u+rw -R /var/log/lighttpd
chown -R lighttpd "$WWW_ROOT" && chmod u+r -R "$WWW_ROOT"
tail -f /var/log/lighttpd/error.log /var/log/lighttpd/access.log &

exec lighttpd -D -f /etc/lighttpd/lighttpd.conf
