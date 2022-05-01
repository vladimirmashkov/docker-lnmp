#!/bin/bash
read -t 1 -p "========== disable firewalld =========="
echo
systemctl disable firewalld
systemctl stop firewalld

read -t 1 -p "========== enable iptables =========="
echo
touch /etc/sysconfig/iptables
touch /etc/sysconfig/iptables6
systemctl start iptables
systemctl start ip6tables
systemctl enable iptables
systemctl enable ip6tables

read -t 1 -p "========== config csf =========="
echo

yes | cp -rf etc/csfpre.sh /etc/csf/csfpre.sh
chmod 0755 /etc/csf/csfpre.sh

sed -i 's/ICMP_IN = "1"/ICMP_IN = "0"/g' /etc/csf/csf.conf
sed -i 's/TESTING = "1"/TESTING = "0"/g' /etc/csf/csf.conf
sed -i 's/TESTING_INTERVAL = "5"/TESTING_INTERVAL = "0"/g' /etc/csf/csf.conf

sed -i 's/TCP_IN = "20,21,22,25,53,80,110,143,443,465,587,993,995"/TCP_IN = "20,21,22,25,53,80,110,143,443,465,587,593,993,995"/g' /etc/csf/csf.conf
sed -i 's/TCP_OUT = "20,21,22,25,53,80,110,113,443,587,993,995"/TCP_OUT = "20,21,22,25,53,80,110,113,443,587,593,993,995,3306"/g' /etc/csf/csf.conf
sed -i 's/UDP_OUT = "20,21,53,113,123"/UDP_OUT = "20,21,53,113,123,3360"/g' /etc/csf/csf.conf

read -t 1 -p "========== enable csf =========="
echo
systemctl enable csf
systemctl start csf


read -t 1 -p "========== extract database ip_checker.tar.gz =========="
echo
echo
cur_dir=$(pwd)
cd /root/
tar -xzf ip_checker.tar.gz 
cd $cur_dir



