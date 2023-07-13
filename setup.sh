#!/bin/bash
DMS=$(ip route get 8.8.8.8 | awk -F"src " 'NR==1{split($2,a," ");print a[1]}')
sed -i  "s/10.0.0.19/${DMS}/" ~/DMS/dms-server/confd.conf

sudo apt update
sudo apt install mysql-server

python3 -m pip install -y mysql-connector-python paramiko configparser 