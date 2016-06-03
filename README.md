# viossat/lighttpd

lighttpd is a lightweight open-source web server.
https://www.lighttpd.net/

- Alpine-based, 6.6 MB
- logging enabled
- suitable for static files
- no TLS support, suitable for reverse proxy

## Usage

```bash
docker run -d -p 80:80 -v /my/website:/var/www/html viossat/lighttpd
```
