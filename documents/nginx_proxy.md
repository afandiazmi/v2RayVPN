# 1. Open the Nginx configuration file

```
vim /etc/nginx/conf.d/alone.conf
```

# 2. Add configuration

- If you need to configure HTTP1.1, find the server where port 31300 is located [the end of the file, not the one that returns 403]
- To configure HTTP2.0, find the server where port 31302 is located

> The configuration of HTTP1.1 reverse proxy is used as an example below

```
# If you want to add to the root route, add it under localtion/
location / {
add_header Strict-Transport-Security "max-age=15552000; preload" always;
proxy_pass http://127.0.0.1:3003/;
}

# If you only need to add an additional path, write an additional location, the path can be customized
location /test {
proxy_pass http://127.0.0.1:3003/;
}

# Complete configuration, HTTP2.0 is the same, just write to the server where port 31302 is located
server {
listen 127.0.0.1:31300;
server_name xx;
root /usr/share/nginx/html;
location /s/ {
add_header Content-Type text/plain;
alias /etc/v2ray-agent/subscribe/;
}
location / {
add_header Strict-Transport-Security "max-age=15552000; preload" always;
proxy_pass http://127.0.0.1:3003/;
}
     location /test {
proxy_pass http://127.0.0.1:3003/;
}
}
```
