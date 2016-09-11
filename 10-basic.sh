#!/bin/sh
set -e

sed -i '/ )/i, ""              =>      "application/octet-stream"' /etc/lighttpd/mime-types.conf
