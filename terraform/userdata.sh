#!/bin/bash
set -e

apt-get update -y
apt-get install -y nginx git

rm -rf /var/www/html/*
cd /tmp
git clone https://github.com/sam-osung/Charity-Organization-Website-Template.git
cp -r Charity-Organization-Website-Template/* /var/www/html/

systemctl enable nginx
systemctl restart nginx
