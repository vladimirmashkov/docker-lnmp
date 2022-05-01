#!/bin/bash

useradd -m ip_checker
# usermod -aG docker ip_checker
mkdir -p -m 0644 /home/ip_checker/.ssh/
chmod 700 /home/ip_checker/.ssh/
touch /home/ip_checker/.ssh/authorized_keys
cat etc/ip_checker.pub > /home/ip_checker/.ssh/authorized_keys
chmod 600 /home/ip_checker/.ssh/authorized_keys
chown ip_checker:ip_checker /home/ip_checker/.ssh/ -R
echo "ip_checker" | passwd ip_checker --stdin
