#!/bin/bash
read -t 1 -p "========== update repo, install epel, set timezone =========="
echo
yum update -y && yum upgrade -y
yum install -y epel-release && \
timedatectl set-timezone Europe/Moscow

read -t 1 -p "========== install utills =========="
echo
yum install -y --enablerepo=epel ntp ntpdate wget mc whois net-tools traceroute mtr sed tree
yum -y install --enablerepo=epel iptables-services wget perl unzip net-tools perl-libwww-perl perl-LWP-Protocol-https perl-GDGraph
ntpdate -s time.nist.gov

read -t 1 -p "========== Install Docker =========="
echo
yum install -y yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce docker-ce-cli containerd.io

read -t 1 -p "========== Install Docker Compose =========="
echo
curl -L "https://github.com/docker/compose/releases/download/1.28.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
systemctl start docker
systemctl enable docker

read -t 1 -p "========== Install CSF =========="
echo
wget https://download.configserver.com/csf.tgz -P /opt

read -t 1 -p "extract archive csf"
echo
tar -xzf /opt/csf.tgz -C /opt 

read -t 1 -p "install csf"
echo
cur_dir=$(pwd)
cd /opt/csf/
chmod 0755 /opt/csf/install.sh 
/opt/csf/install.sh 
cd $cur_dir

read -t 1 -p "remove archive csf"
echo
rm -rf /opt/csf &
rm -rf /opt/csf.tgz &

read -t 1 -p "========== update repo =========="
echo
yum update -y && yum upgrade -y
