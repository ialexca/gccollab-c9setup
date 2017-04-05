#!/bin/bash
# Script to setup gccollab environment on a LAMP c9 workspace

#Clone project from Github into ./gccollab
git clone -b gccollab https://github.com/tbs-sct/gccollab.git ~/workspace/gccollab

#Create data directory for gccollab
mkdir ~/workspace/gccollab_data

#Set rights on project
#  Use ubuntu as owner instead of www-data
chmod 777 ~/workspace/gccollab
chmod 777 ~/workspace/gccollab/engine
chmod 700 ~/workspace/gccollab_data
sudo chown ubuntu:ubuntu ~/workspace/gccollab_data

#Don't need to link current folder in http, current workspace folder 
# is the http folder

#start mysql
mysql-ctl start

#run database script
# Create database and set rights
# BD Name: gccollabdb
# username: gccollab
# password: secret
mysql -u root -e `(dirname $0)`/gccollab-setup.sql

#Rewrite apache conf with gccollab config
sudo a2enmod rewrite
sudo sed -i.bak 's|<\/VirtualHost>|  <Directory \/var\/www\/html\/gccollab>\n    Options Indexes FollowSymLinks MultiViews\n    AllowOverride All\n    Order allow,deny\n    allow from all\n  <\/Directory>\n<\/VirtualHost>|' /etc/apache2/sites-available/000-default.conf

#Restart apache service
sudo service apache2 restart