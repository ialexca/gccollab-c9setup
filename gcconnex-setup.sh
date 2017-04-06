#!/bin/bash
# Script to setup gcconnex environment on a LAMP c9 workspace

#Clone project from Github into ./gcconnex
git clone -b gcconnex https://github.com/tbs-sct/gcconnex.git ~/workspace/gcconnex

#Create data directory for gcconnex
mkdir ~/workspace/gcconnex_data

#Set rights on project
#  Use ubuntu as owner instead of www-data
chmod 777 ~/workspace/gcconnex
chmod 777 ~/workspace/gcconnex/engine
chmod 700 ~/workspace/gcconnex_data
sudo chown ubuntu:ubuntu ~/workspace/gcconnex_data

#Don't need to link current folder in http, current workspace folder 
# is the http folder

#start mysql
mysql-ctl start

#run database script
# Create database and set rights
# BD Name: gcconnexdb
# username: gcconnex
# password: secret
mysql -u root < "`(dirname $0)`/gcconnex-setup.sql"

#Rewrite apache conf with gcconnex config
sudo a2enmod rewrite
sudo sed -i.bak 's|<\/VirtualHost>|  <Directory \/var\/www\/html\/gcconnex>\n    Options Indexes FollowSymLinks MultiViews\n    AllowOverride All\n    Order allow,deny\n    allow from all\n  <\/Directory>\n<\/VirtualHost>|' /etc/apache2/sites-available/000-default.conf

#Restart apache service
sudo service apache2 restart

#Install Mailcatcher
sudo apt-get update
sudo apt-get install -y build-essential software-properties-common
sudo apt-get install -y libsqlite3-dev ruby1.9.1-dev
sudo gem install mailcatcher

#Start mailcatcher
mailcatcher