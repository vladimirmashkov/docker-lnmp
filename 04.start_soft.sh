#!/bin/bash
read -t 1 -p "========== update repo =========="

yum update -y && yum upgrade -y

read -t 1 -p "========== restart csf =========="

csf -r
sysctl -p

read -t 1 -p "========== docker stop =========="

systemctl stop docker
systemctl stop docker.sock

read -t 3 -p "========== docker start =========="

systemctl start docker.sock

read -t 3 -p "========== docker restart =========="

systemctl restart docker

systemctl enable docker-compose-ocserv
systemctl start docker-compose-ocserv

docker-compose up -d

echo "========== To show a status =========="

systemctl status iptables
systemctl status ip6tables
systemctl status csf
systemctl status docker
