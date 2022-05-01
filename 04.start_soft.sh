#!/bin/bash
read -t 1 -p "========== update repo =========="
echo
yum update -y && yum upgrade -y

# read -t 1 -p "========== restart csf =========="
# echo
# csf -r > /dev/null
# sysctl -p

read -t 1 -p "========== docker stop =========="
echo
systemctl stop docker
systemctl stop docker.sock

read -t 3 -p "========== docker start =========="
echo
systemctl start docker.sock

read -t 3 -p "========== docker restart =========="
echo
systemctl restart docker

docker-compose up -d

# read -t 1 -p "========== restart csf =========="
# echo
# csf -r > /dev/null

echo "========== To show a status =========="
echo
systemctl status iptables
systemctl status ip6tables
systemctl status csf
systemctl status docker


