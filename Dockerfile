FROM alpine:3.4
MAINTAINER Mathieu Viossat <mathieu@viossat.fr>

ENV WWW_ROOT=/var/www/html \
	START_PATH=/usr/local/bin/start.d

RUN apk add --no-cache lighttpd \
	&& mkdir -p $START_PATH \
	&& sed -i '/ )/i, ""              =>      "application/octet-stream"' /etc/lighttpd/mime-types.conf \
	&& rm -rf /var/www/localhost

COPY lighttpd.conf /etc/lighttpd
COPY start.sh /usr/local/bin

VOLUME $WWW_ROOT /var/log/lighttpd

WORKDIR $WWW_ROOT

EXPOSE 80

CMD ["start.sh"]
