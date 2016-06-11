FROM alpine:3.4
MAINTAINER Mathieu Viossat <mathieu@viossat.fr>

RUN apk add --no-cache lighttpd

COPY lighttpd.conf /etc/lighttpd
COPY start.sh /usr/local/bin

ENV WWW_ROOT /var/www/html

VOLUME $WWW_ROOT /var/log/lighttpd

WORKDIR $WWW_ROOT

EXPOSE 80

CMD ["start.sh"]
