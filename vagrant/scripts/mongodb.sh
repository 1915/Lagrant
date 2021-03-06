#!/usr/bin/env bash

# SHOULD BE RUN AFTER PHP INSTALL

echo "--- Installing MongoDB ---"
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
sudo apt-get update
sudo apt-get install -y mongodb-10gen
sudo /etc/init.d/mongodb start

echo "--- MongoDB PHP extension ---"
sudo apt-get install -y libsasl2-dev
sudo yes | pecl install mongo
sudo echo "extension=mongo.so" > /etc/php5/fpm/conf.d/mongodb.ini
sudo echo "extension=mongo.so" > /etc/php5/cli/conf.d/mongodb.ini
sudo service php5-fpm restart
# sudo sh -c 'echo "extension=mongo.so" >> /etc/php5/fpm/php.ini'
# sudo sh -c 'echo "extension=mongo.so" >> /etc/php5/cli/php.ini'
