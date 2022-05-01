# docker-lnmp

```shell
sudo su
read -t 1
cd /root
read -t 1

docker-compose down
read -t 1
rm -f *.yaml
rm -f *.sh

yum install -y git
git clone https://github.com/vladimirmashkov/docker-lnmp.git
cd docker-lnmp/
git checkout origin/main
git checkout main
chmod 755 *.sh
sh main.sh
echo
```


```shell
git fetch --all && git reset --hard origin/main && docker-compose up -d

docker-compose down && git fetch --all && git reset --hard origin/main && docker-compose up -d

clear && docker exec -it nginx error_log  /var/log/nginx/nginx_error.log  warn;
clear && docker exec -it nginx grep datadir /etc/my.cnf

clear && docker exec -it mysql 
```

```shell
# Try this command to get only error.log:
clear && docker logs -f nginx 1>/dev/null

# And this one for access.log:
clear && docker logs -f nginx 2>/dev/null
```