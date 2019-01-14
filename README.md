# viossat/lighttpd

lighttpd is a lightweight open-source web server.
https://www.lighttpd.net/

- Alpine-based
- logs to stdout
- suitable for static files
- no TLS support, suitable for reverse proxy
- on startup
  1. files in `$START_PATH` are executed
  2. files in `$CONF_PATH` are concatenated as lighttpd config file
- `$WWW_ROOT` contains the document root

## Usage

```bash
docker run -d -p 80:80 -v /my/website:/var/www/html viossat/lighttpd
```
