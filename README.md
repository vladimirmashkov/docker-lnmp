# docker-lnmp

```shell
sudo su
read -t 1
cd /root
read -t 1

docker-compose down
rm -f docker-compose.yaml

yum install -y git
git clone https://github.com/vladimirmashkov/docker-lnmp.git
cd docker-lnmp/
git checkout origin/main
git checkout main
```

```shell
useradd -m ip_checker
# usermod -aG docker ip_checker
mkdir -p -m 0644 /home/ip_checker/.ssh/
chmod 700 /home/ip_checker/.ssh/
touch /home/ip_checker/.ssh/authorized_keys
cat etc/ip_checker.pub > /home/ip_checker/.ssh/authorized_keys
chmod 600 /home/ip_checker/.ssh/authorized_keys
chown ip_checker:ip_checker /home/ip_checker/.ssh/ -R
echo "ip_checker" | passwd ip_checker --stdin
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