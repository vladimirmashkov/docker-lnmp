# docker-lnmp

```shell
git fetch --all && git reset --hard origin/main && docker-compose up -d

clear && docker exec -it nginx error_log  /var/log/nginx/nginx_error.log  warn;
```

```shell
# Try this command to get only error.log:
clear && docker logs -f nginx 1>/dev/null

# And this one for access.log:
clear && docker logs -f nginx 2>/dev/null
```