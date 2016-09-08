FROM alpine:3.4
MAINTAINER Mathieu Viossat <mathieu@viossat.fr>

ENV WWW_ROOT=/var/www/html \
	CONF_PATH=/etc/lighttpd/conf.d \
	START_PATH=/usr/local/bin/start.d

RUN apk add --no-cache lighttpd \
	&& sed -i '/ )/i, ""              =>      "application/octet-stream"' /etc/lighttpd/mime-types.conf \
	&& rm -rf /var/www/localhost
RUN mkdir -p $CONF_PATH $START_PATH

COPY 10-basic.conf $CONF_PATH
COPY run.sh /usr/local/bin

WORKDIR $WWW_ROOT

EXPOSE 80

CMD ["run.sh"]
