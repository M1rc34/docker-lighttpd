FROM alpine:3.8

ENV WWW_ROOT=/var/www/html \
	CONF_PATH=/etc/lighttpd/conf.d \
	START_PATH=/usr/local/bin/start.d

RUN apk add --no-cache lighttpd \
	&& rm -rf /var/www/localhost \
	&& mkdir -p $CONF_PATH $START_PATH

COPY 10-basic.conf 11-compress.conf $CONF_PATH/
COPY run.sh /usr/local/bin

WORKDIR $WWW_ROOT

EXPOSE 80

ENTRYPOINT ["run.sh"]
CMD ["lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]
